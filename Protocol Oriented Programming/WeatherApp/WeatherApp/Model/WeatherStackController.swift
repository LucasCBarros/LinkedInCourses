//
//  WeatherStackController.swift
//  WeatherApp
//
//  Created by Lucas C Barros on 2024-10-07.
//

import Foundation

private enum API {
    static let key = "5a199cf437729ee14a43ef2cd88ef686"
}

final class WeatherStackController: WebServiceController {
    let fallbackService: WebServiceController?
    init(fallbackService: WebServiceController? = nil) {
        self.fallbackService = fallbackService
    }
    
    func fetchWeatherData(for city: String, completionHandler: @escaping (String?, WebServicesControllerError?) -> Void) {
        let endpoint = "http://api.weatherstack.com/current?access_key=\(API.key)&query=\(city)&units=f"
        
        let safeURLString = endpoint.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        guard let endpointURL = URL(string: safeURLString) else {
            completionHandler(nil, WebServicesControllerError.invalidURL(safeURLString))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: endpointURL) { (data, response, error) in
            guard error == nil else {
                if let fallback = self.fallbackService {
                    fallback.fetchWeatherData(for: city, completionHandler: completionHandler)
                } else {
                    completionHandler(nil, WebServicesControllerError.forwarded(error!))
                }
                return
            }
            
            guard let responseData = data else {
                if let fallback = self.fallbackService {
                    fallback.fetchWeatherData(for: city, completionHandler: completionHandler)
                } else {
                    completionHandler(nil, WebServicesControllerError.invalidPayload(endpointURL))
                }
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let weatherContainer = try decoder.decode(WeatherStackContainer.self, from: responseData)
                
                guard let weatherInfo = weatherContainer.current,
                      let weather = weatherInfo.weather_descriptions?.first,
                      let temperature = weatherInfo.temperature else {
                    completionHandler(nil, WebServicesControllerError.invalidPayload(endpointURL))
                    return
                }
                
                let weatherDescription = "\(weather) \(temperature) F"
                completionHandler(weatherDescription, nil)
                
            } catch let error {
                completionHandler(nil, WebServicesControllerError.forwarded(error))
            }
        }
        dataTask.resume()
    }
}

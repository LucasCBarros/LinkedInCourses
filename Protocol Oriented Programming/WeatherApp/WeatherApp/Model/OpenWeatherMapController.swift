//
//  OpenWeatherMapController.swift
//  WeatherApp
//
//  Created by Lucas C Barros on 2024-10-06.
//

import Foundation

private enum API {
    static let key = "f93596170efbdda49dfe5f361287f6fa"
}

class OpenWeatherMapController: WebServiceController {

    var fallbackService: WebServiceController?
    required init(fallbackService: WebServiceController? = nil) {
        self.fallbackService = fallbackService
    }
    
    func fetchWeatherData(for city: String,
                          completionHandler: @escaping (String?,
                                                        WebServicesControllerError?) -> Void) {
        let endpoint = "https://api.openweathermap.org/data/2.5/find?q=\(city)&units=imperial&appid=\(API.key)"
        
        guard let safeURLString = endpoint.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
              let endpointURL = URL(string: safeURLString) else {
            completionHandler(nil, WebServicesControllerError.invalidURL(endpoint))
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
                let weatherList = try decoder.decode(OpenWeatherMapContainer.self, from: responseData)
                
                guard let weatherInfo = weatherList.list?.first,
                      let weather = weatherInfo.weather.first?.main,
                      let temperature = weatherInfo.main.temp else {
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

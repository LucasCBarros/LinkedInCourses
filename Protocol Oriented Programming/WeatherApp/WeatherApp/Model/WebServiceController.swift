//
//  WebServiceController.swift
//  WeatherApp
//
//  Created by Lucas C Barros on 2024-10-06.
//

import Foundation

public enum WebServicesControllerError: Error {
    case invalidURL(String)
    case invalidPayload(URL)
    case forwarded(Error)
}

public protocol WebServiceController {
    
    init(fallbackService: WebServiceController?)
    
    var fallbackService: WebServiceController? { get }
    
    func fetchWeatherData(for city: String,
                          completionHandler: @escaping (String?, WebServicesControllerError?) -> Void)
}

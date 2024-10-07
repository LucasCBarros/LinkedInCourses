//
//  OpenWeatherMapData.swift
//  WeatherApp
//
//  Created by Lucas C Barros on 2024-10-07.
//

import Foundation

struct OpenWeatherMapContainer: Codable {
    var list: [OpenMapWeatherData]?
}

struct OpenMapWeatherData: Codable {
    var weather: [OpenWeatherMapWeather]
    var main: OpenWeatherMapMain
}

struct OpenWeatherMapWeather: Codable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

struct OpenWeatherMapMain: Codable {
    var temp: Float?
}

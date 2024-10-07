//
//  WeatherStackData.swift
//  WeatherApp
//
//  Created by Lucas C Barros on 2024-10-07.
//

import Foundation

struct WeatherStackContainer: Codable {
    var current: WeatherStackCurrent?
}

struct WeatherStackCurrent: Codable {
    let temperature: Int?
    let weather_descriptions: [String]?
}

struct WeatherStackCondition: Codable {
    var text: String
    var icon: String // image url
}

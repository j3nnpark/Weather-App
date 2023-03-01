//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Jenn Park on 2023-02-28.
//

import Foundation

struct WeatherModel: Codable {
    let data: WeatherData
}

struct WeatherData: Codable {
    let time: Date
    let values: WeatherValue
}

struct WeatherValue: Codable {
    let temperature: Double
    let weatherCode: Int
}

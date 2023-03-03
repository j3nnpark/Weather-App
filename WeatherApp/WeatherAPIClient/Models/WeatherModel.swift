//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Jenn Park on 2023-02-28.
//

import Foundation

struct WeatherModel: Codable {
    let data: WeatherData
    let location: WeatherLocation
}

struct WeatherData: Codable {
    let time: String
    let values: WeatherValue
}

struct WeatherLocation: Codable {
    let lat: Double
    let lon: Double
}

struct WeatherValue: Codable {
    let temperature: Double
    let weatherCode: Int
}

enum WeatherCode: Int {
    case unknown           = 0
    case clear             = 1000
    case mostlyClear       = 1100
    case partlyCloudy      = 1101
    case mostlyCloudy      = 1102
    case cloudy            = 1001
    case fog               = 2000
    case lightFog          = 2100
    case drizzle           = 4000
    case rain              = 4001
    case lightRain         = 4200
    case heavyRain         = 4201
    case snow              = 5000
    case flurries          = 5001
    case lightSnow         = 5100
    case heavySnow         = 5101
    case freezingDrizzle   = 6000
    case freezingRain      = 6001
    case lightFreezingRain = 6200
    case heavyFreezingRain = 6201
    case icePellets        = 7000
    case heavyIcePellets   = 7101
    case lightIcePellets   = 7102
    case thunderstorm      = 8000
    
    var description: String {
        switch self {
        case .clear:
            return "Clear"
        case .mostlyClear:
            return "Mostly Clear"
        case .partlyCloudy:
            return "Partly Cloudy"
        case .mostlyCloudy, .cloudy:
            return "Cloudy"
        case .fog, .lightFog:
            return "Foggy"
        case .drizzle, .lightRain:
            return "Light Rain"
        case .rain:
            return "Rain"
        case .heavyRain:
            return "Heavy Rain"
        case .snow, .lightSnow, .flurries:
            return "Snow"
        case .heavySnow:
            return "Heavy Snow"
        case .freezingDrizzle:
            return "Freezing Drizzle"
        case .freezingRain, .lightFreezingRain, .heavyFreezingRain:
            return "Freezing Rain"
        case .icePellets, .lightIcePellets:
            return "Ice Pellets"
        case .heavyIcePellets:
            return "Heavy Ice Pellets"
        case .thunderstorm:
            return "Thunderstorm"
        default:
            return "Unknown"
        }
    }
    
    var image: 
}

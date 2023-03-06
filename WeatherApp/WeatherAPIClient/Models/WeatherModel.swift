//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Jenn Park on 2023-02-28.
//

import Foundation
import SwiftUI

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
    
    var icon: Image {
        switch self {
        case .clear:
            return Image("10000_clear_large")
        case .mostlyClear:
            return Image("11000_mostly_clear_large")
        case .partlyCloudy:
            return Image("11010_partly_cloudy_large")
        case .mostlyCloudy:
            return Image("11021_mostly_cloudy_large")
        case .cloudy:
            return Image("10010_cloudy_large")
        case .fog:
            return Image("20000_fog_large")
        case .lightFog:
            return Image("21000_fog_light_large")
        case .drizzle:
            return Image("40000_drizzle_large")
        case .lightRain:
            return Image("42000_rain_light_large")
        case .rain:
            return Image("40010_rain_large")
        case .heavyRain:
            return Image("42010_rain_heavy_large")
        case .snow:
            return Image("50000_snow_large")
        case .lightSnow:
            return Image("51000_snow_light_large")
        case .flurries:
            return Image("50010_flurries_large")
        case .heavySnow:
            return Image("51010_snow_heavy_large")
        case .freezingDrizzle:
            return Image("60000_freezing_rain_drizzle_large")
        case .freezingRain:
            return Image("60010_freezing_rain_large")
        case .lightFreezingRain:
            return Image("62000_freezing_rain_light_large")
        case .heavyFreezingRain:
            return Image("62010_freezing_rain_heavy_large")
        case .icePellets:
            return Image("70000_ice_pellets_large")
        case .lightIcePellets:
            return Image("71020_ice_pellets_light_large")
        case .heavyIcePellets:
            return Image("71010_ice_pellets_heavy_large")
        case .thunderstorm:
            return Image("80000_tstorm_large")
        default:
            return Image(systemName: "exclamationmark.triangle")
        }
    }
}

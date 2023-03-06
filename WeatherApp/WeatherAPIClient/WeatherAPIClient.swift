//
//  WeatherAPIClient.swift
//  WeatherApp
//
//  Created by Jenn Park on 2023-02-28.
//

import Foundation
import CoreLocation
import SwiftUI

class WeatherAPIClient: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    @Published var authorizationStatus: CLAuthorizationStatus?
    @Published var weatherTemp: Double = 0
    @Published var weatherDescription: String = ""
    @Published var weather = Weather(temperature: 0, weatherCode: WeatherCode.unknown)
    @Published var weatherCodeIcon: Image = Image(systemName: "timer")
    private var url: URL?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
        
    func fetchWeather(_ url: URL?) async {
        do {
            let (data, _) = try await URLSession.shared.data(from: url!)
            let weatherResponse = try! JSONDecoder().decode(WeatherModel.self, from: data)
            weather = Weather(temperature: (weatherResponse.data.values.temperature).truncate(to: 2),
                              weatherCode: WeatherCode(rawValue: weatherResponse.data.values.weatherCode) ?? WeatherCode.unknown)
            weatherDescription = weather.weatherCode.description
            weatherCodeIcon = weather.weatherCode.icon
        } catch {
            print("[WeatherAPIClient] Error while fetching the weather for given location")
        }
    }
}

extension WeatherAPIClient {
    // CLLocationManagerDelegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            print("[WeatherAPIClient] No location data")
            return
        }
        
        url = URL(string: "https://api.tomorrow.io/v4/weather/realtime?location=\(location.coordinate.latitude),\(location.coordinate.longitude)&fields=temperature&fields=weatherCode&apikey=fI25ykRBmlKKFcBAIT1hDxURky3xaTn5")
        Task {
            await fetchWeather(url)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            authorizationStatus = .notDetermined
            manager.requestWhenInUseAuthorization()
        case .restricted:
            authorizationStatus = .restricted
        case .denied:
            authorizationStatus = .denied
        case .authorizedWhenInUse:
            authorizationStatus = .authorizedWhenInUse
            manager.requestLocation()
        default:
            break
        }
    }
}

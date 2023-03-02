//
//  LocationDataManager.swift
//  WeatherApp
//
//  Created by Jenn Park on 2023-03-01.
//

import Foundation
import CoreLocation

class LocationDataManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    @Published var authorizationStatus: CLAuthorizationStatus?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Tells the delegate that new location data is available
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Function called when location manager fails to retrieve a location value
        print("[LocationDataManager] Error occurred while retrieving location data: \(error)")
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            authorizationStatus = .notDetermined
            manager.requestWhenInUseAuthorization()
        case .restricted: // todo: set behavior when location access restriced or denied
            authorizationStatus = .restricted
        case .denied:
            authorizationStatus = .denied
            break
        case .authorizedWhenInUse:
            authorizationStatus = .authorizedWhenInUse
            manager.requestLocation() // one time location request - change later
        default:
            break
        }
    }
}

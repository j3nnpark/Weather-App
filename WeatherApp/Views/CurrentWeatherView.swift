//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by Jenn Park on 2023-02-28.
//

import SwiftUI

struct CurrentWeatherView: View {
    @StateObject private var weatherAPIClient = WeatherAPIClient()
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                weatherAPIClient.weatherCodeIcon
                Text("\(weatherAPIClient.weather.temperature, specifier: "%.2f")")
            }
            Text("\(weatherAPIClient.weatherDescription)")
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView()
    }
}

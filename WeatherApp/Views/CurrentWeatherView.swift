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
                HStack {
                    Text("\(weatherAPIClient.weather.temperature, specifier: "%.2f")")
                        .font(.system(size: 50, weight: .bold, design: .default))
                    Text("ºC")
                        .font(.system(size: 43, weight: .semibold, design: .default))
                }
                .padding()
            }
            Text("\(weatherAPIClient.weatherDescription)")
                .font(.system(size: 20, weight: .medium, design: .rounded))
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView()
    }
}

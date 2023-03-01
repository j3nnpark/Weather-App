//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by Jenn Park on 2023-02-28.
//

import SwiftUI

struct CurrentWeatherView: View {
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Weather Icon")
                Text("Temperature")
            }
            Text("Weather description")
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView()
    }
}

//
//  Helpers.swift
//  WeatherApp
//
//  Created by Jenn Park on 2023-03-06.
//

import Foundation

extension Double {
    func truncate(to places: Int) -> Double {
        // var testNum = 2.3039533
        // testNum.truncate(to: 2) -> 2.30
        let multiplier = pow(Double(10), Double(places))
        let temp: Int = Int(self * multiplier)
        return Double(temp) / multiplier
    }
}

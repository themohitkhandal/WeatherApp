//
//  Data.swift
//  SwiftUI-Weather
//
//  Created by Mohit Khandal on 28/07/23.
//

import SwiftUI

struct WeatherDataObj: Identifiable {
    var id = UUID()
    var temperature:Int
    var imageName: String
    var dayName: String
}


struct WeatherData {
    static let data = [
        WeatherDataObj(temperature: 32, imageName: "cloud.sun.fill", dayName: "MON"),
        WeatherDataObj(temperature: 30, imageName: "sun.max.fill", dayName: "TUE"),
        WeatherDataObj(temperature: 25, imageName: "wind.snow", dayName: "WED"),
        WeatherDataObj(temperature: 10, imageName: "snow", dayName: "THU"),
        WeatherDataObj(temperature: 35, imageName: "cloud.sun.fill", dayName: "FRI"),
    ]
}


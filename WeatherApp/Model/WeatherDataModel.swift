//
//  WeatherDataModel.swift
//  WeatherApp
//
//  Created by Dionte Silmon on 1/21/20.
//  Copyright © 2020 Dionte Silmon. All rights reserved.
//

import Foundation


class WeatherDataModel {
    
    var temperature = 0
    var city = ""
    var weatherIcon = ""
    var state = ""
    var time = ""
    var statusCode = 0
    var windSpeed = 0
    var windDir = ""
    var humidity = 0
    var weather = ""
    
    func getWeatherCode(code: Int) -> String {

        switch code {
        case 113:
            return "sunny"
        case 116:
            return "partlyCloudy"
        case 119:
            return "cloudy"
        case 122:
            return "overcast"
        case 143:
            return "mist"
        case 176:
            return "patchyRain"
        case 179:
            return "patchySnow"
        case 182:
            return "patchySleet"
        case 185:
            return "patchyFreezeDrizzle"
        case 200:
            return "thundery"
        default:
            return "None"
        }

    }
    
}

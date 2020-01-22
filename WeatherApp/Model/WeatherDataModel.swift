//
//  WeatherDataModel.swift
//  WeatherApp
//
//  Created by Dionte Silmon on 1/21/20.
//  Copyright © 2020 Dionte Silmon. All rights reserved.
//

import Foundation


class WeatherDataModel {
    
    // Properties
    
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
    
    // Check the weather code
    // And return the image asset name
    
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
        case 227:
            return "snow"
        case 230:
            return "snowStorm"
        case 248...260:
            return "fog"
        case 263...266:
            return "lightDrizzle"
        case 281...284:
            return "rain"
        case 293...296:
            return "lightRain"
        case 299...302:
            return "moderateRain"
        case 305...308:
            return "heavyRain"
        case 311:
            return "hail"
        default:
            return "None"
        }

    }
    
}

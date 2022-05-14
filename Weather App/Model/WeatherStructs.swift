//
//  WeatherStructs.swift
//  Weather App
//
//  Created by Sepehr Foroughi Rad on 2/12/22.
//

import Foundation
import SwiftUI


struct WeatherJson: Codable {
    
    let latitude: Double
    let longitude: Double
    let timezone: String
    let timezoneOffset: Double
    let current: CurrentDay
    let daily: [Day]
    
    enum CodingKeys: String, CodingKey {
        
        case latitude = "lat"
        case longitude = "lon"
        case timezone
        case timezoneOffset = "timezone_offset"
        case current
        case daily
        
    }
}

struct CurrentDay: Codable {
    let dt: Int
    let temp: Double
    let feelsLike: Double
    let pressure: Double
    let humidity: Double
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case dt
        case temp
        case feelsLike = "feels_like"
        case pressure
        case humidity
        case weather
    }
}




struct Day: Codable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let temp: Temp
    let feelsLike: FeelsLike
    let pressure: Double
    let humidity: Double
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case dt
        case sunrise
        case sunset
        case temp
        case feelsLike = "feels_like"
        case pressure
        case humidity
        case weather
    }
}


struct FeelsLike: Codable {
    
    let day: Double
    let night: Double
    let evening: Double
    let morning: Double
    
    enum CodingKeys: String, CodingKey {
        case day
        case night
        case evening = "eve"
        case morning = "morn"
    }
    
}

struct Temp: Codable {
    
    let day: Double
    let min: Double
    let max: Double
    let night: Double
    let evening: Double
    let morning: Double
    
    enum CodingKeys: String, CodingKey {
        case day
        case min
        case max
        case night
        case evening = "eve"
        case morning = "morn"
    }
    
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}


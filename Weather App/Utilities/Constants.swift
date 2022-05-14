//
//  Constants.swift
//  Weather App
//
//  Created by Sepehr Foroughi Rad on 2/12/22.
//

import Foundation
import SwiftUI


struct SharedProperties {
    
    static let API_KEY = "13f721fc42580de57d0230eb29dcfbff"
    static let BASE_URL = "https://api.openweathermap.org/data/2.5/onecall?"
    static let BASE_ICON_URL = "https://openweathermap.org/img/wn/"
    static let TEHRAN_COORDINATES = (lat: 35.715298, lon: 51.404343)
    static let ISFAHAN_COORDINATES = (lat: 32.6539, lon: 51.6660)
    static let KARAJ_COORDINATES = (lat: 35.8400, lon: 50.9391)
    static let SHIRAZ_COORDINATES = (lat: 29.5926, lon: 52.5836)
    
    
    
    static let sampleCurrent = CurrentDay(dt: 1644796699, temp: 280.75, feelsLike: 279.06, pressure: 1027, humidity: 57, weather: [Weather(id: 800, main: "Clear", description: "clear sky", icon: "01d")])
    static let sampleDayArray: [Day] = [
        Day(dt: 1644775200, sunrise: 1644757333, sunset: 1644796724, temp: Temp(day: 28, min: 27, max: 28, night: 38, evening: 29, morning: 28), feelsLike: FeelsLike(day: 20, night: 25, evening: 32, morning: 29), pressure: 1030, humidity: 29, weather: [Weather(id: 500, main: "Rain", description: "Light Rain", icon: "10d")]),
        Day(dt: 1644775200, sunrise: 1644757333, sunset: 1644796724, temp: Temp(day: 35, min: 40, max: 24, night: 35, evening: 32, morning: 34), feelsLike: FeelsLike(day: 43, night: 25, evening: 32, morning: 29), pressure: 1030, humidity: 29, weather: [Weather(id: 500, main: "Wind", description: "slow wind", icon: "10d")]),
        Day(dt: 1644775200, sunrise: 1644757333, sunset: 1644796724, temp: Temp(day: 23, min: 44, max: 22, night: 32, evening: 33, morning: 43), feelsLike: FeelsLike(day: 22, night: 43, evening: 41, morning: 23), pressure: 1030, humidity: 29, weather: [Weather(id: 500, main: "Rain", description: "light rain", icon: "10d")]),
        Day(dt: 1644775200, sunrise: 1644757333, sunset: 1644796724, temp: Temp(day: 33, min: 23, max: 43, night: 25, evening: 28.5, morning: 24), feelsLike: FeelsLike(day: 20, night: 25, evening: 32.5, morning: 29), pressure: 1030, humidity: 29, weather: [Weather(id: 500, main: "Rain", description: "Light Rain", icon: "10d")])
    
    ]
    static let sampleJson = WeatherJson(latitude: 33.44, longitude: -94.04, timezone: "America/Chicago", timezoneOffset: -21600, current: sampleCurrent, daily: sampleDayArray)
    
    
    
}








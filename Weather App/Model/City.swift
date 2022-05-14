//
//  City.swift
//  Weather App
//
//  Created by Sepehr Foroughi Rad on 2/12/22.
//

import Foundation

enum City: String {
    case tehran = "Tehran"
    case isfahan = "Isfahan"
    case karaj = "Karaj"
    case shiraz = "Shiraz"
    
    func getInfo() -> (lat: Double, lon: Double) {
        switch self {
        case .tehran:
            return SharedProperties.TEHRAN_COORDINATES
        case .isfahan:
            return SharedProperties.ISFAHAN_COORDINATES
        case .karaj:
            return SharedProperties.KARAJ_COORDINATES
        case .shiraz:
            return SharedProperties.SHIRAZ_COORDINATES
        }
    }
}




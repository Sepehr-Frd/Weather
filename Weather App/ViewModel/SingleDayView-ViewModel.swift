//
//  SingleDayView-ViewModel.swift
//  Weather App
//
//  Created by Sepehr Foroughi Rad on 2/13/22.
//

import Foundation

extension SingleDayView {
    
    @MainActor class ViewModel: ObservableObject {
        

        
        func unixToDate(dt: Int) -> String{
            let date = Date(timeIntervalSince1970: Double(dt))
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: date)
            let minute = calendar.component(.minute, from: date)
            
            return "\(hour):\(minute)"
        }
        
        func getDayOfTheWeek(dt: Int) -> String {
            let date = Date(timeIntervalSince1970: Double(dt))
            let calendar = Calendar.current
            let day = calendar.component(.weekday, from: date)
            switch day {
            case 1:
                return "Sunday"
            case 2:
                return "Monday"
            case 3:
                return "Tuesday"
            case 4:
                return "Wednesday"
            case 5:
                return "Thursday"
            case 6:
                return "Friday"
            case 7:
                return "Saturday"
                
            default:
                return ""
            }
        }
        
    }
}

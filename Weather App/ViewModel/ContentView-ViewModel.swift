//
//  ContentView-ViewModel.swift
//  Weather App
//
//  Created by Sepehr Foroughi Rad on 2/13/22.
//

import Foundation

extension ContentView {
    
    @MainActor class ViewModel: ObservableObject {
        
        @Published var dataHasLoaded = false
        @Published var isDark = false
        @Published var weatherJson: WeatherJson = SharedProperties.sampleJson
        @Published var nextDays: [Day]!
        @Published var currentLocation: City = .karaj
        
        let cities: [City] = [.tehran, .isfahan, .karaj, .shiraz]
        
        
        //MARK: - Fetch Weather json object from API
        func getWeatherObject(latitude lat: Double, longitude lon: Double) {
            let searchUrl = "\(SharedProperties.BASE_URL)lat=\(lat)&lon=\(lon)&exclude=hourly,minutely&units=metric&appid=\(SharedProperties.API_KEY)"
            guard let url = URL(string: searchUrl) else {return}
            
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                
                if let error = error {
                    debugPrint(error.localizedDescription)
                    return
                }
                
                guard let data = data else {
                    debugPrint("Data couldn't be unwrapped")
                    return
                }
                
                do {
                    let weatherJson = try JSONDecoder().decode(WeatherJson.self, from: data)
                    DispatchQueue.main.async { [unowned self] in
                        self.weatherJson = weatherJson
                        self.nextDays = weatherJson.daily
                        self.dataHasLoaded = true
                    }
                    
                    return
                } catch {
                    debugPrint(error.localizedDescription)
                    return
                }
            }
            task.resume()
        }
        
        //Mark: -Convert UNIX code to date format
        func unixToDate(dt: Int) -> String{
            let date = Date(timeIntervalSince1970: Double(dt))
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: date)
            let minute = calendar.component(.minute, from: date)
            
            return "\(hour):\(minute)"
        }
        
        //MARK: -Extract the day of the week from the UNIX code and return the respective name
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
        //MARK: - Refetch Data every time the location changes and once on appearance of ContentView
        func refetchData() {
            dataHasLoaded = false
            getWeatherObject(latitude: currentLocation.getInfo().lat, longitude: currentLocation.getInfo().lon)
        }
        
    }
}

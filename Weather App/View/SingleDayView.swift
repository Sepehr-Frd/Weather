//
//  SingleDayView.swift
//  Weather App
//
//  Created by Sepehr Foroughi Rad on 2/12/22.
//

import SwiftUI

struct SingleDayView: View {
    
    @StateObject var viewModel = ViewModel()
    var dayObject: Day
    
    var body: some View {
        
        NavigationView {
            
            //MARK: - Start of the main ZStack
            
            ZStack {
                
                LinearGradient(colors: [.blue, .cyan, .blue, .cyan], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    
                    //MARK: - Title
                    Text("\(viewModel.getDayOfTheWeek(dt: dayObject.dt)) Weather")
                        .padding()
                        .foregroundStyle(.primary)
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .background(.ultraThickMaterial)
                        .clipShape(Capsule())
                        .padding(.horizontal)
                    
                    
                    
                    ScrollView(.vertical) {
                        
                        //MARK: - Start of the VStack holding all the minor VStacks
                        
                        VStack {
                            
                            
                            
                            
                            HStack {
                                
                                AsyncImage(url: URL(string: "\(SharedProperties.BASE_ICON_URL)\(dayObject.weather[0].icon)@2x.png")) { image in
                                    image.resizable()
                                } placeholder: {
                                    Color.red
                                }
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 128, height: 128, alignment: .center)
                                .clipShape(Circle())
                                .padding()
                                
                                Spacer()
                                
                                VStack(alignment: .center) {
                                    
                                    Text(dayObject.weather[0].main)
                                        .font(.largeTitle)
                                    
                                    Text("(\(dayObject.weather[0].description))")
                                        .font(.title2)
                                    
                                }
                                .padding()
                                
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.thinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            
                            
                            
                            
                            
                            VStack {
                                Text("Temperature")
                                    .foregroundStyle(.secondary)
                                    .font(.title)
                                    .padding()
                                
                                HStack {
                                    Text("Morning")
                                    Spacer()
                                    Text("\(String(format: "%.1f", dayObject.temp.morning)) ℃")
                                    
                                }
                                .padding()
                                .font(.title2)
                                
                                HStack {
                                    Text("Day")
                                    Spacer()
                                    Text("\(String(format: "%.1f", dayObject.temp.day)) ℃")
                                }
                                .padding()
                                .font(.title2)
                                
                                HStack {
                                    Text("Evening")
                                    Spacer()
                                    Text("\(String(format: "%.1f", dayObject.temp.evening)) ℃")
                                }
                                .padding()
                                .font(.title2)
                                
                                HStack {
                                    Text("Night")
                                    Spacer()
                                    Text("\(String(format: "%.1f", dayObject.temp.night)) ℃")
                                }
                                .padding()
                                .font(.title2)
                                
                                HStack {
                                    Text("Min")
                                    Spacer()
                                    Text("\(String(format: "%.1f", dayObject.temp.min)) ℃")
                                }
                                .padding()
                                .font(.title2)
                                
                                HStack {
                                    Text("Max")
                                    Spacer()
                                    Text("\(String(format: "%.1f", dayObject.temp.max)) ℃")
                                }
                                .padding()
                                .font(.title2)
                                
                            }
                            .frame(maxWidth: .infinity)
                            .background(.thinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            
                            VStack {
                                Text("Feels Like")
                                    .foregroundStyle(.secondary)
                                    .font(.title)
                                    .padding()
                                
                                HStack {
                                    Text("Morning")
                                    Spacer()
                                    Text("\(String(format: "%.1f", dayObject.feelsLike.morning)) ℃")
                                }
                                .padding()
                                .font(.title2)
                                
                                HStack {
                                    Text("Day")
                                    Spacer()
                                    Text("\(String(format: "%.1f", dayObject.feelsLike.day)) ℃")
                                }
                                .padding()
                                .font(.title2)
                                
                                HStack {
                                    Text("Evening")
                                    Spacer()
                                    Text("\(String(format: "%.1f", dayObject.feelsLike.evening)) ℃")
                                }
                                .padding()
                                .font(.title2)
                                
                                HStack {
                                    Text("Night")
                                    Spacer()
                                    Text("\(String(format: "%.1f", dayObject.feelsLike.night)) ℃")
                                }
                                .padding()
                                .font(.title2)
                                
                            }
                            .frame(maxWidth: .infinity)
                            .background(.thinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            
                            
                            VStack {
                                
                                HStack {
                                    VStack(spacing: 30) {
                                        Text("Pressure")
                                            .font(.title)
                                            .foregroundStyle(.secondary)
                                        Text("\(String(format: "%.1f", dayObject.pressure)) hPa")
                                            .font(.title2)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(.thinMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                    
                                    Spacer()
                                    
                                    VStack(spacing: 30) {
                                        Text("Humidity")
                                            .font(.title)
                                            .foregroundStyle(.secondary)
                                        Text("\(String(format: "%.1f", dayObject.humidity)) %")
                                            .font(.title2)
                                        
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(.thinMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                    
                                    
                                }
                                
                            }
                            .frame(maxWidth: .infinity)
                            VStack {
                                
                                HStack {
                                    VStack(spacing: 30) {
                                        Text("Sunrise")
                                            .font(.title)
                                            .foregroundStyle(.secondary)
                                        Text(viewModel.unixToDate(dt: dayObject.sunrise))
                                            .font(.title2)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(.thinMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                    
                                    Spacer()
                                    
                                    VStack(spacing: 30) {
                                        Text("Sunset")
                                            .font(.title)
                                            .foregroundStyle(.secondary)
                                        Text(viewModel.unixToDate(dt: dayObject.sunset))
                                            .font(.title2)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(.thinMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                    
                                    
                                }
                                
                            }
                            .frame(maxWidth: .infinity)
                            
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        .padding(.bottom)
                        //MARK: - End of the VStack holding all the minor VStacks
                    }
                    
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea(edges: .bottom)
            
            //MARK: - End of the main ZStack
            
        }
        
    }
    
    
}

struct SingleDayView_Previews: PreviewProvider {
    
    static let sampleDay = Day(dt: 1644688800, sunrise: 1644670990, sunset: 1644710268, temp: Temp(day: 278.42, min: 273.16, max: 285.55, night: 273.16, evening: 276.81, morning: 281.58), feelsLike: FeelsLike(day: 274.55, night: 269.33, evening: 273.49, morning: 278.26), pressure: 1031, humidity: 67, weather: [Weather(id: 501, main: "Rain", description: "moderate rain", icon: "10d")])
    
    static var previews: some View {
        SingleDayView(dayObject: sampleDay)
    }
}

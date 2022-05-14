//
//  ContentView.swift
//  Weather App
//
//  Created by Sepehr Foroughi Rad on 2/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    var sharedViews = SharedViews()
    
    var body: some View {
        
        NavigationView {
            
            //MARK: -Start of the main ZStack
            
            ZStack {
                
                sharedViews.mainBackground
                    .ignoresSafeArea()
                
            //MARK: -Start of the main VStack
                
                VStack {
                    
                    Picker("Location", selection: $viewModel.currentLocation) {
                        ForEach(viewModel.cities, id: \.self) {
                            Text($0.rawValue)
                                .font(.title)
                        }
                        
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    .background(.thinMaterial)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                                        
                    /*Checking to see if we have data fetched back to us to display.
                     If not showing a ProgressView()*/
                    
                    if true {
//                    if viewModel.dataHasLoaded {
                        
                        ScrollView(.vertical) {
                            
                            //MARK: -Start of Today part

                            
                            VStack {
                                Text("Today")
                                    .font(
                                        Font.custom("Futura", size: 36)
                                            .bold()
                                    )
                                    .padding()
                                    .background(.thinMaterial)
                                    .foregroundColor(.primary)
                                    .cornerRadius(20)
                                    
                                    
                                    
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        AsyncImage(url: URL(string: "\(SharedProperties.BASE_ICON_URL)\(viewModel.weatherJson.current.weather[0].icon)@2x.png")) { image in
                                            image.resizable()
                                        } placeholder: {
                                            Color.mint
                                        }
                                        .iconed(75)
                                        .padding()
                                        
                                        Spacer()
                                        
                                        DecimalFormattedText(text: "\(viewModel.weatherJson.current.temp)", numOfDecimalPoints: 0)
                                            .padding()
                                            
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .center) {
                                            Text(viewModel.weatherJson.current.weather[0].main)
                                                .font(.title2)
                                            Text(viewModel.weatherJson.current.weather[0].description)
                                                .font(.title3)
                                        }
                                        .padding()
                                        
                                    }
                                    HStack {
                                        Text("Feels Like")
                                        
                                        Spacer()
                                        
                                        DecimalFormattedText(text: "\(viewModel.weatherJson.current.feelsLike)", numOfDecimalPoints: 0)
                                        
                                    }
                                    .font(.title2)
                                    .padding()
                                    
                                    HStack {
                                        
                                        Text("Pressure")
                                        
                                        Spacer()
                                        
                                        
                                        DecimalFormattedText(text: "\(viewModel.weatherJson.current.pressure)", numOfDecimalPoints: 0)
                                        
                                        
                                        
                                    }
                                    .font(.title2)
                                    .padding()
                                    
                                    HStack {
                                        
                                        Text("Humidity")
                                        
                                        Spacer()
                                        
                                        DecimalFormattedText(text: "\(viewModel.weatherJson.current.humidity)", numOfDecimalPoints: 0)
                                        
                                        
                                        
                                    }
                                    .font(.title2)
                                    .padding()
                                    
                                }
                                .roundedBoxed(20)
                                .padding()
                            }
                            
                            //MARK: -End of Today part, Start of next days part
                            

                            Group {
                                ForEach(viewModel.weatherJson.daily, id: \.dt) { item in

                                    NavigationLink {
                                        SingleDayView(dayObject: item)
                                    } label: {
                                        HStack {
                                            
                                            Text(viewModel.getDayOfTheWeek(dt: item.dt))
                                                .font(.title3)
                                            
                                            Spacer()
                                            

                                            DecimalFormattedText(text: "\(item.temp.day)", numOfDecimalPoints: 0)
                                            
                                            AsyncImage(url: URL(string: "\(SharedProperties.BASE_ICON_URL)\(item.weather[0].icon)@2x.png")) { image in
                                                image.resizable()
                                            } placeholder: {
                                                Color.mint
                                            }
                                            .iconed(60)
                                        }
                                        .padding()
                                    }
                                    .foregroundColor(.primary)

                                }
                                
                                

                            }
                            .roundedBoxed(20)
                            .padding(.horizontal)
                            .padding(.bottom)
                        }
                        .frame(maxWidth: .infinity)
                        
                        
                        
                    } else {
                        
                        Spacer()
                        
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .primary))
                            .scaleEffect(5)
                            .frame(width: 150, height: 150, alignment: .center)
                            .background(.thinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                                
                        Spacer()
                        Spacer()
                    }
                }
                .navigationTitle("8-Day Weather Forecast")
                .navigationBarTitleDisplayMode(.inline)
                
            //MARK: - End of the main VStack
            }
            //MARK: -End of the main ZStack
        }
            .onAppear {
                viewModel.refetchData()
            }
            .onChange(of: viewModel.currentLocation) { _ in
                viewModel.refetchData()
            }
            }
        }
        
    
    
    
    struct ContentView_Previews: PreviewProvider {
        
        static var previews: some View {
            ContentView()
        }
    }
    

//
//  ForecastDetailView.swift
//  Weather
//
//  Created by Marc on 15/10/24.
//

import SwiftUI

struct ForecastDetailView: View {
    
    @State var forecastViewModel: OpenWeatherForecastViewModel
    @State var index: Int
    
    var body: some View {
        
        if let forecastListItem: OpenWeatherForecastModelList = forecastViewModel.data?.list[0] {
            
            VStack {
                
                Text(Date(timeIntervalSince1970: Double(forecastListItem.dt)), format: .dateTime.day().month().hour().minute())
                    .foregroundStyle(Color("AccentColor"))
                    .font(.system(size: 14))
                
                if let city = forecastViewModel.data?.city {
                    
                    Text("\(city.name), \(city.country)")
                        .foregroundStyle(Color("TextColor"))
                        .font(.system(size: 25))
                        .fontWeight(FontWeight.n700)
                }
                
                HStack {
                    
                    AsyncImage(
                        url: URL(string: "https://openweathermap.org/img/wn/\(forecastListItem.weather[0].icon)@2x.png"),
                        scale: 1.0,
                        content: {
                            
                            image in
                            
                            image
                                .resizable()
                                .frame(width: 50, height: 50)
                        },
                        placeholder: {
                            
                            ProgressView()
                                .id(UUID())
                        }
                    )
                    
                    Text("\(Int(forecastListItem.main.temp)) ºC")
                        .foregroundStyle(Color("TextColor"))
                        .font(.system(size: 36))
                        .fontWeight(FontWeight.n100)
                }
                
                let weatherDescription: String = forecastListItem.weather.map({
                    
                    item in
                
                    return item.description
                })
                .joined(separator: ", ")
                
                Text("Feels like \(Int(forecastListItem.main.feelsLike)) ºC, \(weatherDescription)")
                    .foregroundStyle(Color("TextColor"))
                    .font(.system(size: 14))
                    .fontWeight(FontWeight.n700)
                
                if let the3H = forecastListItem.rain?.the3H {
                    
                    Text("Rain volume: \(the3H, specifier: "%.2f") mm")
                }
                
                Text("Wind speed: \(forecastListItem.wind.speed, specifier: "%.2f") m/s")
                                
                Text("Pressure: \(forecastListItem.main.pressure) hPa")
                
                Text("Humidity: \(forecastListItem.main.humidity) %")
                
                Text("Visibility: \(forecastListItem.visibility / 1000) km")
            }
            .padding()
            .background(Color("BackgroundContrastColor"))
            .cornerRadius(20)
            .padding()
        }
    }
}

#Preview {
    ForecastDetailView(forecastViewModel: OpenWeatherForecastViewModel(), index: 0)
}

//
//  ForecastListItemView.swift
//  Weather
//
//  Created by Marc on 15/10/24.
//

import SwiftUI

struct ForecastListItemView: View {
    
    @State var forecastListItem: OpenWeatherForecastModelList
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 0) {
            
            Text(Date(timeIntervalSince1970: Double(forecastListItem.dt)), format: .dateTime.day().month().hour().minute())
                .frame(minWidth: 0, maxWidth: .infinity)
            
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
            .frame(minWidth: 0, maxWidth: .infinity)
            
            VStack {
                
                Text("\(Int(forecastListItem.main.tempMax)) ºC")
                Text("\(Int(forecastListItem.main.tempMin)) ºC")
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
            Text(forecastListItem.weather[0].description)
                .frame(minWidth: 0, maxWidth: .infinity)
        }
        .frame(height: 50)
    }
}

#Preview {
    
    let openWeatherForecastViewModel: OpenWeatherForecastViewModel = OpenWeatherForecastViewModel()

    if let list = openWeatherForecastViewModel.data?.list[0] {
        
        return ForecastListItemView(forecastListItem: list)
    } else {
        
        return EmptyView()
    }
}

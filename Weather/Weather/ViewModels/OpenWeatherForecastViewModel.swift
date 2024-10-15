//
//  OpenWeatherForecastViewModel.swift
//  Weather
//
//  Created by Marc on 15/10/24.
//

import Foundation

@MainActor class OpenWeatherForecastViewModel: ObservableObject {
    
    public var state: ViewModelState = .initialized
    
    private var appID: String = "f1fb67b950fe9ec6243e3882c424a7dd"
    
    @Published var data: OpenWeatherForecastModel?
    
    func getData(latitude: Double, longitude: Double) async {
        
        state = .loadingNextPage
        
        guard let data: OpenWeatherForecastModel = await APIService().getData(fromURLString: "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&units=metric&appid=\(appID)") else {
            
            state = .error
            
            return
        }
        
        self.data = data
        
        state = .data
    }
}

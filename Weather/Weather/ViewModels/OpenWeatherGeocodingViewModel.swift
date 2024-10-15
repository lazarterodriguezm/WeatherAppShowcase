//
//  OpenWeatherGeocodingViewModel.swift
//  Weather
//
//  Created by Marc on 15/10/24.
//

import Foundation

@MainActor class OpenWeatherGeocodingViewModel: ObservableObject {
    
    public var state: ViewModelState = .initialized
    
    private var appID: String = "f1fb67b950fe9ec6243e3882c424a7dd"
    
    @Published var data: OpenWeatherGeocodingModel?
    
    func getData(cityName: String) async {
        
        state = .loadingNextPage
        
        guard let data: OpenWeatherGeocodingModel = await APIService().getData(fromURLString: "https://api.openweathermap.org/geo/1.0/direct?q=\(cityName)&appid=\(appID)") else {
            
            state = .error
            
            return
        }
        
        self.data = data
        
        state = .data
    }
}

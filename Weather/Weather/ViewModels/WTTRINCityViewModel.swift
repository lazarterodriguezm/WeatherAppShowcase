//
//  WTTRINCityViewModel.swift
//  Weather
//
//  Created by Marc on 13/10/24.
//

import Foundation

@MainActor class WTTRINCityViewModel: ObservableObject {
    
    @Published var data: WTTRINCityModel?
    
    func getData(cityName: String) async {
        
        guard let data: WTTRINCityModel = await APIService().getData(fromURLString: "https://wttr.in/\(cityName)?format=j1") else {
            
            return
        }
        
        self.data = data
    }
}

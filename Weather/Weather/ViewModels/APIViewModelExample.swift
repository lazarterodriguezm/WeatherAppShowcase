//
//  APIViewModelExample.swift
//  Weather
//
//  Created by Marc on 13/10/24.
//

import Foundation

@MainActor class APIViewModelExample: ObservableObject {
    
    @Published var data: [APIModelExample]?
    
    func getData() async {
        
        guard let data: [APIModelExample] = await APIService().getData(fromURLString: "https://jsonplaceholder.typicode.com/posts") else {
            
            return
        }
        
        self.data = data
    }
}

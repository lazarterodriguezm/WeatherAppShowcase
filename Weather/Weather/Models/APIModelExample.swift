//
//  APIModelExample.swift
//  Weather
//
//  Created by Marc on 13/10/24.
//

import Foundation

// Identifiable is required in case the model is going to be part of a list in a view. Codable is required so that it can be converted to and from JSON.
struct APIModelExample: Identifiable, Codable {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

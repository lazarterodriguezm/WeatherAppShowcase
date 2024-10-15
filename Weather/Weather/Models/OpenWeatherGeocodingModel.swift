//
//  OpenWeatherGeocodingModel.swift
//  Weather
//
//  Created by Marc on 15/10/24.
//
//  Generated using https://quicktype.io/

import Foundation

// MARK: - OpenWeatherGeocodingModelElement
struct OpenWeatherGeocodingModelElement: Codable {
    let name: String
    let localNames: [String: String]?
    let lat: Double
    let lon: Double
    let country: String
    let state: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case localNames = "local_names"
        case lat = "lat"
        case lon = "lon"
        case country = "country"
        case state = "state"
    }
}

typealias OpenWeatherGeocodingModel = [OpenWeatherGeocodingModelElement]

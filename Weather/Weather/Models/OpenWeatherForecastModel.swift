//
//  OpenWeatherForecastModel.swift
//  Weather
//
//  Created by Marc on 15/10/24.
//
//  Generated using https://quicktype.io/

import Foundation

// MARK: - OpenWeatherForecastModel
struct OpenWeatherForecastModel: Codable {
    let cod: String
    let message: Int
    let cnt: Int
    let list: [OpenWeatherForecastModelList]
    let city: OpenWeatherForecastModelCity

    enum CodingKeys: String, CodingKey {
        case cod = "cod"
        case message = "message"
        case cnt = "cnt"
        case list = "list"
        case city = "city"
    }
}

// MARK: - OpenWeatherForecastModelCity
struct OpenWeatherForecastModelCity: Codable {
    let id: Int
    let name: String
    let coord: OpenWeatherForecastModelCoord
    let country: String
    let population: Int
    let timezone: Int
    let sunrise: Int
    let sunset: Int

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case coord = "coord"
        case country = "country"
        case population = "population"
        case timezone = "timezone"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
}

// MARK: - OpenWeatherForecastModelCoord
struct OpenWeatherForecastModelCoord: Codable {
    let lat: Double
    let lon: Double

    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lon = "lon"
    }
}

// MARK: - OpenWeatherForecastModelList
struct OpenWeatherForecastModelList: Codable {
    let dt: Int
    let main: OpenWeatherForecastModelMain
    let weather: [OpenWeatherForecastModelWeather]
    let clouds: OpenWeatherForecastModelClouds
    let wind: OpenWeatherForecastModelWind
    let visibility: Int
    let pop: Double
    let rain: OpenWeatherForecastModelRain?
    let sys: OpenWeatherForecastModelSys
    let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case dt = "dt"
        case main = "main"
        case weather = "weather"
        case clouds = "clouds"
        case wind = "wind"
        case visibility = "visibility"
        case pop = "pop"
        case rain = "rain"
        case sys = "sys"
        case dtTxt = "dt_txt"
    }
}

// MARK: - OpenWeatherForecastModelClouds
struct OpenWeatherForecastModelClouds: Codable {
    let all: Int

    enum CodingKeys: String, CodingKey {
        case all = "all"
    }
}

// MARK: - OpenWeatherForecastModelMain
struct OpenWeatherForecastModelMain: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let seaLevel: Int
    let grndLevel: Int
    let humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure = "pressure"
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity = "humidity"
        case tempKf = "temp_kf"
    }
}

// MARK: - OpenWeatherForecastModelRain
struct OpenWeatherForecastModelRain: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - OpenWeatherForecastModelSys
struct OpenWeatherForecastModelSys: Codable {
    let pod: String

    enum CodingKeys: String, CodingKey {
        case pod = "pod"
    }
}

// MARK: - OpenWeatherForecastModelWeather
struct OpenWeatherForecastModelWeather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }
}

// MARK: - OpenWeatherForecastModelWind
struct OpenWeatherForecastModelWind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double

    enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case deg = "deg"
        case gust = "gust"
    }
}

//
//  WTTRINCityModel.swift
//  Weather
//
//  Created by Marc on 13/10/24.
//
//  Generated using https://quicktype.io/

import Foundation

// MARK: - WTTRINCityModel
struct WTTRINCityModel: Codable {
    
    let currentCondition: [WTTRINCityModelCurrentCondition]
    let nearestArea: [WTTRINCityModelNearestArea]
    let request: [WTTRINCityModelRequest]
    let weather: [WTTRINCityModelWeather]

    enum CodingKeys: String, CodingKey {
        
        case currentCondition = "current_condition"
        case nearestArea = "nearest_area"
        case request = "request"
        case weather = "weather"
    }
}

// MARK: - WTTRINCityModelCurrentCondition
struct WTTRINCityModelCurrentCondition: Codable {
    
    let feelsLikeC: String
    let feelsLikeF: String
    let cloudcover: String
    let humidity: String
    let localObsDateTime: String
    let observationTime: String
    let precipInches: String
    let precipMM: String
    let pressure: String
    let pressureInches: String
    let tempC: String
    let tempF: String
    let uvIndex: String
    let visibility: String
    let visibilityMiles: String
    let weatherCode: String
    let weatherDesc: [WTTRINCityModelWeatherDesc]
    let weatherIconURL: [WTTRINCityModelWeatherDesc]
    let winddir16Point: String
    let winddirDegree: String
    let windspeedKmph: String
    let windspeedMiles: String

    enum CodingKeys: String, CodingKey {
        
        case feelsLikeC = "FeelsLikeC"
        case feelsLikeF = "FeelsLikeF"
        case cloudcover = "cloudcover"
        case humidity = "humidity"
        case localObsDateTime = "localObsDateTime"
        case observationTime = "observation_time"
        case precipInches = "precipInches"
        case precipMM = "precipMM"
        case pressure = "pressure"
        case pressureInches = "pressureInches"
        case tempC = "temp_C"
        case tempF = "temp_F"
        case uvIndex = "uvIndex"
        case visibility = "visibility"
        case visibilityMiles = "visibilityMiles"
        case weatherCode = "weatherCode"
        case weatherDesc = "weatherDesc"
        case weatherIconURL = "weatherIconUrl"
        case winddir16Point = "winddir16Point"
        case winddirDegree = "winddirDegree"
        case windspeedKmph = "windspeedKmph"
        case windspeedMiles = "windspeedMiles"
    }
}

// MARK: - WTTRINCityModelWeatherDesc
struct WTTRINCityModelWeatherDesc: Codable {
    
    let value: String

    enum CodingKeys: String, CodingKey {
        
        case value = "value"
    }
}

// MARK: - WTTRINCityModelNearestArea
struct WTTRINCityModelNearestArea: Codable {
    
    let areaName: [WTTRINCityModelWeatherDesc]
    let country: [WTTRINCityModelWeatherDesc]
    let latitude: String
    let longitude: String
    let population: String
    let region: [WTTRINCityModelWeatherDesc]
    let weatherURL: [WTTRINCityModelWeatherDesc]

    enum CodingKeys: String, CodingKey {
        
        case areaName = "areaName"
        case country = "country"
        case latitude = "latitude"
        case longitude = "longitude"
        case population = "population"
        case region = "region"
        case weatherURL = "weatherUrl"
    }
}

// MARK: - WTTRINCityModelRequest
struct WTTRINCityModelRequest: Codable {
    
    let query: String
    let type: String

    enum CodingKeys: String, CodingKey {
        
        case query = "query"
        case type = "type"
    }
}

// MARK: - WTTRINCityModelWeather
struct WTTRINCityModelWeather: Codable {
    
    let astronomy: [WTTRINCityModelAstronomy]
    let avgtempC: String
    let avgtempF: String
    let date: String
    let hourly: [WTTRINCityModelHourly]
    let maxtempC: String
    let maxtempF: String
    let mintempC: String
    let mintempF: String
    let sunHour: String
    let totalSnowCM: String
    let uvIndex: String

    enum CodingKeys: String, CodingKey {
        
        case astronomy = "astronomy"
        case avgtempC = "avgtempC"
        case avgtempF = "avgtempF"
        case date = "date"
        case hourly = "hourly"
        case maxtempC = "maxtempC"
        case maxtempF = "maxtempF"
        case mintempC = "mintempC"
        case mintempF = "mintempF"
        case sunHour = "sunHour"
        case totalSnowCM = "totalSnow_cm"
        case uvIndex = "uvIndex"
    }
}

// MARK: - WTTRINCityModelAstronomy
struct WTTRINCityModelAstronomy: Codable {
    
    let moonIllumination: String
    let moonPhase: String
    let moonrise: String
    let moonset: String
    let sunrise: String
    let sunset: String

    enum CodingKeys: String, CodingKey {
        
        case moonIllumination = "moon_illumination"
        case moonPhase = "moon_phase"
        case moonrise = "moonrise"
        case moonset = "moonset"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
}

// MARK: - WTTRINCityModelHourly
struct WTTRINCityModelHourly: Codable {
    
    let dewPointC: String
    let dewPointF: String
    let feelsLikeC: String
    let feelsLikeF: String
    let heatIndexC: String
    let heatIndexF: String
    let windChillC: String
    let windChillF: String
    let windGustKmph: String
    let windGustMiles: String
    let chanceoffog: String
    let chanceoffrost: String
    let chanceofhightemp: String
    let chanceofovercast: String
    let chanceofrain: String
    let chanceofremdry: String
    let chanceofsnow: String
    let chanceofsunshine: String
    let chanceofthunder: String
    let chanceofwindy: String
    let cloudcover: String
    let diffRAD: String
    let humidity: String
    let precipInches: String
    let precipMM: String
    let pressure: String
    let pressureInches: String
    let shortRAD: String
    let tempC: String
    let tempF: String
    let time: String
    let uvIndex: String
    let visibility: String
    let visibilityMiles: String
    let weatherCode: String
    let weatherDesc: [WTTRINCityModelWeatherDesc]
    let weatherIconURL: [WTTRINCityModelWeatherDesc]
    let winddir16Point: String
    let winddirDegree: String
    let windspeedKmph: String
    let windspeedMiles: String

    enum CodingKeys: String, CodingKey {
        
        case dewPointC = "DewPointC"
        case dewPointF = "DewPointF"
        case feelsLikeC = "FeelsLikeC"
        case feelsLikeF = "FeelsLikeF"
        case heatIndexC = "HeatIndexC"
        case heatIndexF = "HeatIndexF"
        case windChillC = "WindChillC"
        case windChillF = "WindChillF"
        case windGustKmph = "WindGustKmph"
        case windGustMiles = "WindGustMiles"
        case chanceoffog = "chanceoffog"
        case chanceoffrost = "chanceoffrost"
        case chanceofhightemp = "chanceofhightemp"
        case chanceofovercast = "chanceofovercast"
        case chanceofrain = "chanceofrain"
        case chanceofremdry = "chanceofremdry"
        case chanceofsnow = "chanceofsnow"
        case chanceofsunshine = "chanceofsunshine"
        case chanceofthunder = "chanceofthunder"
        case chanceofwindy = "chanceofwindy"
        case cloudcover = "cloudcover"
        case diffRAD = "diffRad"
        case humidity = "humidity"
        case precipInches = "precipInches"
        case precipMM = "precipMM"
        case pressure = "pressure"
        case pressureInches = "pressureInches"
        case shortRAD = "shortRad"
        case tempC = "tempC"
        case tempF = "tempF"
        case time = "time"
        case uvIndex = "uvIndex"
        case visibility = "visibility"
        case visibilityMiles = "visibilityMiles"
        case weatherCode = "weatherCode"
        case weatherDesc = "weatherDesc"
        case weatherIconURL = "weatherIconUrl"
        case winddir16Point = "winddir16Point"
        case winddirDegree = "winddirDegree"
        case windspeedKmph = "windspeedKmph"
        case windspeedMiles = "windspeedMiles"
    }
}

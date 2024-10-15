//
//  APIError.swift
//  Weather
//
//  Created by Marc on 13/10/24.
//

import Foundation

enum APIError: Error {
    
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}

//
//  APIService.swift
//  Weather
//
//  Created by Marc on 13/10/24.
//

import Foundation

class APIService {
    
    func getData<T: Codable>(fromURLString urlString: String) async -> T? {
        
        do {
            
            print("APIService T.self: \(T.self)")
            print("APIService urlString: \(urlString)")
            
            guard let url: URL = URL(string: urlString) else {
                
                throw APIError.badUrl
            }
            
            print("APIService url: \(url)")
            
            let (data, urlResponse): (Data, URLResponse) = try await URLSession.shared.data(from: url)
            
            print("APIService data: \(data)")
            print("APIService urlResponse: \(urlResponse)")
            
            guard let urlResponse = urlResponse as? HTTPURLResponse else {
                
                throw APIError.badResponse
            }
            
            guard urlResponse.statusCode >= 200 && urlResponse.statusCode < 300 else {
                
                throw APIError.badStatus
            }
            
            guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
                
                throw APIError.failedToDecodeResponse
            }
            
            print("APIService decodedResponse: \(decodedResponse)")
            
            return decodedResponse
        } catch APIError.badUrl {
            
            print("There was an error creating the URL")
        } catch APIError.badResponse {
            
            print("Did not get a valid response")
        } catch APIError.badStatus {
            
            print("Did not get a 2xx status code from the response")
        } catch APIError.failedToDecodeResponse {
            
            print("Failed to decode response into the given type")
        } catch {
            
            print("An error occured downloading the data")
        }
        
        return nil
    }
}

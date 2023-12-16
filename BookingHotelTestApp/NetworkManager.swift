//
//  NetworkManager.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 16.12.2023.
//

import Foundation
import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseURL = "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473"
    
    
    private init() {}
    
    
    func getHotel() async throws -> Hotel {
        guard let url = URL(string: baseURL) else {
            throw BookingError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(Hotel.self, from: data)
        } catch {
            throw BookingError.invalidData
        }
        
        
    }
    
    
  
}

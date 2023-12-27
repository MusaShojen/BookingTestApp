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
    private let hotelURL = "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473"
   
    private let roomsURL = "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195"
    
    private let bookingURL = "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff"
    
    private init() {}
    
    
    func getHotel() async throws -> Hotel {
        guard let url = URL(string: hotelURL) else {
            throw BookingError.invalidURL(description: "Ошибка сервера, попробуйте позже")
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(Hotel.self, from: data)
        } catch {
            throw BookingError.invalidData(description: "Ошибка клиента, попробуйте позже")
        }
        
        
    }
    

  func getRooms() async throws -> RoomModel {
        
        guard let url = URL(string: roomsURL) else {
            throw BookingError.invalidURL(description: "Ошибка сервера, попробуйте позже")
        }
        
      let (data, _) = try await URLSession.shared.data(from: url)
      
      
      do {
          let decoder = JSONDecoder()
          return try decoder.decode(RoomModel.self, from: data)
          
      } catch {
          
          throw BookingError.invalidData(description: "Ошибка клиента, попробуйте позже")
      }
        
        
    }
    
    func getBookingInfo() async throws -> BookingModel {
          
          guard let url = URL(string: bookingURL) else {
              throw BookingError.invalidURL(description: "Ошибка сервера, попробуйте позже")
          }
          
        let (data, _) = try await URLSession.shared.data(from: url)
        
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(BookingModel.self, from: data)
            
        } catch {
            
            throw BookingError.invalidData(description: "Ошибка клиента, попробуйте позже")
        }
          
          
      }
    
    
   
    
}

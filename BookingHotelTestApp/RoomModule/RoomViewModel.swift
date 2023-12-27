//
//  RoomViewModel.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 21.12.2023.
//

import Foundation
import SwiftUI

@MainActor final class RoomViewModel: ObservableObject {
    
    @Published var rooms : [Room] = []
    @Published var isError = false
    @Published var error: String = ""
    @Published var isLoading = false
    func getRooms() {
        isLoading = true
        Task {
            
            do {
                let roomModel = try await NetworkManager.shared.getRooms()
                rooms = roomModel.rooms
                isLoading = false
            } catch {
                
                if let bookingError = error as? BookingError<String> {
                    isError = true
                    
                    switch bookingError {
                                   case .invalidURL(let description):
                                    self.error = description
                                   case .invalidResponse(let description):
                                       self.error  = description
                                   case .invalidData(let description):
                                       self.error =   description
                                   case .unableToComplete(let description):
                                       self.error =  description
                                   }
                               } else {
                                   
                                   isError = true
                                   self.error = "Непредвиденная ошибка: \(error)"
                               }
                           }
                
            }
            
        
        
    }
    
}


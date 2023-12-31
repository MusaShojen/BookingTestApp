//
//  HotelViewModel.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 21.12.2023.
//

import Foundation
import SwiftUI

@MainActor final class HotelViewModel: ObservableObject {
 
    @Published var hotel: Hotel = MockHotel.hotel
    @Published var isLoading = false
    @Published var isError = false
    @Published var error : String = ""
   // @Published var path = NavigationPath()
    
    
    
    
    func getHotel() {
        
        isLoading = true
        
        Task {
            
            do {
                hotel = try await NetworkManager.shared.getHotel()
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
    
    
    
    


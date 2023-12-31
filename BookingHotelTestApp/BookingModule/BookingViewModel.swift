//
//  BookingViewModel.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 25.12.2023.
//

import Foundation

@MainActor final class BookingViewModel: ObservableObject {
    @Published var booking : BookingModel = BookingModel(id: 1, hotelName: "", hotelAdress: "", horating: 1, ratingName: "", departure: "", arrivalCountry: "", tourDateStart: "", tourDateStop: "", numberOfNights: 1, room: "", nutrition: "", tourPrice: 1, fuelCharge: 1, serviceCharge: 1)
    @Published var isError = false
    @Published var error: String = ""
    
    
    @Published  var selectedRange: NSRange?
    @Published  var text: String = ""
    @Published  var emailText: String = ""
    @Published  var isEmailValid = true
    @Published  var viewIsValid = false
    @Published var isLoading = false
    @Published var payButtonPressed = false
    
    
    func getBooking() {
        isLoading = true
        Task {
          
            do {
                let bookingModel = try await NetworkManager.shared.getBookingInfo()
                booking = bookingModel
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

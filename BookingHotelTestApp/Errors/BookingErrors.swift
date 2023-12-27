//
//  Errors.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 16.12.2023.
//

import Foundation


enum BookingError<String>: Error {
    case invalidURL(description: String)
    case invalidResponse(description: String)
    case invalidData(description: String)
    case unableToComplete(description: String)
}

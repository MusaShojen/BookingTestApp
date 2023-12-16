//
//  Errors.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 16.12.2023.
//

import Foundation


enum BookingError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}

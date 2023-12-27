//
//  StarsCell.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 17.12.2023.
//

import SwiftUI

struct StarsCell: View {
    
    
    let rating: Int
    
    let ratingName: String
    
    var body: some View {
        
        
        HStack( spacing: 2) {
            
            Image("Image")
                .resizable()
                .frame(width: 15, height: 15)
            
            
            Text("\(rating) \(ratingName)")
                .font(
                    Font.custom("SF Pro Display", size: 16)
                        .weight(.medium)
                )
            
                .foregroundColor(Color(red: 1, green: 0.66, blue: 0))
            
            
        }
        
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(Color(red: 1, green: 0.78, blue: 0).opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

#Preview {
    StarsCell(rating: MockHotel.hotel.rating, ratingName: MockHotel.hotel.ratingName)
}

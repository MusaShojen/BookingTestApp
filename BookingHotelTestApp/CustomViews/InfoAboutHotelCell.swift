//
//  InfoAboutHotelCell.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 20.12.2023.
//

import SwiftUI

struct InfoAboutHotelCell: View {
    
    
    let text : String
    
    var body: some View {
        
        VStack {
            HStack(alignment: .center) {
                
                Text(text)
                    .font(
                        Font.custom("SF Pro Display", size: 16)
                            .weight(.medium)
                    )
                    .lineLimit(2)
                    .minimumScaleFactor(0.6)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    .frame(height: 29)
                
                
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color(red: 0.98, green: 0.98, blue: 0.99))
            
            .clipShape(RoundedRectangle(cornerRadius: 5))
        }
    }
}

#Preview {
    InfoAboutHotelCell(text: "3-я линия")
}

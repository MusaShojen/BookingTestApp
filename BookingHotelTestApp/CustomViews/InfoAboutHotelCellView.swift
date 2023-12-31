//
//  InfoAboutHotelCellView.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 21.12.2023.
//

import SwiftUI


struct InfoAboutHotelCellView: View {
    var peculiarities : [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(Array(peculiarities.enumerated()), id: \.element) { index, text in
                if index % 2 == 0 {
                    HStack( spacing: 8) {
                        InfoAboutHotelCell(text: text)
                        if index + 1 < peculiarities.count {
                            InfoAboutHotelCell(text: peculiarities[index + 1])
                        }
                        
                        
                    }
                }
            }
        }
        
     
        
       
        
    }
}

#Preview {
    InfoAboutHotelCellView(peculiarities: ["133", "213123"])
}

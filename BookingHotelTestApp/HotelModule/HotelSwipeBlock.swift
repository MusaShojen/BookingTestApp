//
//  HotelSwipeBlock.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 16.12.2023.
//

import SwiftUI

struct HotelSwipeBlock: View {
    
    var hotel = MockHotel.hotel
    
    var images = ["1","22","33"]
    
    var body: some View {
        
        VStack{
            
            TabView {
                
                ForEach(0..<3) {
                    i in
                    Image("\(images[i])").resizable().aspectRatio(contentMode: .fit)
                    
                    
                }
                
            }.tabViewStyle(PageTabViewStyle())
.frame(width: 343, height: 257)
              
            HStack {
                
                ForEach(images.indices, id: \.self) { index in
                    Circle()
                        .fill(Color.black)
                        .frame(width: 10, height: 10)
                        .opacity(Double(index + 1) / Double(images.count + 1))
                }


                
            }
        }
        
    }
    
    
}

#Preview {
    HotelSwipeBlock()
}


//
//  HotelSwipeBlock.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 16.12.2023.
//

import SwiftUI

struct Carousel: View {
    
   @State private var currentIndex = 0
    
    var imageURLS : [String]
    
    var body: some View {
        
    
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
                
                
                
                TabView (selection: $currentIndex){
                    
                    ForEach(0..<imageURLS.count) {
                        i in
                        AsyncImage(url: URL(string: imageURLS[i])){
                            
                            image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                        }placeholder: {
                           SpinnerView()
                        }
                           
                           
                        
                        
                    }
                    
                    
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    
                
                
                
                
                
                
                
                HStack(alignment: .top, spacing: 5) {
                    ForEach(0..<imageURLS.count) { index in
                        Circle()
                            .fill(self.currentIndex != index ? Color(.gray) : Color(.black))
                            .frame(width: 7, height: 7)
                            .opacity(opacity(for: index))
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding(.bottom, 8)
                
                
                
                
            } .clipShape(RoundedRectangle(cornerRadius: 15))
            
        }
     
    
    
    private func opacity(for index: Int) -> Double {
        let distance = abs(index - currentIndex)
        let maxDistance = Double(imageURLS.count - 1)
        let opacity = 1.0 - (Double(distance) / maxDistance)
        return max(0.2, opacity)
    }
}

#Preview {
    Carousel(imageURLS:MockHotel.hotel.imageUrls)
}


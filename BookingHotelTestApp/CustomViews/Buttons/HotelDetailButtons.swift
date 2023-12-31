//
//  HotelDetailButtons.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 20.12.2023.
//

import SwiftUI

struct HotelDetailButtons: View {
    var body: some View {
        
        
       VStack {
        VStack(spacing: 10){
            
            
            HotelDetailButton(image: "Image 1", title: "Удобства", detail: "Самое необходимое")
            
            HStack{
                
                ExDivider().frame(width: 330)
                
            }
            
            
            
            
            
            
            HotelDetailButton(image: "Image 2", title: "Что включено", detail: "Самое необходимое")
            
            
            
            HStack{
            
                
                ExDivider().frame(width: 330)
                
            }
            
            HotelDetailButton(image: "Image 3", title: "Что не включено", detail: "Самое необходимое")
            
        }
        
        
        
        .background(Color(red: 0.98, green: 0.98, blue: 0.99))
        //.padding(15)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        
    }
         
        }
    
}

#Preview {
    HotelDetailButtons()
       
}


struct ExDivider: View {
    let color: Color = Color(red: 0.51, green: 0.53, blue: 0.59).opacity(0.15)
    let width: CGFloat = 1
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .edgesIgnoringSafeArea(.horizontal)
    }
    
}
struct HotelDetailButton: View {
    
    let image: String
    let title: String
    let detail: String
    
    var body: some View {
        
        Button {
            print("")
            
        }
        
    label: {
            HStack{
                
                Image(image)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading) {
                    Text(title)
                      .font(
                        Font.custom("SF Pro Display", size: 16)
                          .weight(.medium)
                      )
                      .foregroundColor(Color(red: 0.17, green: 0.19, blue: 0.21))
                    Text(detail)
                      .font(
                        Font.custom("SF Pro Display", size: 14)
                          .weight(.medium)
                      )
                      .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    
                    
                }
                
                Spacer()
                Image("Image 4")
                    .resizable()
                    .frame(width: 24, height: 24)
                
                
            }
            .padding(.horizontal, 15)
        }
        
    }
    
    
}

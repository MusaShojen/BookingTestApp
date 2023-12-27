//
//  AboutHotelBlock.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 23.12.2023.
//

import SwiftUI



struct AboutHotelBlock: View {
    
    
    var info: InfoAboutHotel
    
    
    var body: some View {
        
        VStack (alignment: .leading){
            
            StarsCell(rating: info.hotelRating, ratingName: info.ratingName)
                .padding(.bottom, 8)
            
            
            Text(info.hotelName)
                .font(
                    Font.custom("SF Pro Display", size: 22)
                        .weight(.medium)
                )
                .foregroundColor(.black)
                .padding(.bottom, 8)
            
            
            
            Button {
                print("")
            } label: {
                Text(String(info.hotelAdress))
                    .font(
                        Font.custom("SF Pro Display", size: 14)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
                
            }
            
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
     //   .frame(maxWidth: .infinity)
        .padding( 16)
        
        .background(.white)

    }
}

protocol InfoAboutHotel{

    var hotelRating: Int {get}
    var ratingName: String {get}
    var hotelName: String {get}
    var hotelAdress: String {get}
}

extension Hotel : InfoAboutHotel{
    
    var hotelRating: Int {
        return self.rating
    }
    
    var hotelName: String {
        return self.name
    }
    
    var hotelAdress: String {
        return self.adress
    }
    
    
    
    
}

extension BookingModel : InfoAboutHotel{
    
    var hotelRating: Int {
        return self.horating
    }
    
   
    
    
    
 
    
    
    
    
}

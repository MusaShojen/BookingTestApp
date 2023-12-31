//
//  CustomInfoTable.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 25.12.2023.
//

import SwiftUI





struct ArrivalTable: View  {
    
    let booking: BookingModel
    
    
    var body: some View {
        
        VStack(spacing: 16){
            
            HStack{
                Text("Вылет из")
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    .frame(alignment: .leading)
                   
                Spacer()
                
                
                Text(booking.departure)
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(.black)
                    .frame(width: 203, alignment: .leading)
            }
            
            HStack{
                Text("Страна, город")
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    .frame(alignment: .leading)
                   
                
                Spacer()
                
                Text(booking.arrivalCountry)
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(.black)
                    .frame(width: 203, alignment: .leading)
            }
           
            HStack{
                Text("Даты")
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    .frame(alignment: .leading)
                  
                Spacer()
                
                
                Text("\(booking.tourDateStart) - \(booking.tourDateStop)")
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(.black)
                    .frame(width: 203, alignment: .leading)
            }
           
            
            HStack{
                Text("Кол-во ночей")
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    .frame(alignment: .leading)
                 
                
                Spacer()
                
                Text(String(booking.numberOfNights))
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(.black)
                    .frame(width: 203, alignment: .leading)
            }
           
            
            HStack{
                Text("Отель")
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    .frame(alignment: .leading)
                    
                
                Spacer()
                
                Text(booking.hotelName)
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(.black)
                    .frame(width: 203, alignment: .leading)
            }
            
            HStack{
                Text("Номер")
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    .frame(alignment: .leading)
                   
                Spacer()
                
                
                Text(booking.room)
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(.black)
                    .frame(width: 203, alignment: .leading)
            }
            
            
            HStack{
                Text("Питание")
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    .frame(alignment: .leading)
                   
                Spacer()
                
                
                Text(booking.nutrition)
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(.black)
                    .frame(width: 203, alignment: .leading)
            }
            
            
        }
        .padding(16)
     
        .frame(maxWidth: .infinity, alignment: .leading)
       
            .background(.white)
    }
}


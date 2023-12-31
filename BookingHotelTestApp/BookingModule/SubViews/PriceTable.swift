//
//  PriceTable.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 25.12.2023.
//

import SwiftUI


struct PriceTable: View {
    
    var booking: BookingModel
    
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Тур")
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    .frame(alignment: .leading)
                
                Spacer()
                
                Text("\(booking.tourPrice.formatToSpace()) ₽")
                    .font(Font.custom("SF Pro Display", size: 16))
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.black)
                    .frame(alignment: .topTrailing)
            }
            
            HStack {
                Text("Топливный сбор")
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    .frame(alignment: .leading)
                
                Spacer()
                
                Text("\(booking.fuelCharge.formatToSpace()) ₽")
                    .font(Font.custom("SF Pro Display", size: 16))
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.black)
                    .frame(alignment: .topTrailing)
            }
            
            HStack {
                Text("Сервисный сбор")
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    .frame(alignment: .leading)
                
                Spacer()
                
                Text("\(booking.serviceCharge.formatToSpace()) ₽")
                    .font(Font.custom("SF Pro Display", size: 16))
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.black)
                    .frame( alignment: .topTrailing)
            }
            
            HStack {
                Text("К оплате")
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    .frame(alignment: .leading)
                
                Spacer()
                
                Text("\(booking.totalPrice) ₽")
                    .font(Font.custom("SF Pro Display", size: 16).weight(.semibold))
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
                    .frame( alignment: .topTrailing)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white)
    }
}


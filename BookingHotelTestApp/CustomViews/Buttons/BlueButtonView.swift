//
//  BlueButtonView.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 20.12.2023.
//

import SwiftUI

struct BlueButtonView: View {
    
    let   buttonText : String
    
    var body: some View {
       
            
            HStack{
                HStack(alignment: .center, spacing: 0) {
                    Spacer()
                    
                    
                    Text(buttonText)
                        .font(
                            Font.custom("SF Pro Display", size: 16)
                                .weight(.medium)
                        )
                        .kerning(0.1)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame( alignment: .center)
                    
                    
                    Spacer()
                    
                    
                }
                
                .padding(.top, 15)
                .padding(.bottom, 14)
                .frame( height: 48, alignment: .center)
                .background(Color(red: 0.05, green: 0.45, blue: 1))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
            }
           
            
            
            .frame(maxWidth: .infinity)
            .background(Color.white)
            
            
        }
    }


#Preview {
    BlueButtonView(buttonText: "К выбору номера")
}

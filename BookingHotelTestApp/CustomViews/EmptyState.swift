//
//  EmptyState.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 27.12.2023.
//

import SwiftUI

struct EmptyState: View {
    
    @EnvironmentObject private var model: Coordinator
    
    var body: some View {
        
        VStack {
            VStack{
                Circle()
                    .frame(width: 94, height:94)
                    .foregroundStyle(Color(red: 0.96, green: 0.96, blue: 0.98))
                    .overlay{
                        
                        Text("🎉")
                            .frame(width: 72, height: 72)
                            .font(.system(size: 50))
                            .padding(25)
                        
                        
                        
                        
                    }
                
            }.frame(alignment: .center)
                .padding(.top, 122)
                .padding(.bottom, 32)
            
            
            Text("Ваш заказ принят в работу")
              .font(
                Font.custom("SF Pro Display", size: 22)
                  .weight(.medium)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 343, alignment: .top)
              .padding(.horizontal, 16)
              .padding(.bottom, 20)
            
            Text("Подтверждение заказа №\(Int.random(in:0...999)) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
              .font(Font.custom("SF Pro Display", size: 16))
              .multilineTextAlignment(.center)
              .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
              .frame(width: 329, alignment: .top)
              .padding(.horizontal, 23)
            
            Spacer()
            Button{
                model.path = []
            }label: {
                BlueButtonView(buttonText: "Супер!")
                    .padding(.horizontal, 16)
                    .padding(.bottom, 21)
            }
            
            
        }.navigationDestination(for: String.self) { destination in
            model.resolve(pathItem: destination)
        }
        
        
        
    }
}

#Preview {
    EmptyState()
}

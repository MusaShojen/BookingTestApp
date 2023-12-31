//
//  RoomCell.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 21.12.2023.
//

import SwiftUI

struct RoomCell: View {
    
    var room: Room
    @EnvironmentObject private var model: Coordinator
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            Carousel(imageURLS: room.imageUrls)
                .frame(height: 257)
                .padding(.horizontal, 16.0)
                .padding(.vertical, 8)
            
            
            Text("Стандартный с видом на бассейн или сад")
                .font(
                    Font.custom("SF Pro Display", size: 22)
                        .weight(.medium)
                )
                .foregroundColor(.black)
                .frame( alignment: .topLeading)
                .padding(.horizontal, 16)
                .padding(.bottom, 8)
            
            InfoAboutHotelCellView(peculiarities: room.peculiarities)
            
            
                .padding(.leading, 16)
                .padding(.trailing, 64)
            
            
            
            Button {
                print("")
            } label: {
                
                HStack(alignment: .center, spacing: 2) {
                    
                    Text("Подробнее о номере")
                        .font(
                            Font.custom("SF Pro Display", size: 16)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
                    
                    Image("Vector 55")
                        .resizable()
                        .frame(width: 6, height: 12)
                        .padding(.leading, 10)
                        .padding(.trailing, 8)
                        .padding(.vertical, 6)
                    
                    
                    
                }
                .padding(.leading, 10)
                .padding(.trailing, 2)
                .padding(.vertical, 5)
                .frame(height: 29, alignment: .leading)
                .background(Color(red: 0.05, green: 0.45, blue: 1).opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 5))
                
                
            }
            
            .padding(.leading, 16)
            .padding(.bottom, 16)
            
            
            
            HStack (alignment: .bottom) {
                
                Text("от \(room.formattedPrice) ₽")
                    .font(
                        Font.custom("SF Pro Display", size: 30)
                            .weight(.semibold)
                    )
                    .foregroundColor(.black)
                
                
                Text(room.pricePer)
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    .padding(.leading, 8.0)
                    .padding(.bottom, 3.0)
                
                
                
            }
            .padding(.leading, 16)
            .padding(.bottom, 16)
            
            Button {
                
                model.path += ["second"]
            }
            
        label:  {
            BlueButtonView(buttonText: "Выбрать номер")
            
        }
            
            
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
            
            
            
        }
        .navigationDestination(for: String.self) { destination in
            model.resolve(pathItem: destination)
        }
                .background(.white)
            
            
            
            
        .environmentObject(model)
            
            
            
        
        
        
        
        
        
        
        
    }
    
}

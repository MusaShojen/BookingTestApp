//
//  CustomList.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 22.12.2023.
//
import SwiftUI

struct CustomListView<Content>: View where Content: View {
    let content: () -> Content
    let alignment: HorizontalAlignment
    let spacing: CGFloat
    let backGroundColor: Color
   
    
    init(backGroundColor: Color = Color(red: 0.96, green: 0.96, blue: 0.98), spacing: CGFloat = 8 , alignment: HorizontalAlignment = .leading, @ViewBuilder content: @escaping () -> Content) {
      
        self.alignment = alignment
        self.content = content
        self.spacing = spacing
        self.backGroundColor = backGroundColor
    }
    
    
    var body: some View {
        ScrollView{
            LazyVStack(alignment: alignment, spacing: spacing) {
                
                
                content()
                  
               
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                    
            }
            .frame(maxWidth: .infinity)
      
            
       
        }
            .background(backGroundColor)
    
    }
}


#Preview {
    CustomListView{
        HStack {
            Text("2131")
            Spacer()
        }.background(.blue)
        Text("2131").background(.blue)
        Text("2131").background(.blue)
        
    }
}


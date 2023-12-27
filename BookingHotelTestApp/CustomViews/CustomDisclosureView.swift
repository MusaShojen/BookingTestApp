//
//  CustomDisclosureView.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 24.12.2023.
//

import SwiftUI

struct CustomDisclosureView<Content: View>: View {
    @Binding var isExpanded: Bool
    @Binding var tourists: [Tourist]
    @EnvironmentObject private var viewModel: BookingViewModel
    @State private var showActionSheet = false

    var content: Content
    var title: String
    
    init(title: String,isExpanded: Binding<Bool>, tourists: Binding<[Tourist]>, @ViewBuilder content: @escaping () -> Content) {
        self._tourists = tourists
        self._isExpanded = isExpanded
        self.content = content()
        self.title =  title
        
    }
    
    var body: some View {
        VStack {

            
            Button {
                withAnimation {
                    isExpanded.toggle()
                }
            } label: {
                HStack {
                    Text("\(title) турист ")
                        .font(
                            Font.custom("SF Pro Display", size: 22)
                                .weight(.medium)
                        )
                        .foregroundColor(.black)

                    Spacer()

                    Image("Vector 57")
                        .frame(width: 32.00001, height: 32.00001, alignment: .center)
                        .rotationEffect(isExpanded ? .degrees(-180) : .zero)
                        .background(Color(red: 0.05, green: 0.45, blue: 1).opacity(0.1))
                        .cornerRadius(6)
                }
            }
            .onLongPressGesture {
                           showActionSheet.toggle()
                       }
                       .actionSheet(isPresented: $showActionSheet) {
                           ActionSheet(
                               title: Text("Delete Tourist"),
                               message: Text("Are you sure you want to delete this tourist?"),
                               buttons: [
                                   .destructive(Text("Delete")) {
                                       // Действие по удалению туриста
                                      tourists.removeLast()
                                   },
                                   .cancel()
                               ]
                           )
                       }
           
            .padding(.horizontal, 16)
            .padding(isExpanded ? EdgeInsets(top: 16, leading: .zero, bottom: 20, trailing: .zero) : EdgeInsets(top: 13, leading: .zero, bottom: 13, trailing: .zero))
           
            

                

            
            if isExpanded {
              
                content
            }
        }
    }
}

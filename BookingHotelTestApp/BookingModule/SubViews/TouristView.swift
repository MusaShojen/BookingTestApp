//
//  TouristView.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 22.12.2023.
//

struct Tourist {
    
    let touristNumbers = [1: "Первый", 2: "Второй", 3: "Третий", 4: "Четвертый", 5: "Пятый", 6: "Шестой", 7: "Седьмой", 8: "Восьмой", 9: "Девятый"]
    let id: Int
       var touristNumber: String {
           return touristNumbers[id] ?? "Десятый"
       }
}

import SwiftUI

 
struct TouristView: View {
    
    @State private var customText: [String] = Array(repeating: "", count: 6)
    @State private var isDisclosureGroupExpanded = false
    @Binding var payButtonPressed: Bool
    @Binding var viewIsValid: Bool
    @Binding var tourists: [Tourist]
    let tourist: Tourist
    
    var body: some View {
        
        VStack {
            
            CustomDisclosureView(title: tourist.touristNumber, isExpanded: $isDisclosureGroupExpanded, tourists: $tourists) {
                
                CustomListView(backGroundColor: .white) {
                    
                    ForEach(0..<customText.count, id: \.self) { index in
                        TouristViewTextFieldCell(title: getTitle(for: index), payButtonPressed: $payButtonPressed, text: $customText[index], viewIsValid: $viewIsValid, inputType: .normal)
                            .frame(height: 52)
                            .padding(.horizontal, 16)
                            .onChange(of: customText[index]) {
                            oldValue, newValue in
                                
                                print("printng: \(newValue)")
                                
                            }
                        
                            
                    }
                    
                }
                .background(.white)
                .padding(.bottom, 16)
                
            }
        }
        .frame(minHeight: 57)
    }
    
    private func getTitle(for index: Int) -> String {
        switch index {
        case 0: return "Имя"
        case 1: return "Фамилия"
        case 2: return "Дата рождения"
        case 3: return "Гражданство"
        case 4: return "Номер загранпаспорта"
        case 5: return "Срок действия загранпаспорта"
        default: return ""
        }
    }
}







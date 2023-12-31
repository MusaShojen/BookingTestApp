//
//  TouristViewTextFieldCell.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 24.12.2023.
//

import SwiftUI
enum InputType {
    case phoneNumber
    case email
    case normal
}

struct TouristViewTextFieldCell: View {
    var title: String
    @Binding var payButtonPressed : Bool
    @Binding var text: String
    @Binding var viewIsValid: Bool
    @FocusState private var isTextFieldFocused: Bool
    @State var isValid = true
    @State var backGroundColor = Color(red: 0.96, green: 0.96, blue: 0.98)
    var inputType: InputType = .normal
    

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            
          
                Text(title)
                    .font(Font.custom("SF Pro Display", size: !isTextFieldFocused && text.isEmpty ? 17 : 12))
                    .kerning(!isTextFieldFocused && text.isEmpty ? 0.17 : 0.12)
                    .foregroundColor(Color(red: 0.66, green: 0.67, blue: 0.72))
            
            if inputType == .phoneNumber {
               
                CustomTextField(text: $text, inputType: inputType, placeholder: "" )
                    .font(Font.custom("SF Pro Display", size: 16))
                    .kerning(0.75)
                    .foregroundColor(Color(red: 0.08, green: 0.08, blue: 0.17))
                    .focused($isTextFieldFocused)
                    .onTapGesture {
                        isTextFieldFocused = true
                        print("custom")
                 
                        
                    }
                    .onChange(of: isTextFieldFocused) { _ , _ in
                        
                       
                        
                        formatInputValidation()
                        
                  
                       
                        
                        
                        
                    }
                   
                
                
            } else {
                
                TextField("" ,text: $text)
                    .font(Font.custom("SF Pro Display", size: 16))
                    .kerning(0.75)
                    .foregroundColor(Color(red: 0.08, green: 0.08, blue: 0.17))
                    .focused($isTextFieldFocused)
                    .onTapGesture {
                        isTextFieldFocused = true
                    }
                
                    .onChange(of: isTextFieldFocused) { _ , _ in
                        
                        formatInputValidation()
                    }
                
                
               
            }
       
            
            
        }
        .padding(.leading, 16)
        .padding(.vertical, 10)
        .frame(height: 52)
       
        .background(haveToPaintInRed(isValid,inputType: inputType))
       //.background(Color(hex:"#EB5757", opacity: 0.15))
        .cornerRadius(8)
    }
    
    
   
}

extension TouristViewTextFieldCell {
    
    
    func haveToPaintInRed(_ isValid: Bool, inputType: InputType) -> Color {
        
        let   withoutMistake = Color(red: 0.96, green: 0.96, blue: 0.98)
        
        let withMistake = Color(hex:"#EB5757", opacity: 0.15)
        
        switch inputType {
            
            
            
            
        case .phoneNumber, .email:
            
            if payButtonPressed && text.isEmpty {
                viewIsValid = false
                return withMistake
                
            }
               
               if isValid {
                   return withoutMistake
               }else {
                   
                   viewIsValid = false
                   return withMistake
                   
               }
       
        case .normal:
            
       
            
            if payButtonPressed {
                
              
                
           
                
                if text.isEmpty{
                    viewIsValid = false
                    return withMistake
                }
                

                
            } else {
                
                return Color(red: 0.96, green: 0.96, blue: 0.98)
            }
        }
        
        
                if isValid {
                    return withoutMistake
                }else {
                    viewIsValid = false
                    return withMistake

                }
        
    }
    
    
    func isValidEmail(_ email: String) -> Bool {
        // Паттерн для валидации электронной почты
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        
        // Создаем регулярное выражение
        if let regex = try? NSRegularExpression(pattern: emailRegex, options: .caseInsensitive) {
            // Ищем соответствие паттерну в строке
            let range = NSRange(location: 0, length: email.count)
            return regex.firstMatch(in: email, options: [], range: range) != nil
        }
        
        return false
    }

    
    
    private func formatInputValidation() {
        switch inputType {
        case .phoneNumber:
            // Здесь вызывайте форматирование для номера телефона
            phoneNumberValidation()

            
        case .email:
            // Здесь вызывайте форматирование для электронной почты
            emailValidation()
        case .normal:
           normalValidation()
        }
    }
    
    
    private func normalValidation() {
  
     isValid = true
       
        
        
        
    }
    
    
    private func phoneNumberValidation(){
        
        if text.contains("*") {
            isValid = false
            
        }
        
        
        
        if  text.components(separatedBy: CharacterSet.decimalDigits.inverted).joined() == "7" {
            
            isValid = true
            
        }
        
      }
    
    
    private func emailValidation() {
        
        
        if text.isEmpty{
            isValid = true
            
        } else {
            isValid = isValidEmail(text)
            
            print("validation: \(isValid)")
        
        }
        
    }
    
    
    
}

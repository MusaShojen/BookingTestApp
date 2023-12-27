//
//  UITextViewWrapper.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 25.12.2023.
//

import SwiftUI

struct CustomTextField: UIViewRepresentable {
    
    
    @Binding var text: String
    let mask = "+7 (***) ***-**-**"
    let inputType: InputType
    var placeholder: String
    
    var cursorPosition: Int {
        
        switch inputType {
        case .phoneNumber:
            return 4
        case .email:
            return 0
        case .normal:
            return 0
        }
        
    }
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: CustomTextField
        var arbitraryValue : Int
        init(parent: CustomTextField) {
            self.parent = parent
            arbitraryValue = parent.cursorPosition
        }
        
        func setup(_ textField:UITextField) {
            textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
        
        @objc func textFieldDidChange(_ textField: UITextField) {
            
            self.parent.text = textField.text ?? ""
            
            
        }
        
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            
            setupDidBegin(textField: textField)
            parent.text = textField.text!
            
        }
        
        
        private func setupDidBegin(textField: UITextField) {
            
            switch parent.inputType {
                
            case .phoneNumber:
                textField.text = parent.mask
                setCursorPosition(textField, position: arbitraryValue)
                
            case .email:
                break
            case .normal:
                break
            }
            
            
        }
        
        
        private func setupShouldChange(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String ){
            
            switch parent.inputType {
            case .phoneNumber:
                formatShouldChange(textField,shouldChangeCharactersIn: range, replacementString: string )
            case .email, .normal:
                break
            }
            
        }
        
        
        
        private func formatShouldChange(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String ) {
            
            guard let text = textField.text else { return  }
            
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
            
            
            textField.text = format(with: "+* (***) ***-**-**", phone: newString)
            
            parent.text = textField.text!
            
            setCursorPosition(textField, position: arbitraryValue)
            
        }
        
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            
            setupShouldChange(textField, shouldChangeCharactersIn: range, replacementString: string )
            
            
            return shouldAllowChange(for: parent.inputType)
            
        }
        
        
        
        
        
        private func setCursorPosition(_ textField: UITextField, position: Int) {
            
            
            if let newPosition = textField.position(from: textField.beginningOfDocument, offset: position) {
                
                DispatchQueue.main.async {
                    textField.selectedTextRange = textField.textRange(from: newPosition, to: newPosition)
                }
            }
            
            
        }
        
        
        
        
        
        func format(with mask: String, phone: String) -> String {
            let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
            
           
            
            var result = ""
            var resultMask = "+* (***) ***-**-**"
            var index = numbers.startIndex
            
            
            
            for ch in mask where index < numbers.endIndex {
                if ch == "*" {
                    
                    
                    result.append(numbers[index])
                    index = numbers.index(after: index)
                    resultMask.removeFirst()
                    
                    
                } else {
                    
                    result.append(ch)
                    resultMask.removeFirst()
                    
                    
                    
                }
                
            }
            
            arbitraryValue = result.count
            return result+resultMask
        }
        
        
        
        private func shouldAllowChange(for inputType: InputType) -> Bool {
            switch inputType {
            case .phoneNumber:
                return false
            case .email, .normal:
                return true
            }
        }
    }
    
    
    
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.placeholder = placeholder
        textField.text = text
        context.coordinator.setup(textField)
        return textField
    }
    
    
    
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        
    }
    
    
}


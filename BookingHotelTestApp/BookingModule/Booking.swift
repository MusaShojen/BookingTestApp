//
//  Booking.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 22.12.2023.
//

import SwiftUI


struct Booking: View {
   
    @StateObject private var viewModel = BookingViewModel()
    @EnvironmentObject private var model: Coordinator
    @State var tourists: [Tourist] = [Tourist(id: 1),Tourist(id: 2)]
    var body: some View {
        
        ZStack{
            
            CustomListView{
                Section {
                    
                    
                    AboutHotelBlock(info: viewModel.booking)
                    
                    
                    
                    
                }
                
                Section {
                    ArrivalTable(booking: viewModel.booking)
                }
                
                Section {
                    VStack{
                        
                        Text("Информация о покупателе")
                            .font(
                                Font.custom("SF Pro Display", size: 22)
                                    .weight(.medium)
                            )
                            .foregroundColor(.black)
                        
                            .frame(width: 343, alignment: .topLeading)
                            .padding(.bottom, 20)
                            .padding(.top,16)
                        
                        VStack(spacing:8){
                            TouristViewTextFieldCell(title: "Номер телефона", payButtonPressed: $viewModel.payButtonPressed, text: $viewModel.text, viewIsValid: $viewModel.viewIsValid, inputType: .phoneNumber)
                            
                            
                            TouristViewTextFieldCell(title: "Почта", payButtonPressed: $viewModel.payButtonPressed, text: $viewModel.emailText, viewIsValid: $viewModel.viewIsValid, inputType: .email)
                            
                            
                            
                            Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                                .font(Font.custom("SF Pro Display", size: 14))
                                .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                            
                                .frame(width: 343, alignment: .topLeading)
                        }.padding(.horizontal, 16)
                            .padding(.bottom,16)
                        
                    }.background(.white)
                }
                ForEach(tourists, id: \.id) { tourist in
                    
                    
                    Section {
                        
                        TouristView( payButtonPressed: $viewModel.payButtonPressed, viewIsValid: $viewModel.viewIsValid, tourists: $tourists, tourist: tourist)
                        
                        
                        
                            .background(.white)
                        
                    }
                    
                }
                if tourists.count <= 9 {
                    Section {
                        Button{
                            
                            tourists.append(Tourist(id:tourists.count+1))
                        } label: {
                            HStack {
                                Text("Добавить туриста")
                                    .font(
                                        Font.custom("SF Pro Display", size: 22)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Image("Frame 609")
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 12)
                                    .frame(width: 32.00001, height: 32.00001 ,alignment: .center)
                                    .background(Color(red: 0.05, green: 0.45, blue: 1))
                                    .cornerRadius(6)
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 13)
                            .background(.white)
                            
                            .cornerRadius(12)
                        }
                        
                    }
                    
                }
                
                Section {
                    PriceTable(booking: viewModel.booking)
                    
                }
                
                Section{
                    
                    Button{
                        
                        viewModel.payButtonPressed = true
                        if viewModel.viewIsValid {
                            model.path += ["third"]
                        }
                        
                        
                    } label: {
                        HStack{
                            BlueButtonView(buttonText: "Оплатить \(viewModel.booking.totalPrice) ₽")
                                .padding(.horizontal, 16)
                        }
                        .frame(height: 88)
                        .background(.white)
                    }
                }
                
            }
            
            
            
            if viewModel.isLoading {
                
                
                SpinnerView()
                
            }
        }
        
       
        .task{
            viewModel.getBooking()
            
        }
        .alert("Ошибка", isPresented: $viewModel.isError) {
            Button("OK") {
            }
        } message: {
            Text(viewModel.error)
        }
        .padding(.bottom, 8)
        .navigationDestination(for: String.self) { destination in
            model.resolve(pathItem: destination)
        }
                
                    
                    
                
        }
        
        
    }
    







extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        print(cleanHexCode)
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}


extension Color {
    init(hex: String, opacity: Double = 1.0) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0

        // Создаем UIColor с прозрачностью
        let uiColor = UIColor(red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: CGFloat(opacity))
        
        // Используем UIColor для создания объекта Color
        self.init(uiColor)
    }
}

//
//  HotelView.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 16.12.2023.
//

import SwiftUI

struct HotelView: View {
    
    @ObservedObject var viewModel = HotelViewModel()
    @StateObject private var model = Coordinator()
    
    
    var body: some View {
        
        
        
        
        
        
        NavigationStack(path: $model.path){
            
            ZStack {
                
                CustomListView{
                    
                    
                    
                    Section {
                        
                        
                        
                        VStack(alignment: .leading) {
                            
                            HStack{
                                Spacer()
                                Text("Отель")
                                    .frame(alignment: .center)
                                    .padding(.bottom,16)
                                    .padding(.top, 19)
                                    .font(
                                        Font.custom("SF Pro Display", size: 18)
                                            .weight(.medium)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                Spacer()
                                
                            }
                            
                            Carousel(imageURLS: viewModel.hotel.imageUrls)
                                .frame(height: 257)
                                .padding(.horizontal, 16.0)
                                .padding(.bottom, 8)
                            
                            
                            AboutHotelBlock(info: viewModel.hotel)
                            
                            
                            
                            
                            HStack (alignment: .bottom) {
                                
                                Text("от \(viewModel.hotel.minimalPrice.formatToSpace()) ₽")
                                    .font(
                                        Font.custom("SF Pro Display", size: 30)
                                            .weight(.semibold)
                                    )
                                    .foregroundColor(.black)
                                
                                
                                Text(viewModel.hotel.priceForIt)
                                    .font(Font.custom("SF Pro Display", size: 16))
                                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                                    .padding(.leading, 8.0)
                                    .padding(.bottom, 3.0)
                                
                            }
                            .padding(.leading, 16)
                            .padding(.vertical, 16)
                            
                        }
                    }.background(.white)
                    
                    Section{
                        VStack(alignment: .leading) {
                            
                            
                            Text("Об отеле")
                                .font(
                                    Font.custom("SF Pro Display", size: 22)
                                        .weight(.medium)
                                )
                                .foregroundColor(.black)
                                .padding(.leading, 16)
                                .padding(.top, 16)
                            
                            
                            
                            InfoAboutHotelCellView(peculiarities: viewModel.hotel.aboutTheHotel.peculiarities)
                            
                            
                                .padding(.leading, 16)
                                .padding(.trailing, 64)
                                .padding(.bottom, 12)
                            
                            
                            Text("Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!")
                                .font(Font.custom("SF Pro Display", size: 16))
                                .foregroundColor(.black.opacity(0.9))
                                .frame(alignment: .topLeading)
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 16)
                            
                            
                            
                            HotelDetailButtons()
                            
                                .padding(.horizontal, 16)
                                .padding(.bottom, 16)
                            
                            
                            
                        }
                        
                        
                    }.background(Color.white)
                    
                    Section {
                        
                        
                        Button{
                            model.path = ["first"]
                        }
                    label: {
                        BlueButtonView(buttonText: "К выбору номера")
                            .padding(.horizontal, 16.0)
                        
                    }
                        
                    }.frame(height: 88)
                        .background(.white)
                        .navigationDestination(for: String.self) { destination in
                            model.resolve(pathItem: destination).navigationTitle(viewModel.hotel.name)
                            
                        }
                    
                }
                
                
                
                if viewModel.isLoading {
                    
                    
                    SpinnerView()
                    
                }
                
                
            }
            
            
            .task {
                
                
                viewModel.getHotel()
                
                
            }
            
            .alert("Ошибка", isPresented: $viewModel.isError) {
                Button("OK") {
                }
            } message: {
                Text(viewModel.error)
            }
            
        }
        .disabled(viewModel.isLoading)
        .environmentObject(model)
        
        
        
    }
    
    
}
#Preview {
    HotelView()
}



//
//  RoomView.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 21.12.2023.
//

import SwiftUI

struct RoomView: View {
    
    
    @StateObject var viewModel = RoomViewModel()
    @EnvironmentObject private var model: Coordinator
    
    var body: some View {
        
        ZStack{
            
            CustomListView {
                
                ForEach(viewModel.rooms) { room in
                    Section {
                        RoomCell(room: room)
                        
                        
                    }
                    
                    
                    .padding(.bottom, 8)
                    
                    
                    
                    
                    
                    
                    
                }
                
                
                
                
            }
       
            .environmentObject(model)
            
            
            if viewModel.isLoading {
                
                
                SpinnerView()
                
            }
            
        }
        .task {
            viewModel.getRooms()
        }
        
        .alert("Ошибка", isPresented: $viewModel.isError) {
            Button("OK") {
            }
        } message: {
            Text(viewModel.error)
        }
        
    
    }
}


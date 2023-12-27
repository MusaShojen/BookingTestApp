//
//  Coordinator.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 27.12.2023.
//

import Foundation
import SwiftUI

final class Coordinator: ObservableObject {
    @Published var path: [String] = []
  
    func resolve(pathItem:String) -> some View {
        Group {
            switch pathItem {
            case "first": RoomView()
            case "second": Booking().navigationTitle("Бронирование") .navigationBarTitle("Бронирование", displayMode: .inline)
            case "third": EmptyState().navigationTitle("Заказ оплачен") .navigationBarTitle("Заказ оплачен", displayMode: .inline).navigationBarHidden(true)
            default:
                EmptyView()
            }
        }
    }
}

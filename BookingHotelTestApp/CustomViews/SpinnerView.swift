//
//  SpinnerView.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 21.12.2023.
//

import SwiftUI

struct SpinnerView: View {
  var body: some View {
      
      ZStack {
          Color(.systemBackground)
              .ignoresSafeArea()
          ProgressView()
              .progressViewStyle(CircularProgressViewStyle(tint: .blue))
              .scaleEffect(2.0, anchor: .center) 
      }
  }
}

#Preview {
    SpinnerView()
}

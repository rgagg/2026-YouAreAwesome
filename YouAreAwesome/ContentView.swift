//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Richard Gagg on 2/1/2026.
//

import SwiftUI

struct ContentView: View {
  
  @State private var message: String = "I Am A Progammer!"
  
  var body: some View {
    
    VStack {
      Spacer()
      
      Image(systemName: "swift")
        .resizable()
        .scaledToFit()
        .foregroundStyle(.orange)
        .frame(width: 200, height: 200)
      
      Text(message)
        .font(.largeTitle)
        .fontWeight(.ultraLight)
        .foregroundStyle(.black)
      
      Spacer()
      
      HStack {
        Button("Awesome!") {
          message = "Awesome!"
        }
        
        Button("Great!") {
          message = "Great!"
        }
      }
      .buttonStyle(.glassProminent)
      .font(.title2)
      .tint(.orange)
    }
    .padding()
    
  }
}

#Preview {
  ContentView()
}

//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Richard Gagg on 2/1/2026.
//

import SwiftUI

struct ContentView: View {
  
  @State private var message: String = ""
  @State private var image: String = ""
  var body: some View {
    
    VStack {
      Spacer()
      
      Image(systemName: image)
        .resizable()
        .scaledToFit()
        .foregroundStyle(.orange)
      
      Text(message)
        .font(.largeTitle)
        .fontWeight(.ultraLight)
        .foregroundStyle(.black)
      
      Spacer()
      
      Button("Press Me!") {
        let message1: String = "You Are Awesome!"
        let message2: String = "You are great!"
        let image1: String = "sun.max.fill"
        let image2: String = "hand.thumbsup"
        
        message = (message == message1 ? message2 : message1)
        image = (image == image1 ? image2 : image1)
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

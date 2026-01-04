//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Richard Gagg on 2/1/2026.
//

import SwiftUI

struct ContentView: View {
  
  @State private var messageString: String = ""
  @State private var imageName: String = ""
  var body: some View {
    
    VStack {
      Spacer()
      
      Image(imageName)
        .resizable()
        .scaledToFit()
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(radius: 30)
      
      Text(messageString)
        .font(.largeTitle)
        .fontWeight(.heavy)
        .foregroundStyle(.red)
      
      Spacer()
      
      Button("Press Me!") {
        let message1: String = "You Are Awesome!"
        let message2: String = "You are great!"
        let image1: String = "image0"
        let image2: String = "image1"
        
        messageString = (messageString == message1 ? message2 : message1)
        imageName = (imageName == image1 ? image2 : image1)
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

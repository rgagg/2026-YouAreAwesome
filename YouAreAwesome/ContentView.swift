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
  @State private var imageNumber: Int = 0
  
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
      
      Button("Show Message") {
        let message1: String = "You Are Awesome!"
        let message2: String = "You are great!"
        
        messageString = (messageString == message1 ? message2 : message1)
        imageName = "image\(imageNumber)"

        imageNumber += 1
        imageNumber = (imageNumber > 9 ? 0 : imageNumber)
        
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

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
  @State private var messageNumber = 0
  
  @State private var messages: [String] = [
    "You Are Awesome!",
    "You are great!",
    "Fabulous? That's you!",
    "You make me smile!",
    "You Swifty!",
    "You are a code monster!",
    "I think you are magic!",
    "Code GOD!"
  ]
  
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
        .multilineTextAlignment(.center)
      
      Spacer()
      
      Button("Show Message") {
        
        messageString = (messages[messageNumber])
        messageNumber += 1
        messageNumber = (messageNumber > (messages.count - 1) ? 0 : messageNumber)
        
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

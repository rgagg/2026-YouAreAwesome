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
  @State private var lastMessageNumber = -1 //Will never test true in button
  @State private var lastImageNumber = -1 //Will never test true in button
  
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
      
      Text(messageString)
        .font(.largeTitle)
        .fontWeight(.heavy)
        .foregroundStyle(.red)
        .multilineTextAlignment(.center)
        .minimumScaleFactor(0.5)
        .frame(height: 100)
        .animation(.easeInOut(duration: 0.2), value: messageString)
      
      Image(imageName)
        .resizable()
        .scaledToFit()
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(radius: 30)
        .animation(.easeInOut(duration: 0.4), value: imageName)
      
      Spacer()
      
      Button("Show Message") {
        
        var messageNumber: Int = Int.random(in: 0..<messages.count)
        var imageNumber: Int = Int.random(in: 0...9)
        
        repeat {
          messageNumber = Int.random(in: 0..<messages.count)
        } while messageNumber == lastMessageNumber
        lastMessageNumber = messageNumber
        messageString = (messages[messageNumber])

        repeat {
          imageNumber = Int.random(in: 0...9)
        } while imageNumber == lastImageNumber
        lastImageNumber = imageNumber
        imageName = "image\(imageNumber)"
        
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

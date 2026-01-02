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
            Image(systemName: "swift")
            .resizable()
            .scaledToFit()
            .foregroundStyle(.orange)
            Text(message)
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundStyle(.red)
          
          Button("Click Me!") {
            message = "Awesome!"
          }
        }
        .padding()
      
    }
}

#Preview {
    ContentView()
}

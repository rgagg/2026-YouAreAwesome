//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Richard Gagg on 2/1/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      
        VStack {
            Image(systemName: "swift")
            .resizable()
            .scaledToFit()
            .foregroundStyle(.orange)
            Text("I am a Developer!")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundStyle(.red)
        }
        .padding()
      
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Richard Gagg on 2/1/2026.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
  
  @State private var messageString: String = ""
  @State private var imageName: String = ""
  @State private var soundName: String = ""
  @State private var lastMessageNumber = -1 //Will never test true in button
  @State private var lastImageNumber = -1 //Will never test true in button
  @State private var lastSoundNumber = -1 //Will never test true in button
  @State private var audioPlayer: AVAudioPlayer! //Initialise audio player without data
  @State private var soundIsOn: Bool = true
  
  let numberOfImages: Int = 10 //Images labed image0-image9
  let numberOfSounds: Int = 6 //Sounds labeled sound0-sound5
  
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
      
      HStack {
        Text("Sound On:")
        Toggle("Sound On:", isOn: $soundIsOn)
          .labelsHidden()
          .onChange(of: soundIsOn) { oldValue, newValue in
            if audioPlayer != nil && audioPlayer.isPlaying {
              audioPlayer.stop()
            }
          }
        
        Spacer()
        
        Button("Show Message") {
          
          var messageNumber: Int
          var imageNumber: Int
          var soundNumber: Int
          
          messageNumber = nonRepeatingRandom(lastnumber: lastMessageNumber, upperBound: messages.count)
          lastMessageNumber = messageNumber
          messageString = messages[messageNumber]
          
          imageNumber = nonRepeatingRandom(lastnumber: lastMessageNumber, upperBound: numberOfImages)
          lastImageNumber = imageNumber
          imageName = "image\(imageNumber)"
          
          soundNumber = nonRepeatingRandom(lastnumber: lastMessageNumber, upperBound: numberOfSounds)
          lastSoundNumber = soundNumber
          if soundIsOn == true {
            playSound(soundName: "sound\(soundNumber)")
          }
        }
        .buttonStyle(.glassProminent)
        .font(.title2)
      }
      .tint(.accentColor)
    }
    .padding()
    
  }
  
  // Functions
  func playSound(soundName: String) {
    /*
     Import needed module
     Import AVFAudio
     
     Declare audio player
     @State private var audioPlayer: AVFAudioPlayer!
     
     Use the follering function call ensuring you use a
     sound file in the asset catalog
    */
    
    if audioPlayer != nil && audioPlayer.isPlaying {
      audioPlayer.stop()
    }
    
    guard let soundFile = NSDataAsset(name: soundName) else {
      print("🤬 Could not find sound file \(soundName)")
      return
    }
    do {
      audioPlayer = try AVAudioPlayer(data: soundFile.data)
      audioPlayer.play()
    } catch {
      print("🤬 Error: \(error.localizedDescription) creating audio player")
    }
  }
  
  
  func nonRepeatingRandom(lastnumber: Int, upperBound: Int) -> Int {
    var newNumber: Int
    
    repeat {
      newNumber = Int.random(in: 0..<upperBound)
    } while newNumber == lastnumber
    return newNumber
  }
  
}

#Preview("Light Mode") {
  ContentView()
    .preferredColorScheme(.light)
}
#Preview("Dark Mode") {
  ContentView()
    .preferredColorScheme(.dark)
}

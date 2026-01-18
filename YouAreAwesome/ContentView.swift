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
  let numberIfImages: Int = 10 //Images labed image0-image9
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
      
      Button("Show Message") {
        
        var messageNumber: Int
        var imageNumber: Int
        var soundNumber: Int
        
        repeat {
          messageNumber = Int.random(in: 0..<messages.count)
        } while messageNumber == lastMessageNumber
        lastMessageNumber = messageNumber
        messageString = (messages[messageNumber])

        repeat {
          imageNumber = Int.random(in: 0..<numberIfImages)
        } while imageNumber == lastImageNumber
        lastImageNumber = imageNumber
        imageName = "image\(imageNumber)"
        
        
        repeat {
          soundNumber = Int.random(in: 0..<numberOfSounds)
        } while soundNumber == lastSoundNumber
        lastSoundNumber = soundNumber
        soundName = "sound\(soundNumber)"

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

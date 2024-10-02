//  Created by BASHAER ALFEHAID on 26/09/2024.

import SwiftUI
import AVFoundation

struct bashaer: View {
    var body: some View {
        
      
            ZStack {
                
                HStack {
                    Image(systemName: "speaker.wave.2")
                        .font(.title2)
                        .foregroundColor(.black)
                        .rotationEffect(.degrees(180))
                        .padding(.bottom, 600)
                        .padding(.leading ,90)
                    Text("ماذا أحتاج الآن")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 600)
                        .padding(.leading,-4)
                }
               
               // .padding(.top, 100)
               // .padding(.bottom, 620.0)

                ZStack {
                    Rectangle() // Background rectangle
                        .fill(Color(red: 0.963, green: 0.953, blue: 0.996))
                        .frame(width: 450, height: 690)
                        .cornerRadius(100)
                        .padding(.top, 150)
                    
                    VStack(spacing: 20) {
                        Spacer().frame(height: 50) // square Starting
                        HStack(spacing: 30) {
                            SquareButton(imageName: "Image1", soundName: "Sound", cornerRadius: 10, width: 150, height: 150)
                            SquareButton(imageName: "image2", soundName: "sound2", cornerRadius: 10, width: 150, height: 150)
                        }
                        HStack(spacing: 30) {
                            SquareButton(imageName: "image3", soundName: "sound3", cornerRadius: 10, width: 150, height: 150)
                            SquareButton(imageName: "image4", soundName: "sound4", cornerRadius: 10, width: 150, height: 150)
                        }
                        HStack(spacing: 30) {
                            SquareButton(imageName: "image5", soundName: "sound5", cornerRadius: 10, width: 150, height: 150)
                            SquareButton(imageName: "image6", soundName: "sound6", cornerRadius: 10, width: 150, height: 150)
                        }
                    }
                    .padding()
                }
            }
        
    }
}

struct SquareButton: View {
    var imageName: String
    var soundName: String
    var cornerRadius: CGFloat
    var width: CGFloat
    var height: CGFloat
    
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        Button(action: {
            playSound(soundName: soundName)
        }) {
            Image(imageName)
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: height)
                .background(Color.white)
                .cornerRadius(cornerRadius)
                .shadow(color: .gray, radius: 5, x: 0, y: 2)
        }
    }

    private func playSound(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
            print("Audio file not found: \(soundName)")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error)")
        }
    }
}



#Preview {
    bashaer()
}

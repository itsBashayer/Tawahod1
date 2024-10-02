//
//  PPage.swift
//  Tawahod
//
//  Created by BASHAER AZIZ on 28/03/1446 AH.

import SwiftUI
import AVFoundation

struct PPage: View {
    var body: some View {
        
       
           
                
                ZStack {
                    
                    HStack {
                        Image(systemName: "speaker.wave.2")
                            .font(.title2)
                            .foregroundColor(.black)
                            .rotationEffect(.degrees(180))
                            .padding(.bottom, 600)
                            .padding(.leading ,90)
                        Text("ماذا يؤلمني")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 600)
                            .padding(.leading,-4)
                    }
                    HStack{
                       
                   

                    ZStack {
                        Rectangle() // Background rectangle
                            .fill(Color(red: 1.002, green: 0.967, blue: 0.838))
                            .frame(width: 450, height: 690)
                            .cornerRadius(100)
                            .padding(.top, 150)
                        
                        VStack(spacing: 20) {
                            Spacer().frame(height: 50) // square Starting
                            HStack(spacing: 30) {
                                FSquarButton(imageName: "stomach", soundName: "SoundP1", cornerRadius: 10, width: 150, height: 150)
                                FSquarButton(imageName: "tooth", soundName: "SoundP2", cornerRadius: 10, width: 150, height: 150)
                        }
                        HStack(spacing: 30) {
                            FSquarButton(imageName: "foot", soundName: "SoundP3", cornerRadius: 10, width: 150, height: 150)
                            FSquarButton(imageName: "head", soundName: "SoundP4", cornerRadius: 10, width: 150, height: 150)
                        }
                        HStack(spacing: 30) {
                            FSquarButton(imageName: "back", soundName: "SoundP5", cornerRadius: 10, width: 150, height: 150)
                            FSquarButton(imageName: "arm", soundName: "SoundP6", cornerRadius: 10, width: 150, height: 150)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct FSquarButton: View {
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
                .resizable()
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
    PPage()
}

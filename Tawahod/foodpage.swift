//
//  Food.swift
//  Tawahod
//
//  Created by Raneem on 27/03/1446 AH.
//
//  Created by BASHAER ALFEHAID on 26/09/2024.

import AVFoundation
import SwiftUI

struct foodpage: View {
    let items: [(imageName: String, Sound: String)] = [
        ("Food1", "out"),
        ("Food2", "out"),
        ("Food3", "out"),
        ("Food4", "sleep"),
        ("Food5", "bathroom"),
        ("Food6", "shower"),
        ("Food2", "Sound"),
        ("Food3", "Sound"),
        ("Food4", "Sound"),
        ("Food5", "Sound"),
        ("Food6", "Sound"),

    ]
    @State private var selectedButton: String = "Sound"  // State variable for selected avatar
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "speaker.wave.2.fill")
                    .font(.title2)
                    .foregroundColor(.black)
                    .rotationEffect(.degrees(180))
                Spacer()

                Text("طعام")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

            }.padding(.horizontal, 70)

            ZStack {
                RoundedRectangle(cornerRadius: 70)
                    .frame(maxWidth: .infinity, maxHeight: 690.0)
                    .foregroundColor(.pink.opacity(0.2))
                    .padding(.bottom, -100)
                ScrollView {
                    LazyVGrid(
                        columns: [GridItem(.adaptive(minimum: 150))],
                        spacing: 30
                    ) {
                        ForEach(Array(items.enumerated()), id: \.offset) {
                            index, item in
                            SquareButton1(
                                imageName: item.imageName,
                                soundName: item.Sound
                            )
                            .onTapGesture {
                                 selectedButton = item.Sound
                            }
                        }

                    }
                    .padding(30)
                }.padding(.top, 70)
            }
        }.padding(.top, 70)

    }
}

struct SquareButton3: View {
    var imageName: String
    var soundName: String

    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        Button(action: {
            playSound(soundName: soundName)
        }) {
            Image(imageName)
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .background(Color.white)
                .cornerRadius(10)
             //   .shadow(color: .gray, radius: 5, x: 0, y: 2)
        }
    }

    private func playSound(soundName: String) {
        guard
            let url = Bundle.main.url(
                forResource: soundName, withExtension: "mp3")
        else {
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

struct PreviousView3: View {  //Back to home Page Code
    var body: some View {
        Text("Back to home Page")
            .font(.largeTitle)
    }
}

#Preview {
    foodpage()
}

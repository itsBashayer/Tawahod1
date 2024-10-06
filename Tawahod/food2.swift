//
//  food2.swift
//  Tawahod
//
//  Created by Razan on 03/04/1446 AH.
//
import AVFoundation
import SwiftUI

struct food2: View {
    var body: some View {

        ZStack {
            HStack {
                Image(systemName: "speaker.wave.2")
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding(.leading, -170)
                    .rotationEffect(.degrees(180))

                Text("الطعام")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.leading, 200)
            }
            .padding(.bottom, 620.0)

            ZStack {
                Rectangle()  // Background rectangle
                    .fill(Color(red: 1.002, green: 0.898, blue: 0.9))
                    .frame(width: 450, height: 690)
                    .cornerRadius(100)
                    .padding(.top, 150)

                VStack(spacing: 20) {
                    Spacer().frame(height: 50)  // square Starting
                    HStack(spacing: 30) {
                        SquareBttong(
                            imageName: "Food1", soundName: "rice1",
                            cornerRadius: 10, width: 150, height: 150)
                        SquareBttong(
                            imageName: "Food2", soundName: "eg",
                            cornerRadius: 10, width: 150, height: 150)
                    }
                    HStack(spacing: 30) {
                        SquareBttong(
                            imageName: "Food3", soundName: "coki",
                            cornerRadius: 10, width: 150, height: 150)
                        SquareBtton(
                            imageName: "Food4", soundName: "",
                            cornerRadius: 10, width: 150, height: 150)
                    }
                    HStack(spacing: 30) {
                        SquareBttong(
                            imageName: "Food5", soundName: "salad",
                            cornerRadius: 10, width: 150, height: 150)
                        SquareBttong(
                            imageName: "Food6", soundName: "pizza",
                            cornerRadius: 10, width: 150, height: 150)
                    }
                }
                .padding()
            }
        }

    }
}

struct SquareBttong: View {
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

}

#Preview {
    food2()
}


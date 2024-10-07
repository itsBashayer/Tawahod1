import AVFoundation
import SwiftUI

struct FeelingsView: View {
    var body: some View {
        HStack {
//            Spacer()  // Add a spacer to push content to the right
            VStack {
                HStack {
                    Text("ماذا أشعر الآن")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        /*.padding(.trailing, 130)*/  // Change to trailing padding
                    Image(systemName: "speaker.wave.2")
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding(.trailing, 130)
//                        .padding(.trailing, -100)  // Change to trailing padding
//                        .rotationEffect(.degrees(180))
                }
                
                ZStack {
                    Rectangle()  // Background rectangle
                        .fill(Color(red: 0.935, green: 0.97, blue: 0.952))
                        .frame(width: .infinity, height: 600)
                        .cornerRadius(50)
//                        .padding(.top, 10)

                    VStack(spacing: 20) {
//                        Spacer().frame(height: 20)  // Square Starting
                        HStack(spacing: 30) {
                            FSquareButton(
                                imageName: "ImageF1", soundName: "happy",
                                cornerRadius: 10, width: 150, height: 150)
                            FSquareButton(
                                imageName: "ImageF2", soundName: "sad",
                                cornerRadius: 10, width: 150, height: 150)
                        }
                        HStack(spacing: 30) {
                            FSquareButton(
                                imageName: "ImageF3", soundName: "sec",
                                cornerRadius: 10, width: 150, height: 150)
                            FSquareButton(
                                imageName: "ImageF4", soundName: "cr",
                                cornerRadius: 10, width: 150, height: 150)
                        }
                        HStack(spacing: 30) {
                            FSquareButton(
                                imageName: "ImageF7", soundName: "comfortable",
                                cornerRadius: 10, width: 150, height: 150)
                            FSquareButton(
                                imageName: "ImageF6", soundName: "angry",
                                cornerRadius: 10, width: 150, height: 150)
                        }
                    }
                }
            }
            .padding(.top, 100.0)
        }
    }
}

struct FSquareButton: View {
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
    FeelingsView()
}

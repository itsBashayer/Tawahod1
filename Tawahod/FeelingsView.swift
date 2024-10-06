import AVFoundation
import SwiftUI

struct FeelingsView: View {
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "speaker.wave.2")
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding(.leading, -100)
                    .rotationEffect(.degrees(180))

                Text("ماذا أشعر الآن")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.leading, 130)
            }
            .padding(.bottom, 620.0)

            ZStack {
                Rectangle()  // Background rectangle
                    .fill(Color(red: 0.935, green: 0.97, blue: 0.952))
                    .frame(width: 450, height: 690)
                    .cornerRadius(100)
                    .padding(.top, 150)

                VStack(spacing: 20) {
                    Spacer().frame(height: 20)  // square Starting
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
                            imageName: "ImageF3", soundName: "soundF3",
                            cornerRadius: 10, width: 150, height: 150)
                        FSquareButton(
                            imageName: "ImageF4", soundName: "cr",
                            cornerRadius: 10, width: 150, height: 150)
                    }
                    HStack(spacing: 30) {
                        FSquareButton(
                            imageName: "ImageF7", soundName: "soundF5",
                            cornerRadius: 10, width: 150, height: 150)
                        FSquareButton(
                            imageName: "ImageF6", soundName: "ho",
                            cornerRadius: 10, width: 150, height: 150)
                    }
                }
                .padding()
            }
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

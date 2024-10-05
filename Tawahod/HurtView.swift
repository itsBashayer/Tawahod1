import AVFoundation
import SwiftUI

struct HurtView: View {
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "speaker.wave.2")
                    .font(.title2)
                    .foregroundColor(.black)
                    .rotationEffect(.degrees(180))
                    .padding(.bottom, 600)
                    .padding(.leading, 90)
                Text("ماذا يؤلمني")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 600)
                    .padding(.leading, -4)
            }
            HStack {

                ZStack {
                    Rectangle()  // Background rectangle
                        .fill(Color(red: 1.002, green: 0.967, blue: 0.838))
                        .frame(width: 450, height: 690)
                        .cornerRadius(100)
                        .padding(.top, 150)

                    VStack(spacing: 20) {
                        Spacer().frame(height: 50)  // square Starting
                        HStack(spacing: 30) {
                            FSquarButton(
                                imageName: "stomach", soundName: "b",
                                cornerRadius: 10, width: 150, height: 150)
                            FSquarButton(
                                imageName: "tooth", soundName: "teeth_hurt",
                                cornerRadius: 10, width: 150, height: 150)
                        }
                        HStack(spacing: 30) {
                            FSquarButton(
                                imageName: "foot", soundName: "feetـhurt2",
                                cornerRadius: 10, width: 150, height: 150)
                            FSquarButton(
                                imageName: "head", soundName: "head",
                                cornerRadius: 10, width: 150, height: 150)
                        }
                        HStack(spacing: 30) {
                            FSquarButton(
                                imageName: "back", soundName: "back_hurts",
                                cornerRadius: 10, width: 150, height: 150)
                            FSquarButton(
                                imageName: "arm", soundName: "arm",
                                cornerRadius: 10, width: 150, height: 150)
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

}

#Preview {
    HurtView()
}

import AVFoundation
import SwiftUI

struct ClothingView: View {
    var body: some View {

        ZStack {
            HStack {
                Image(systemName: "speaker.wave.2")
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding(.leading, -170)
                    .rotationEffect(.degrees(180))

                Text("ملابس")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.leading, 200)
            }
            .padding(.bottom, 620.0)

            ZStack {
                Rectangle()  // Background rectangle
                    .fill(Color(red: 0.963, green: 0.953, blue: 0.996))
                    .frame(width: 450, height: 690)
                    .cornerRadius(100)
                    .padding(.top, 150)

                VStack(spacing: 20) {
                    Spacer().frame(height: 50)  // square Starting
                    HStack(spacing: 30) {
                        SquareBtton(
                            imageName: "pants", soundName: "pant",
                            cornerRadius: 10, width: 150, height: 150)
                        SquareBtton(
                            imageName: "hat", soundName: "hat2",
                            cornerRadius: 10, width: 150, height: 150)
                    }
                    HStack(spacing: 30) {
                        SquareBtton(
                            imageName: "scarf", soundName: "scarf",
                            cornerRadius: 10, width: 150, height: 150)
                        SquareBtton(
                            imageName: "tshirt", soundName: "shirt",
                            cornerRadius: 10, width: 150, height: 150)
                    }
                    HStack(spacing: 30) {
                        SquareBtton(
                            imageName: "sweater", soundName: "Sweater",
                            cornerRadius: 10, width: 150, height: 150)
                        SquareBtton(
                            imageName: "shoos", soundName: "shose",
                            cornerRadius: 10, width: 150, height: 150)
                    }
                }
                .padding()
            }
        }

    }
}

struct SquareBtton: View {
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
    ClothingView()
}

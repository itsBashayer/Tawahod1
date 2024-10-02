import SwiftUI
import AVFoundation

struct afrah: View { // Capitalized the struct name
    var body: some View {
        NavigationView {
            ZStack {
                HStack {
                    NavigationLink(destination: OreviousView()) { // Updated the view name
                        Image(systemName: "arrow.backward")
                            .padding(.bottom, 100)
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .padding(.leading)
                    }

                    Image(systemName: "speaker.wave.2")
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding(.leading, -100)
                        .rotationEffect(.degrees(180))
                   
                    Text("اختر ماذا تريد ")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .padding(.leading, 100)
                }
                .padding(.bottom, 620.0)

                VStack(spacing: 20) {
                    Spacer().frame(height: 20)
                    HStack(spacing: 30) {
                        CustomButton(imageName: "feelings", soundName: "Sound", cornerRadius: 10, width: 150, height: 150, buttonText: "Feelings")
                        CustomButton(imageName: "hurt", soundName: "sound2", cornerRadius: 10, width: 150, height: 150, buttonText: "Hurt")
                    }
                    HStack(spacing: 30) {
                        CustomButton(imageName: "needs", soundName: "sound3", cornerRadius: 10, width: 150, height: 150, buttonText: "Needs")
                        CustomButton(imageName: "image4", soundName: "sound4", cornerRadius: 10, width: 150, height: 150, buttonText: "Image 4")
                    }
                    HStack(spacing: 30) {
                        CustomButton(imageName: "food", soundName: "sound5", cornerRadius: 10, width: 150, height: 150, buttonText: "Food")
                        CustomButton(imageName: "image6", soundName: "sound6", cornerRadius: 10, width: 150, height: 150, buttonText: "Image 6")
                    }
                }
                .padding()
            }
        }
    }
}

struct CustomButton: View { // Changed struct name
    var imageName: String
    var soundName: String
    var cornerRadius: CGFloat
    var width: CGFloat
    var height: CGFloat
    var buttonText: String // New parameter for text

    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        Button(action: {
            playSound(soundName: soundName)
        }) {
            VStack {
                Image(imageName)
                    .resizable() // Added to ensure image scales correctly
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width, height: height)
                    .background(Color.white)
                    .cornerRadius(cornerRadius)
                    .shadow(color: .gray, radius: 5, x: 0, y: 2)

                Text(buttonText) // Add text inside the button
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.top, 5) // Add some padding for better spacing
            }
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

struct OreviousView: View { // Updated the struct name
    var body: some View {
        Text("Back to home Page")
            .font(.largeTitle)
    }
}

#Preview {
    afrah() // Capitalized the view name
}

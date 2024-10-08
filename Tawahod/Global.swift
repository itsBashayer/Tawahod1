import AVFoundation
import SwiftUI

var audioPlayer: AVAudioPlayer? // Global audio player variable

func playSound(soundName: String) { // Global function to play sound
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

struct SquareButton: View {
    var imageName: String
    var soundName: String

    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        Button(action: {
            playSound(soundName: soundName)
        }) {
            Image(imageName)
                .resizable()
                .padding()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 2)
        }
    }

}

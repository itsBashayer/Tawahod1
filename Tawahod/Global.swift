import AVFoundation

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

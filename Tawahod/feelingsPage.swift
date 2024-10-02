
import SwiftUI
import AVFoundation

struct feelingsPage: View {
    var body: some View {
        
        NavigationView { //to Home Page
           
                
                ZStack {
                    
                    HStack {
                        Image(systemName: "speaker.wave.2")
                            .font(.title2)
                            .foregroundColor(.black)
                            .rotationEffect(.degrees(180))
                            .padding(.bottom, 600)
                            .padding(.leading ,90)
                        Text("ماذا أحتاج الآن")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 600)
                            .padding(.leading,-4)
                    }
                    HStack{
                        NavigationLink(destination: PreviousView()) {
                            Image(systemName: "arrow.right")
                                .padding(.bottom, 200)
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .padding(.leading,290)
                        }
                    }
                    .padding(.top, 100)
                    .padding(.bottom, 620.0)

                    ZStack {
                        Rectangle() // Background rectangle
                            .fill(Color(red: 0.935, green: 0.97, blue: 0.948))
                            .frame(width: 450, height: 690)
                            .cornerRadius(100)
                            .padding(.top, 150)
                        
                        VStack(spacing: 20) {
                            Spacer().frame(height: 50) // square Starting
                            HStack(spacing: 30) {
                            FSquareButton(imageName: "ImageF1", soundName: "SoundF1", cornerRadius: 10, width: 150, height: 150)
                            FSquareButton(imageName: "ImageF2", soundName: "soundF2", cornerRadius: 10, width: 150, height: 150)
                        }
                        HStack(spacing: 30) {
                            FSquareButton(imageName: "ImageF3", soundName: "soundF3", cornerRadius: 10, width: 150, height: 150)
                            FSquareButton(imageName: "ImageF4", soundName: "soundF4", cornerRadius: 10, width: 150, height: 150)
                        }
                        HStack(spacing: 30) {
                            FSquareButton(imageName: "ImageF5", soundName: "soundF5", cornerRadius: 10, width: 150, height: 150)
                            FSquareButton(imageName: "ImageF6", soundName: "soundF6", cornerRadius: 10, width: 150, height: 150)
                        }
                    }
                    .padding()
                }
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

struct FPreviousView: View { //Back to home Page Code
    var body: some View {
      Text("Back to home Page")
            .font(.largeTitle)
    }
}

#Preview {
    feelingsPage()
}


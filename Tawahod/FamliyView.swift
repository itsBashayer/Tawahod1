import SwiftUI
import AVFoundation

struct FamliyView: View {
    var body: some View {
        
      
            ZStack {
                
                HStack {
                    Image(systemName: "speaker.wave.2")
                        .font(.title2)
                        .foregroundColor(.black)
                        .rotationEffect(.degrees(180))
                        .padding(.bottom, 600)
                        .padding(.leading ,90)
                    Text("العائلة")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 600)
                        .padding(.leading,-4)
                }
               
               // .padding(.top, 100)
               // .padding(.bottom, 620.0)

                ZStack {
                    Rectangle() // Background rectangle
                        .fill(Color(red: 0.963, green: 0.953, blue: 0.996))
                        .frame(width: 450, height: 690)
                        .cornerRadius(100)
                        .padding(.top, 150)
                    
                    VStack(spacing: 20) {
                        Spacer().frame(height: 50) // square Starting
                        HStack(spacing: 30) {
                            SquareBttonf(imageName: "father", soundName: "Dad", cornerRadius: 10, width: 150, height: 150)
                            SquareBttonf(imageName: "mother", soundName: "mother", cornerRadius: 10, width: 150, height: 150)
                        }
                        HStack(spacing: 30) {
                            SquareBttonf(imageName: "brother", soundName: "brother", cornerRadius: 10, width: 150, height: 150)
                            SquareBttonf(imageName: "sister", soundName: "sis", cornerRadius: 10, width: 150, height: 150)
                        }
                        HStack(spacing: 30) {
                            SquareBttonf(imageName: "grandmother", soundName: "grandmother", cornerRadius: 10, width: 150, height: 150)
                            SquareBttonf(imageName: "grandfather", soundName: "grandfather", cornerRadius: 10, width: 150, height: 150)
                        }
                        
                  
                    }
                    .padding()
                }
            }
        
    }
}

struct SquareBttonf: View {
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
                //.spectRatio(contentMode: .fill)
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



#Preview {
    FamliyView()
}



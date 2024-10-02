import SwiftUI
import AVFoundation

struct tryme2: View {
    let options = [
        ("feelings", "المشاعر", "sound1", Color.lightPink),
        ("hurt", "ماذا يؤلمني", "sound2", Color.lightPurple),
        ("needs", "ماذا احتاج الان", "sound3", Color.lightGreen),
        ("food", "الطعام", "sound4", Color.lightYellow),
        ("clothes", " الملابس", "sound5", Color.lightPurple),
        ("image6", "Image 6", "sound6", Color.lightPink)
    ]
    
    @State private var searchText = "" // State variable for search text
    
    var filteredOptions: [(String, String, String, Color)] {
        // Filter options based on search text
        if searchText.isEmpty {
            return options
        } else {
            return options.filter { $0.1.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .trailing) {
                HStack { }
                        Spacer() // Pushes content to the left
                ZStack (alignment: .bottomTrailing) {
                    Image(.avatar7) // Main profile image
                                .resizable()
                                .frame(width: 50, height: 50)
                                .background(Color.lightGrey)
                                .cornerRadius(50)
                               /* .padding(20)*/ // Adjust padding as needed
                            
                            // Overlay for profile lines image
                            Image("profileLine") // Replace with your lines image name
                                .resizable()
                                .frame(width: 15, height: 15)
//                                .background(Color.white)
//                                .cornerRadius(50)
//
                }.padding(.horizontal, 30)
                        // Search Bar
                        SearchBar(text: $searchText)
                            .padding()

                        Spacer()
                        Text("اختر ماذا تريد ")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .padding(.trailing, 40) // Pushes the content down
                        
                       
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 40) {
                            ForEach(filteredOptions, id: \.0) { option in
                                Button(action: {
                                    playSound(soundName: option.2)
                                }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(option.3)
                                            .frame(width: 150, height: 150)
                                        
                                        Image(option.0)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 90, height: 90)
                                            .padding(.top, -30)
                                           // Adjust size as needed
                                        Text(option.1)
                                            .fontWeight(.bold)
                                            .padding(.top, 110)
                                            .foregroundColor(.black)
//
                                    }
                                }
                            }
                        }
                        .padding()

                    }
                    .padding(.top,-50) // Space from the top

            
        }
    }
    
    private func playSound(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
            print("Audio file not found: \(soundName)")
            return
        }
        
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch {
            print("Error playing sound: \(error)")
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(9)
                .background(Color(.systemGray6))
                .cornerRadius(10)
        }
    }
}

struct oreviousView: View {
    var body: some View {
        Text("Back to home Page")
            .font(.largeTitle)
    }
}

#Preview {
    tryme2()
}

import SwiftUI
import AVFoundation

struct tryme2: View {
    let options = [
        ("feelings", "المشاعر", "sound1", Color.lightPink),
        ("hurt", "ماذا يؤلمني", "sound2", Color.lightPurple),
        ("needs", "ماذا احتاج الان", "sound3", Color.lightGreen),
        ("food", "الطعام", "sound4", Color.lightYellow),
        ("clothes", "الملابس", "sound5", Color.lightPurple),
        ("image6", "Image 6", "sound6", Color.lightPink)
    ]
    
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                }
                
                ZStack(alignment: .bottomTrailing) {
                    NavigationLink(destination: Raneem()) {
                        Image("avatar7")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .background(Color.lightGrey)
                            .cornerRadius(50)
                    }
                    
                    Image("profileLine")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
                .padding(.horizontal, 30)
                
                // Search bar without filtering logic
                SsearchBar(text: $searchText)
                    .padding()

                Spacer()
                Text("اختر ماذا تريد ")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding(.trailing, 40)
                
                // Display all options without filtering
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 40) {
                    ForEach(options, id: \.0) { option in
                        NavigationLink(destination: destinationView(for: option.0)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(option.3)
                                    .frame(width: 150, height: 150)
                                
                                Image(option.0)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 90, height: 90)
                                    .padding(.top, -30)
                                
                                Text(option.1)
                                    .fontWeight(.bold)
                                    .padding(.top, 110)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                .padding()
            }
            .padding(.top, -20)
        }
    }
    
    private func destinationView(for option: String) -> some View {
        switch option {
        case "feelings":
            return AnyView(feelingsPage())
        case "hurt":
            return AnyView(PPage())
        case "needs":
            return AnyView(bashaer())
        case "food":
            return AnyView(Food())
        case "clothes":
            return AnyView(ClothesView())
        case "image6":
            return AnyView(Image6View())
        default:
            return AnyView(Text("Unknown View"))
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

struct SsearchBar: View {
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

// Placeholder views for navigation links
struct RaneemView: View {
    var body: some View {
        Text("Raneem View")
            .font(.largeTitle)
    }
}

struct HurtView: View {
    var body: some View {
        Text("Hurt View")
            .font(.largeTitle)
    }
}

struct NeedsView: View {
    var body: some View {
        Text("Needs View")
            .font(.largeTitle)
    }
}

struct FoodView: View {
    var body: some View {
        Text("Food View")
            .font(.largeTitle)
    }
}

struct ClothesView: View {
    var body: some View {
        Text("Clothes View")
            .font(.largeTitle)
    }
}

struct Image6View: View {
    var body: some View {
        Text("Image 6 View")
            .font(.largeTitle)
    }
}

#Preview {
    tryme2()
}

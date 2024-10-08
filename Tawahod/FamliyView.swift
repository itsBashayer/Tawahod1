import AVFoundation
import SwiftUI

struct FamliyView: View {
    let familyItems = [
        ("father", "Dad"),
        ("mother", "mother"),
        ("brother", "brother"),
        ("sister", "sis"),
        ("grandmother", "grandmother"),
        ("grandfather", "grandfather"),
    ]

    var body: some View {
        VStack {
            HStack {
                Text("عائلتي")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "speaker.wave.2")
                    .font(.title2)
                    .foregroundColor(.black)
            }
            .padding(.horizontal, 40)

            ZStack {
                Rectangle()
                    .fill(Color.lightPink)
                    .cornerRadius(60)

                VStack(spacing: 20) {
                    ForEach(0..<familyItems.count / 2, id: \.self) { rowIndex in
                        HStack(spacing: 20) {
                            SquareButton(
                                imageName: familyItems[rowIndex * 2].0,
                                soundName: familyItems[rowIndex * 2].1)
                            SquareButton(
                                imageName: familyItems[rowIndex * 2 + 1].0,
                                soundName: familyItems[rowIndex * 2 + 1].1)
                        }
                    }
                }
                .padding()
            }
            .edgesIgnoringSafeArea(.all)
        }
        .edgesIgnoringSafeArea(.all)
        .padding(.top, 50)
    }
}

#Preview {
    FamliyView()
}

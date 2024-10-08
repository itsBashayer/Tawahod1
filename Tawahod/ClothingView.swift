import AVFoundation
import SwiftUI

struct ClothingView: View {
    let clothingItems = [
        ("pant", "pants"),
        ("hat", "hat2"),
        ("scarf", "scarf"),
        ("tshirt", "shirt"),
        ("sweater", "Sweater"),
        ("shoos", "shose"),
    ]
    var body: some View {
        

        VStack {
            HStack {
                Text("ملابس")
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
                    .fill(Color.lightPurple)
                    .cornerRadius(60)

                VStack(spacing: 20) {
                    ForEach(0..<clothingItems.count / 2, id: \.self) { rowIndex in
                        HStack(spacing: 20) {
                            SquareButton(
                                imageName: clothingItems[rowIndex * 2].0,
                                soundName: clothingItems[rowIndex * 2].1)
                            SquareButton(
                                imageName: clothingItems[rowIndex * 2 + 1].0,
                                soundName: clothingItems[rowIndex * 2 + 1].1)
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
    ClothingView()
}

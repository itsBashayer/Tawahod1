import AVFoundation
import SwiftUI

struct NeedsView: View {
    let needsItems = [
        ("Image1", "sleep"),
        ("image2", "shower"),
        ("image3", "bathroom"),
        ("image4", "hug"),
        ("image5", "play"),
        ("image6", "out"),
    ]

    var body: some View {
        VStack {
            HStack {
                Text("ماذا أحتاج الآن")
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
                    .fill(Color.lightGreen)
                    .cornerRadius(60)

                VStack(spacing: 20) {
                    ForEach(0..<needsItems.count / 2, id: \.self) {
                        rowIndex in
                        HStack(spacing: 20) {
                            SquareButton(
                                imageName: needsItems[rowIndex * 2].0,
                                soundName: needsItems[rowIndex * 2].1)
                            SquareButton(
                                imageName: needsItems[rowIndex * 2 + 1].0,
                                soundName: needsItems[rowIndex * 2 + 1].1)
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
    NeedsView()
}

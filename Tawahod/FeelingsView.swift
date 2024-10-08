import AVFoundation
import SwiftUI

struct FeelingsView: View {
    let feelingsItems = [
        ("ImageF1", "happy"),
        ("ImageF2", "sad"),
        ("ImageF3", "sec"),
        ("ImageF4", "cr"),
        ("ImageF7", "comfortable"),
        ("ImageF6", "angry"),
    ]

    var body: some View {
        VStack {
            HStack {
                Text("ماذا أشعر الآن")
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
                    ForEach(0..<feelingsItems.count / 2, id: \.self) {
                        rowIndex in
                        HStack(spacing: 20) {
                            SquareButton(
                                imageName: feelingsItems[rowIndex * 2].0,
                                soundName: feelingsItems[rowIndex * 2].1)
                            SquareButton(
                                imageName: feelingsItems[rowIndex * 2 + 1].0,
                                soundName: feelingsItems[rowIndex * 2 + 1].1)
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
    FeelingsView()
}

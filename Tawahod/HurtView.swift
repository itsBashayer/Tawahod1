import AVFoundation
import SwiftUI

struct HurtView: View {
    let hurtItems = [
        ("stomach", "b"),
        ("tooth", "teeth_hurt"),
        ("foot", "feetـhurt2"),
        ("head", "head"),
        ("back", "back_hurts"),
        ("arm", "arm"),
    ]

    var body: some View {
        VStack {
            HStack {
                Text("ماذا يؤلمني")
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
                    ForEach(0..<hurtItems.count / 2, id: \.self) { rowIndex in
                        HStack(spacing: 20) {
                            SquareButton(
                                imageName: hurtItems[rowIndex * 2].0,
                                soundName: hurtItems[rowIndex * 2].1)
                            SquareButton(
                                imageName: hurtItems[rowIndex * 2 + 1].0,
                                soundName: hurtItems[rowIndex * 2 + 1].1)
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
    HurtView()
}

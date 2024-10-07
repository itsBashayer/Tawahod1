import SwiftUI

struct LaunchScreen: View {
    @State private var scales: [CGFloat] = Array(repeating: 0.0, count: 4)
    @State private var opacities: [Double] = Array(repeating: 0.0, count: 4)
    @State private var textScale: CGFloat = 0.0
    @State private var textOpacity: Double = 0.0
    @State private var isActive: Bool = false

    var body: some View {
        VStack {
            if isActive {
                AvatarView() // Transition to AvatarView
            } else {
                ZStack {
                    VStack {
                        HStack {
                            Image("TopLeft")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .scaleEffect(scales[0])
                                .opacity(opacities[0])
                                .offset(x: 30, y: 78)

                            Image("TopRight")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .scaleEffect(scales[1])
                                .opacity(opacities[1])
                                .offset(x: -29, y: 80)
                        }
                        HStack {
                            Image("DownLeft")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .scaleEffect(scales[2])
                                .opacity(opacities[2])
                                .offset(x: 29, y: 18)

                            Image("DownRight")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .scaleEffect(scales[3])
                                .opacity(opacities[3])
                                .offset(x: -28, y: 21)
                        }
                    }.padding(.top, -250)

                    // Text to display
                    Text("تواحُد")
                        .font(.system(size: 60))
                        .fontWeight(.bold)
                        .scaleEffect(textScale)
                        .opacity(textOpacity)
                        .padding(.top, 250)
                        .frame(width: 300, height: 300)
                }
                .onAppear {
                    // Animate images
                    for index in 0..<4 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.4) {
                            withAnimation {
                                scales[index] = 1.0
                                opacities[index] = 1.0
                            }
                        }
                    }
                    // Delay the text appearance
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) { // Adjust this value as needed
                        withAnimation {
                            textScale = 1.0
                            textOpacity = 1.0
                        }
                    }
                    // Transition to AvatarView after a delay
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { // Adjust this value for total splash time
                        withAnimation {
                            isActive = true
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}

#Preview {
    LaunchScreen()
}

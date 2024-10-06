//
//  firstpage.swift
//  Tawahod
//
//  Created by Razan on 03/04/1446 AH.
//

import SwiftUI

struct firstpage: View {
    @State private var scale: CGFloat = 0.5
    @State private var logoOpacity: Double = 0
    @State private var showText = false

    var body: some View {
        VStack {
            Image("appIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .scaleEffect(scale)
                .opacity(logoOpacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1)) {
                        scale = 1.2
                        logoOpacity = 1
                    }
                    withAnimation(.easeOut(duration: 1).delay(1)) {
                        scale = 1
                    }
                    // Delay for showing the text
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            showText = true
                        }
                    }
                }
            
            if showText {
                Text("تواحد")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .transition(.opacity)
                    .opacity(showText ? 1 : 0)
            }
        }
        .padding()
    }
}
#Preview {
    firstpage()
}

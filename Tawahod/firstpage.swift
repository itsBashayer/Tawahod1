//
//  firstpage.swift
//  Tawahod
//
//  Created by Razan on 03/04/1446 AH.
//

import SwiftUI

struct firstpage: View {
    @State private var scale: CGFloat = 0.5
    @State private var opacity: Double = 0

    var body: some View {
        Image("appIcon")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .scaleEffect(scale)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1)) {
                    scale = 1.2
                    opacity = 1
                }
                withAnimation(.easeOut(duration: 1).delay(1)) {
                    scale = 1
                }
            }
    }
}

#Preview {
    firstpage()
}


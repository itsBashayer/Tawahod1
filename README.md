Test
//
//  ContentView.swift
//  Tawahed
//
//  Created by Razan on 26/03/1446 AH.
//

import SwiftUI

struct ContentView: View {
    let bodyParts = [
        ("قدمي تؤلمني ", "foot"),
        ("بطني يؤلمني", "stomach"),
        ("رأسي يؤلمني", "head"),
        ("أسناني يؤلمني", "teeth"),
        ("ذراعي يؤلمني", "arm"),
        ("ظهري يؤلمني", "back"),
        
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background with rounded top corners
              Rectangle()
                    .fill(Color(red: 1.002, green: 0.967, blue: 0.838))
                    .frame(width:450, height:680)
                    .cornerRadius(100)
                    .padding(.top,300)
                    // Ignore safe area for top corners
                VStack {
                    HStack {
                        Spacer() // Push the text to the right
                        Text("ماذا يؤلمني")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.trailing)
                            .padding(100)
                            .foregroundColor(.black)
                            .font(.custom("SF Arabic Rounded", size: 30))
                    }
                    Spacer() // This will push the HStack to the top of the VStack
                }
                VStack {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 50) {
                        ForEach(bodyParts, id: \.0) { part in
                            Button(action: {
                                // Handle selection
                            }) {
                                VStack {
                                    Image(part.1) // Use the image name here
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80) // Adjust size as needed
                                    Text(part.0)
                                        .font(.caption)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                        .font(.custom("SF Arabic Rounded", size: 14))

                                }
                                .padding()
                                .background(Color.white) // White squares
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            }
                        }
                    }
                    .padding()
                }
                .padding(.top, 270) // Padding for the VStack content
            }
            .padding()
        }
    }
}
#Preview {
    ContentView()
}

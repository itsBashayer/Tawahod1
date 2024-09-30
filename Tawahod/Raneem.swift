//
//  ContentView.swift
//  newtwst
//
//  Created by Raneem on 26/03/1446 AH.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.purple.opacity(0.1)
                .edgesIgnoringSafeArea(.all)

            HStack {
                VStack {
                    HStack(spacing: -50) {
                        Text("مرحبًا علي!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .cornerRadius(20)

                        Image("Image") // Replace "Image" with your actual image name
                    }
                    .padding(45)

                    ZStack {
                        RoundedRectangle(cornerRadius: 90)
                            .frame(width: 400.0, height: 650.0)
                            .foregroundColor(.white)
                            .padding(.bottom, -140)

                        VStack(spacing: 20) {
                            MenuTabs(
                                menuText: "تعديل الحساب",
                                menuIcon: "person.fill",
                                menuColor: .purple.opacity(0.1)
                            )

                            MenuTabs(
                                menuText: "الإعدادات",
                                menuIcon: "gear.badge.questionmark",
                                menuColor: .yellow.opacity(0.1)
                            )

                            MenuTabs(
                                menuText: "مركز المساعدة",
                                menuIcon: "bubble.left.and.text.bubble.right",
                                menuColor: .pink.opacity(0.1)
                            )
                        }
                    }
                }
            }
        }
    }
}

struct MenuTabs: View {
    var menuText: String
    var menuIcon: String
    var menuColor: Color

    var body: some View {
        Button(action: {
            // Action for button
        }) {
            HStack {
                Text(menuText)
                    .padding(.leading, 100)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.trailing)
                    .padding(.horizontal, 5.0)
                    .padding(.vertical, 16.0)

                Image(systemName: menuIcon)
                    .foregroundColor(.black)
                    .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .frame(maxWidth: .infinity)
        .background(menuColor)
        .cornerRadius(10)
        .padding(.horizontal, 40)
    }
}

#Preview {
    ContentView()
}

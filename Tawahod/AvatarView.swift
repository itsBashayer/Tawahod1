//
//  ContentView.swift
//  Tawahod
//
//  Created by Mona on 25/03/1446 AH.
//

import SwiftUI

struct AvatarView: View {
    let items: [(imageName: String, frameColor: Color)] = [
        ("avatar1", Color.lightYellow),
        ("avatar2", Color.lightGreen),
        ("avatar3", Color.lightYellow),
        ("avatar4", Color.lightGreen),
        ("avatar5", Color.lightYellow),
        ("avatar6", Color.lightPurple),
        ("avatar7", Color.lightPurple),
        ("avatar8", Color.lightPurple),
        ("avatar1", Color.lightGreen),
        ("avatar1", Color.lightYellow),
        ("avatar2", Color.lightGreen),
        ("avatar3", Color.lightYellow),
        ("avatar4", Color.lightGreen),
        ("avatar5", Color.lightYellow),
        ("avatar6", Color.lightPurple),
        ("avatar7", Color.lightPurple),
        ("avatar8", Color.lightPurple),
        ("avatar1", Color.lightGreen),
    ]

    @State private var selectedAvatar: String = "avatar3"  // State variable for selected avatar

    var body: some View {
        VStack {
            ZStack {
                Circle().foregroundColor(Color.lightGrey)
                    .frame(width: 150, height: 150)
                Image(selectedAvatar).resizable()
                    .scaledToFit()  // Maintain aspect ratio
                    .frame(width: 120, height: 120)
            }

            Text("اختر شخصيتك!")
                .foregroundColor(Color.darkGrey)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            ScrollView {
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 90))], spacing: 10
                ) {
                    ForEach(Array(items.enumerated()), id: \.offset) {
                        index, item in
                        AvatarFrame(
                            avatarImg: item.imageName,
                            frameColor: item.frameColor
                        )
                        .onTapGesture {
                            selectedAvatar = item.imageName
                        }
                    }  //Use id: \.offset: This uses the index (offset) as the identifier, ensuring that each item is unique even if the image names are the same.

                }
                .padding(30)
            }

        }
        .padding(.top, 20)

    }
}

struct AvatarFrame: View {
    var avatarImg: String
    var frameColor: Color

    var body: some View {
        ZStack {
            Circle().foregroundColor(frameColor)
                .frame(width: 100, height: 100)
            Image(avatarImg).resizable()
                .scaledToFit()  // Maintain aspect ratio
                .frame(width: 80, height: 80)
        }
    }
}

#Preview {
    AvatarView()
}

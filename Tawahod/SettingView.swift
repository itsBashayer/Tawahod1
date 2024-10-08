import SwiftUI

struct SettingView: View {
    var selectedAvatar: String

    var body: some View {
        ZStack {
            Color.purple.opacity(0.1)
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Text("مرحبًا!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .cornerRadius(20)
                    Spacer()
                    Image(selectedAvatar).resizable().frame(
                        width: 70, height: 70)  // Replace "Image" with your actual image name
                }.padding(.horizontal, 30)

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

struct MenuTabs: View {
    var menuText: String
    var menuIcon: String
    var menuColor: Color

    var body: some View {
        Button(action: {
            // Action for button
        }) {
            HStack {
                Image(systemName: menuIcon)
                    .foregroundColor(.black)
                Text(menuText)
                    .padding(.trailing, 100)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
        }
        .frame(maxWidth: .infinity)
        .background(menuColor)
        .cornerRadius(10)
        .padding(.horizontal, 40)
    }
}

#Preview {
    SettingView(selectedAvatar: "avatar3")
}

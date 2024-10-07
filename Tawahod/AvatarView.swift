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
    
    @State private var localSelectedAvatar: String = "avatar3"
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Circle().foregroundColor(Color.lightGrey)
                        .frame(width: 150, height: 150)
                    Image(localSelectedAvatar)  // Use the local state variable for the displayed image
                        .resizable()
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
                                localSelectedAvatar = item.imageName
                            }
                        }
                    }
                    .padding(30)
                }
                HStack{
                  
                    NavigationLink(destination: MainView(selectedAvatar: localSelectedAvatar)) {
                        Text("الاستمرار")
                            .font(.title3)
                            .frame(maxWidth: .infinity )// Provide a label for the link
                            .padding()
                            .background(Color.pink.opacity(0.1))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                        
                    }
                    .padding(20)  // Optional: Add some padding above the link
                 
                }
                .padding(.top, 20)
            }
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
    }}

#Preview {
    AvatarView()
}

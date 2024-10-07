import AVFoundation
import SwiftUI

struct MainView: View {
    var selectedAvatar: String
    let options = [
        ("feelings", "المشاعر", "feeling", Color.lightPink),
        ("hurt", "ماذا يؤلمني", "hurt", Color.lightPurple),
        ("needs", "ماذا احتاج الان", "need", Color.lightGreen),
        ("food", "الطعام", "food", Color.lightYellow),
        ("clothes", "الملابس", "cloth", Color.lightPurple),
        ("famliy", "العائلة", "family", Color.lightPink),
    ]

    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack (alignment: .leading){
                HStack(alignment: .bottom) {
                    NavigationLink(
                        destination: SettingView(selectedAvatar: selectedAvatar)
                    ) {
                        Image(selectedAvatar)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(5)
                            .background(Color.lightYellow)
                            .cornerRadius(50)
                    }
                    Spacer()

                    Text("أهلاً !")
                        .font(.title2)
                        .fontWeight(.semibold)
                }

                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("ابحث...", text: $searchText).multilineTextAlignment(.trailing)
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.lightGrey, lineWidth: 1))

                LazyVGrid(
                    columns: Array(
                        repeating: GridItem(.flexible()), count: 2),
                    spacing: 20
                ) {
                    ForEach(options, id: \.0) { option in
                        NavigationLink(
                            destination: destinationView(for: option.0)
                        ) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(option.3)
                                    .frame(width: 170, height: 160)

                                Image(option.0)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 90, height: 90)
                                    .padding(.top, -30)

                                Text(option.1)
                                    .fontWeight(.bold)
                                    .padding(.top, 110)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }.padding(.top, 20)
                
            }
            .padding(.horizontal, 25)
            
                .frame(maxHeight: .infinity, alignment: .top)
        }.navigationBarBackButtonHidden(true)
    }

    private func destinationView(for option: String) -> some View {
        switch option {
        case "feelings":
            return AnyView(FeelingsView())
        case "hurt":
            return AnyView(HurtView())
        case "needs":
            return AnyView(NeedsView())
        case "food":
            return AnyView(FoodView())
        case "clothes":
            return AnyView(ClothingView())
        case "famliy":
            return AnyView(FamliyView())
        default:
            return AnyView(Text("Unknown View"))
        }
    }

}

#Preview {
    MainView(selectedAvatar: "avatar3")
}

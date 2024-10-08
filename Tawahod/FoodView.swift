import SwiftUI

struct FoodView: View {
    let foodItems = [
        ("Food1", "rice1"),
        ("Food2", "eg"),
        ("Food3", "coki"),
        ("Food4", "salmon"),
        ("Food5", "salad"),
        ("Food6", "pizza"),
    ]

    var body: some View {
        VStack {
            HStack {
                Text("الطعام")
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
                    .fill(Color.lightYellow)
                    .cornerRadius(60)

                VStack(spacing: 20) {
                    ForEach(0..<foodItems.count / 2, id: \.self) { rowIndex in
                        HStack(spacing: 20) {
                            SquareButton(
                                imageName: foodItems[rowIndex * 2].0,
                                soundName: foodItems[rowIndex * 2].1)
                            SquareButton(
                                imageName: foodItems[rowIndex * 2 + 1].0,
                                soundName: foodItems[rowIndex * 2 + 1].1)
                        }
                    }
                }
                .padding()
            }
            .edgesIgnoringSafeArea(.all)
        }
        .edgesIgnoringSafeArea(.all)
        .padding(.top, 100)
    }
}
#Preview {
    FoodView()
}

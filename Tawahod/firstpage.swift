import SwiftUI

struct firstpage: View {
    @State private var isActive: Bool = false
    @State private var showText: Bool = false

    var body: some View {
        ZStack {
            if isActive {
                AvatarView() // الانتقال إلى AvatarView
            } else {
                Color.white // الخلفية البيضاء
                    .edgesIgnoringSafeArea(.all) // لتغطية الشاشة بالكامل
                
                VStack {
                    Image("appIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .opacity(showText ? 0 : 1) // جعل الشعار شفافاً عند ظهور النص
                    
                    if showText {
                        Text("تواحد")
                            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/) // إضافة كلمة "تواحد"
                            .fontWeight(.heavy)
                            .transition(.opacity)
                            .opacity(showText ? 2 : 1)
                            .padding(.top, 20) // إضافة مسافة فوق النص
                    }
                }
            }
        }
        .onAppear {
            // عرض الشعار أولاً
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    showText = true // إظهار الكلمة بعد 2.5 ثانية
                }
            }
            
            // الانتقال إلى AvatarView بعد فترة
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                withAnimation {
                    isActive = true // الانتقال إلى AvatarView بعد 4 ثوان
                }
            }
        }
    }
}

struct firstpage_Previews: PreviewProvider {
    static var previews: some View {
        firstpage() // عرض صفحة الشعار في المعاينة
    }
}

#Preview {
    firstpage()
}

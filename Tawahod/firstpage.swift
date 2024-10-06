
//
//  SplashView.swift
//  RTK_Spike
//
//  Created by Jason Cheladyn on 2022/04/04.
//

import SwiftUI

struct firstpage: View {
    @State var isActive: Bool = false

    var body: some View {
        ZStack {
            if self.isActive {
                AvatarView() // الانتقال إلى AvatarView
            } else {
                Color.white // تغيير الخلفية إلى اللون الأبيض
                    .edgesIgnoringSafeArea(.all) // لتغطية الشاشة بالكامل
                
                VStack {
                    Image("appIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                    
                    Text("تواحد") // إضافة الكلمة تحت الشعار
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20) // إضافة مسافة فوق النص
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
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

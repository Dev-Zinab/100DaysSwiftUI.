//
//  Day036_3.swift
//  100DaysSwiftUI
//
//  Created by Zinab Zooba on 08/04/2026.
//
import SwiftUI

struct Day036_3: View {
    
    // الطريقة الأولى:
    // نستخدم @State ونجيب القيمة من UserDefaults يدويًا
    // @State private var count = UserDefaults.standard.integer(forKey: "count")
    
    // الطريقة الثانية (الأفضل):
    // نستخدم @AppStorage لربط القيمة مباشرة مع UserDefaults
    @AppStorage("count") var count: Int = 0
    
    var body: some View {
        Button("Tap count: \(count)") {
            count += 1
            
            // في حالة @AppStorage ما نحتاج نحفظ يدويًا
            // لكن لو كنتِ تستخدمين الطريقة الأولى لازم تحفظين كذا:
            // UserDefaults.standard.set(count, forKey: "count")
        }
    }
}

#Preview {
    Day036_3()
}

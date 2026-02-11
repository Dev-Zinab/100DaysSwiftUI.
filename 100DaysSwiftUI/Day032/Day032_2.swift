
//
//  Day032_2.swift
//  100DaysSwiftUI
//
//  Created by Zinab Zooba on 10/02/2026.
//

import SwiftUI

struct Day032_2: View {
    @State private var animationAmount = 1.0
    var body : some View {
        print(animationAmount)// i cant use print statment here inside body without (return)
        
        return VStack {
            Stepper("Scale amount",value: $animationAmount.animation(), in: 1...10)
            Spacer()
            
            Button("Tap Me") {
                animationAmount+=1
                
            }
            .padding(40)
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(.circle)

            .scaleEffect(CGFloat(animationAmount))
        }
        
        
        
    }
}
#Preview {
    Day032_2()
}

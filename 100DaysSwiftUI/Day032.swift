//
//  Untitled.swift
//  100DaysSwiftUI
//
//  Created by Zinab Zooba on 10/02/2026.
//


import SwiftUI

struct Day032: View {
    @State private var animationAmount = 1.0
    var body: some View {
        Button("Press Me") {
            animationAmount += 1        }
        .padding(50)
        .background(.blue)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount-1)*3)// we should in the begning see the word without blur that why we need to make the value 0
        .animation(.default, value: animationAmount)
        
    }
}

#Preview {
    Day032()
}

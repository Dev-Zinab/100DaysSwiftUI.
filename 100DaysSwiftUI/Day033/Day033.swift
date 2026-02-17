//
//  Day033.swift
//  100DaysSwiftUI
//
//  Created by Zinab Zooba on 11/02/2026.
//

import SwiftUI

struct Day033: View {
    @State private var enabled = false
    var body: some View {
        VStack {
            Button("Tap me") {
                enabled.toggle()
            }            .frame(width: 200, height: 200)

                .background(enabled ? .blue: .red)
                .animation(.default, value: enabled)

            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
            .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
            
        }
    }
}

#Preview {
    Day033()
}

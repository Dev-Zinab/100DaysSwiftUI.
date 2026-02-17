//
//  Day033_3.swift
//  100DaysSwiftUI
//
//  Created by Zinab Zooba on 15/02/2026.
//

import SwiftUI

public struct Day033_3: View {
    // converison from string to arr
    
    let text = Array ("Zinab")
    let text2 = Array ("SwiftUI")

    @State private var isOn = false
    @State private var draggingValue = CGSize.zero
    
    public var body: some View {
        VStack {
            //with no spacing
        HStack (spacing: 0) {
            ForEach (0..<text.count, id: \.self) {
                num in Text(String(text[num]))
                    .padding(5)
                    .font(.title)
                    .background(isOn ? .orange : .red)
                    .offset(draggingValue)     .animation(
                        .linear
                            .delay(Double(num)/20), value: draggingValue
                    )
            }
        }
        .gesture(
            DragGesture()
                .onChanged { draggingValue = $0.translation
                }
                .onEnded { _ in
                    draggingValue = .zero
                    isOn.toggle()
                }
            )
            //with auto spacing

        HStack {
            ForEach(Array(text2.enumerated()), id: \.offset) { index, letter in
                Text(String(letter))
                    .padding(5)
                    .font(.title)
                    .background(isOn ? .pink : .yellow)
                    .offset(draggingValue) // Both views share the same @State, so they move together.
                    .animation(
                        .linear.delay(Double(index) / 20),
                        value: draggingValue
                    )
            }

        }
        

    
}

    }
}
#Preview {
    Day033_3()
}

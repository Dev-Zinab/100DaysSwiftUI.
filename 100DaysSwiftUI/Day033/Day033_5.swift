//
//  Day033_5.swift
//  100DaysSwiftUI
//
//  Created by Zinab Zooba on 18/02/2026.
//
import SwiftUI



//here what i need to make my own transition, like the matrial u need to build project

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

// Add our custom transition to AnyTransition so we can use it with .transition().
// NOTE: All transitions belong to AnyTransition.

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: 90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct Day033_5: View {
    @State var isShowedRed: Bool = false
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.blue)
                .frame(width: 200, height: 200)

            if isShowedRed {
                Rectangle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
                .transition(.pivot) // here we use our transition (pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowedRed.toggle()
            }
        }



    }
}
#Preview {
    Day033_5()
}

//
//  Day033_2.swift
//  100DaysSwiftUI
//
//  Created by Zinab Zooba on 11/02/2026.
//

import SwiftUI

struct Day033_2: View {
  //step number 1
@State private var amountdrag = CGSize.zero //CG = core grapic old apple framwork
    
    var body: some View {
        VStack {
            LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 200, height: 300)
                .clipShape(.rect(cornerRadius: 10))
            //step 2
                .offset(amountdrag) // it not change the card loction for ever just for while until the move is end,
                .gesture(
                    DragGesture()
                    .onChanged {amountdrag = $0.translation }
                    .onEnded{ _ in amountdrag = .zero }
                )

        } .animation(.spring(), value: amountdrag)
            
    }
}

#Preview {
    Day033_2()
}

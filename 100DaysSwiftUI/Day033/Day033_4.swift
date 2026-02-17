//
//  Day033_4.swift
//  100DaysSwiftUI
//
//  Created by Zinab Zooba on 17/02/2026.
//

import SwiftUI

struct Day033_4: View {
   @State private var ison = false
    var body: some View {
        
        VStack {
            
            Button("Tap me") {
                withAnimation{ //this code so important to see the transition
                    
                    ison.toggle()
                }
            }
        }
        if ison {
            
      
        Rectangle()
            .fill(Color.red)
            .frame(width: 200, height: 200)
            .transition(.asymmetric(insertion: .scale, removal: .opacity))

        
        }



    }
}

#Preview {
    Day033_4()
}

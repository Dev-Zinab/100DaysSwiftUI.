
import SwiftUI

struct Day032_3: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        VStack {
            
            Button("Tap me") {
                withAnimation{
                    animationAmount+=360
                    
                }
            }
            .padding(50)
            .background(.pink)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
            
            
        }
    }
}
#Preview {
    Day032_3()
}

import SwiftUI

struct AnimationTimingView: View {
    
    @State var isAnimating: Bool = false
    let timing: Double = 10.0
    
    var body: some View {
        VStack {
            Button("Click and Animation") {
                
                isAnimating.toggle()
            }
            .padding()
            .foregroundColor(.blue)
            .font(.system(size : 30))
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                
                    .foregroundColor(isAnimating ? .black : .gray )
                    .frame(width: isAnimating ? 350 : 50, height: 100)
                    
                    .animation(.spring(
                        response: 0.5,
                        dampingFraction: 0.7,
                        blendDuration: 1.0))
                
                if isAnimating {
                    Text("Welcome")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTimingView()
    }
}

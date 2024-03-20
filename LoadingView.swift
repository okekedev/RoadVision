import SwiftUI

struct LoadingView: View {
    @State private var isRotating = false
    @State private var hueRotation = 0.0
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Roadvision")
                    .font(.title)
                    .foregroundColor(.blue)
                    .hueRotation(Angle(degrees: hueRotation))
                    .font(.custom("AvenirNext-Bold", size: 30))
                    
                    .onAppear {
                        withAnimation(Animation.linear(duration: 5.0).repeatForever(autoreverses: false)) {
                            self.hueRotation = 360.0
                        }}
                
                Image(systemName: "location.magnifyingglass")
                    .font(.system(size: 35)) // Adjust the size of the icon as needed
                    .rotationEffect(Angle(degrees: isRotating ? 360 : 0))
                    .hueRotation(Angle(degrees: hueRotation))
                    .foregroundColor(.blue)
                    .onAppear {
                        withAnimation(Animation.linear(duration: 6.0).repeatForever(autoreverses: false)) {
                            self.isRotating = true
                        }

                        withAnimation(Animation.linear(duration: 5.0).repeatForever(autoreverses: false)) {
                            self.hueRotation = 360.0
                        }
                    }
            }
        }
    }
}


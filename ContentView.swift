import SwiftUI
import MapKit

struct ContentView: View {
    @State private var isSearchViewVisible = false
    @State private var destinationCoordinates: CLLocationCoordinate2D?
    @State private var navigationDestination: CLLocationCoordinate2D?
    @State private var isLoading = true
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                
                if isLoading {
                    LoadingView()
                } else {
                    
                    ARNavigationViewControllerWrapper(destinationCoordinates: $navigationDestination)
                        .edgesIgnoringSafeArea(.all)
                    
                    if isSearchViewVisible {
                        withAnimation {
                            Home(destinationCoordinates: $destinationCoordinates, navigationDestination: $navigationDestination, isSearchViewVisible: $isSearchViewVisible)
                                .opacity(0.93)
                        }
                    }
                    
                    ToggleSearchButton(isSearchViewVisible: $isSearchViewVisible)
                    // Adjust the distance from the right
                }
            }
            .onAppear {
                // Simulating a loading delay of 2 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    isLoading = false
                }} }
    }}

struct ToggleSearchButton: View {
    @Binding var isSearchViewVisible: Bool
    
    var body: some View {
        Button(action: {
            isSearchViewVisible.toggle()
        }) {
            Image(systemName: "map")
                .foregroundColor(.blue)
                .padding()
                .font(.system(size: 24))
                .opacity(0.6)
            
        }
        .padding(.bottom, 18)
        .padding(.leading, 22)
        
    }
}




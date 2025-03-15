import SwiftUI
import CoreLocation

// Your existing map view, replace with your actual map view
struct soOurMapView: View {
    var body: some View {
        Text("This is your actual map view") // Replace with your actual map implementation
            .font(.largeTitle)
            .navigationTitle("Map")
    }
}

// Location Permission View
struct LocationPermissionView: View {
    @Environment(\.presentationMode) var presentationMode // To dismiss the view
    @State private var showingMap = false

    var body: some View {
        VStack {
            Text("ZoomArt")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 10)
                .padding(.bottom, 100)
                .foregroundColor(.black)
            
           
            
            Text("Acceptez-vous que cette application utilise votre position ?")
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
            
            

            // Buttons for user response
            HStack {
                Button(action: {
                    // Action for Yes - Navigate to OurMapView
                    showingMap = true
                }) {
                    Text("Oui")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .fullScreenCover(isPresented: $showingMap) {
                    OurMapView() // Navigate to the existing OurMapView
                }

                Button(action: {
                    // Action for No (dismiss or do nothing)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Non")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.top,50)
            .padding(.bottom, 50)
        }
        .padding()
    }
}

// Main Content View
struct BeforeOurMapView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Other content in your main view
                
                // Navigation bar button
                NavigationLink(destination: LocationPermissionView()) {
                    Text("Demander accès localisation")
                        .font(.title2)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Environment")
            
        }
    }
}

// Preview
struct contentView_Previews: PreviewProvider {
    static var previews: some View {
        BeforeOurMapView()
    }
}

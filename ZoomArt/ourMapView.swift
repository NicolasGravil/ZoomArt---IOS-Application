import SwiftUI
import MapKit

// 🔹 Création des vues pour chaque location
struct Location1View: View {
    var body: some View { Text("Artist 1 Details") }
}
struct Location2View: View {
    var body: some View { Text("Artist 2 Details") }
}
struct Location3View: View {
    var body: some View { Text("Artist 3 Details") }
}
struct Location4View: View {
    var body: some View { Text("Artist 4 Details") }
}
struct Location5View: View {
    var body: some View { Text("Artist 5 Details") }
}

struct OurMapView: View {
    struct Location: Identifiable {
        let id = UUID()
        let name: String
        let coordinate: CLLocationCoordinate2D
    }

    let positions: [Location] = [
        Location(name: "Location 1", coordinate: CLLocationCoordinate2D(latitude: 43.2913, longitude: 5.3764)),
        Location(name: "Location 2", coordinate: CLLocationCoordinate2D(latitude: 43.4731, longitude: 5.5223)),
        Location(name: "Location 3", coordinate: CLLocationCoordinate2D(latitude: 43.2494, longitude: 5.4745)),
        Location(name: "Location 4", coordinate: CLLocationCoordinate2D(latitude: 43.1901, longitude: 5.7537)),
        Location(name: "Location 5", coordinate: CLLocationCoordinate2D(latitude: 43.2610, longitude: 5.5427))
    ]

    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 43.296482, longitude: 5.36978),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                Map(coordinateRegion: $mapRegion,
                    annotationItems: positions) { position in
                    MapAnnotation(coordinate: position.coordinate) {
                        NavigationLink(destination: destinationView(for: position)) {
                            Image(systemName: "mappin.and.ellipse")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.red)
                        }
                    }
                }
                .edgesIgnoringSafeArea(.all)
            }
            .navigationTitle("Map")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundColor(.blue)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func destinationView(for position: Location) -> some View {
        switch position.name {
        case "Location 1": Location1View()
        case "Location 2": Location2View()
        case "Location 3": Location3View()
        case "Location 4": Location4View()
        case "Location 5": Location5View()
        default: Text("Unknown Location")
        }
    }
}

#Preview {
    OurMapView()
}

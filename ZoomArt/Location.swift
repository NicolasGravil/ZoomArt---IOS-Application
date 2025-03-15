import Foundation
import CoreLocation

struct Location: Identifiable {
    let id = UUID() // Unique identifier
    let name: String
    let coordinate: CLLocationCoordinate2D
}

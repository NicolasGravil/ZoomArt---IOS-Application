import SwiftUI

// Vue pour les favoris d'Alice
struct FavorisAliceView: View {
    var body: some View {
        VStack {
            Text("Alice vous a ajouté à ses favoris")
                .font(.headline)
                .padding()
            Spacer()
          Image("content")
               
        }
        .navigationTitle("Favoris d'Alice")
    }
}

// Vue pour les nouvelles vidéos de YumiZen
struct VideoYumiZenView: View {
    var body: some View {
        VStack {
            Text("Nouvelle vidéo disponible de YumiZen")
                .font(.headline)
                .padding()
            Spacer()
            VideoView()
        }
        .navigationTitle("Vidéo de YumiZen")
    }
}

// Vue pour la mise à jour de profil
struct ProfilUpdateView: View {
    var body: some View {
        VStack {
            Text("Votre profil a été mis à jour avec succès")
                .font(.headline)
                .padding()
            Spacer()
            Profil(user: User(id: UUID(), name: "Rico Martin", username: "Art Visuel", postCount: 2882, fanCount: 893, profileImage: "Ricouser"))
        }
        .navigationTitle("Mise à jour de profil")
    }
}

// Vue pour la nouvelle publication
struct NewPostView: View {
    var body: some View {
        VStack {
            Text("Une nouvelle publication a été ajoutée à votre profil")
                .font(.headline)
                .padding()
            Spacer()
            
            Image("RicoArt10")
                .resizable()
        }
        .navigationTitle("Nouvelle publication")
    }
}

// Vue pour les artistes à proximité
struct NearbyArtistsView: View {
    var body: some View {
        VStack {
            Text("Des artistes talentueux se trouvent près de chez vous")
                .font(.headline)
                .padding()
            Spacer()
        }
        .navigationTitle("Artistes proches")
    }
}

// Vue principale des notifications
struct NotificationView: View {
    // Exemple de notifications
    let notifications = [
        "Alice vous a ajouté à ses favoris",
        "Nouvelle vidéo disponible de YumiZen !",
        "Votre profil a été mis à jour avec succès",
        "Une nouvelle publication a été ajoutée à votre profil",
        "Des artistes talentueux se trouvent près de chez vous"
    ]
    
    var body: some View {
        NavigationView {
            List(notifications, id: \.self) { notification in
                // Utilisation de switch pour naviguer vers la bonne vue
                NavigationLink(destination: destinationView(for: notification)) {
                    HStack {
                        Image(systemName: "bell.badge") // Icône pour chaque notification
                            .foregroundColor(.red)
                        Text(notification)
                            .font(.body)
                    }
                }
            }
            .navigationTitle("Notifications")
        }
    }
    
    // Méthode pour déterminer la vue associée à une notification
    @ViewBuilder
    func destinationView(for notification: String) -> some View {
        switch notification {
        case "Alice vous a ajouté à ses favoris":
            FavorisAliceView()
        case "Nouvelle vidéo disponible de YumiZen !":
            VideoYumiZenView()
        case "Votre profil a été mis à jour avec succès":
            ProfilUpdateView()
        case "Une nouvelle publication a été ajoutée à votre profil":
            NewPostView()
        case "Des artistes talentueux se trouvent près de chez vous":
            NearbyArtistsView()
        default:
            Text("Détails de la notification")
        }
    }
}

#Preview {
    NotificationView()
}

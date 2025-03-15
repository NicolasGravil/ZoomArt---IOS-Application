//
//  ProfilType.swift
//  ZoomArt
//
//  Created by Apprenant 82 on 26/09/2024.
//

import SwiftUI

class Myfavorites: ObservableObject {
    static let shared = Favorites() // Singleton instance
    @Published var items: [FavoriteItem] = [] // List of favorites
}


struct ProfilType: View {
    var user: User // Représente l'utilisateur

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button {
                        // Action lorsque l'utilisateur appuie sur l'image
                    } label: {
                        Image(user.profileImage) // Utilise l'image de profil de l'utilisateur
                            .resizable()
                            .frame(width: 120, height: 120)
                            .cornerRadius(20)
                            .padding(5)
                            .background(Color.darkRed) // Utilisez .darkRed si défini
                            .cornerRadius(20)
                            .shadow(radius: 10)
                    }

                    // Informations de profil à droite
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.system(size: 34))
                            .bold()
                        
                        Text(user.username) // Affiche le pseudo
                        Text("\(user.postCount) Publications ｜ \(user.fanCount) Favoris") // Affiche les stats
                    }
                    .padding(.leading, 20)
                    .padding(.top, 10)
                    .padding(.bottom, 10)

                    Spacer() // Espace pour pousser le bouton à droite
                }
                .padding()

                Spacer() // Espace supplémentaire pour séparer le contenu

            EliseGrid()
                
            }
        
        }
    }
}

#Preview {
    ProfilType(user: User(id: UUID(), name: "Elise Copter", username: "Art Visuel", postCount: 10, fanCount: 1680, profileImage: "Eliseuser"))
}


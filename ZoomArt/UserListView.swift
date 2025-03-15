//
//  UserListView.swift
//  ZoomArt
//
//  Created by Apprenant 82 on 24/09/2024.
//

import SwiftUI

struct UserListView: View {
    let users: [User] = [
        User(id: UUID(), name: "Rico Martin", username: "@Rico_page", postCount: 2882, fanCount: 893, profileImage: "Ricouser"),
        User(id: UUID(), name: "Alice Moreau", username: "@Alice_Moreauu", postCount: 1200, fanCount: 450, profileImage: "Aliceuser"),
        User(id: UUID(), name: "David Garcia", username: "@Daviid_Garcia22", postCount: 300, fanCount: 800, profileImage: "Daviduser"),
        User(id: UUID(), name: "Lucas Leroy", username: "@Luluart", postCount: 1200, fanCount: 450, profileImage: "Lucasuser"),
        User(id: UUID(), name: "Sabrina Lefèvre", username: "@Sabriart", postCount: 300, fanCount: 800, profileImage: "Sabrinauser"),
        User(id: UUID(), name: "Léa Petit", username: "@Léacréations", postCount: 1200, fanCount: 450, profileImage: "Léauser"),
        User(id: UUID(), name: "Martin Fournier", username: "@MartinSculpt", postCount: 300, fanCount: 800, profileImage: "Martinuser")
    ]
    
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink(destination: Profil(user: user)) {
                    HStack {
                        Image(user.profileImage)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.username)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationBarTitle("Utilisateurs")
        }
    }
}

#Preview {
    UserListView()
}



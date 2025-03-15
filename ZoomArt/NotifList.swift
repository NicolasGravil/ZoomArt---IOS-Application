//
//  NotifList.swift
//  ZoomArt
//
//  Created by Apprenant 82 on 25/09/2024.
//

import SwiftUI

struct NotifList: View {
    
    var notifs = [
        NotifView(icon: "bubble.circle", text: "Vous avez un commentaire"),
        NotifView(icon: "person.crop.circle.badge.checkmark", text: "Joris B vous a ajouté"),
        NotifView(icon: "person.2.circle", text: "Vous avez un nouvel abonné"),
        NotifView(icon: "photo.artframe", text: "Yumi a partagé une nouvelle publication")
    ]
    
    var body: some View {
        NavigationStack {
            List(notifs) { notif in
                Label(notif.text, systemImage: notif.icon)
                    .foregroundStyle(.darkRed)
                    .padding()
                
            }.navigationTitle("Notifications")
        }
    }
}

#Preview {
   NotifList()
}


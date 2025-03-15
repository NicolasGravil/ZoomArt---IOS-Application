//
//  EliseGrid.swift
//  ZoomArt
//
//  Created by Apprenant 82 on 26/09/2024.
//

//
//  EliseGrid.swift
//  ZoomArt
//
//  Created by Apprenant 82 on 25/09/2024.
//

import SwiftUI

struct EliseGrid: View {
    @State private var selectedTab: Tab = .photos
    
    enum Tab {
        case reels, photos, videos
    }
    
    var body: some View {
        VStack {
            // Mini navigation bar
            HStack {
                TabButton(imageName: "camera", isSelected: selectedTab == .photos) {
                    selectedTab = .photos
                }

                TabButton(imageName: "movieclapper", isSelected: selectedTab == .videos) {
                    selectedTab = .videos
                }

                TabButton(imageName: "pencil.and.list.clipboard", isSelected: selectedTab == .reels) {
                    selectedTab = .reels
                }
            }
            .frame(maxHeight: 50)
            .padding(.vertical, 10)
            .background(Color(UIColor.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)

            // Contenu basé sur l'onglet sélectionné
            contentForSelectedTab()

            Spacer()
        }
    }
    
    @ViewBuilder
    private func contentForSelectedTab() -> some View {
        switch selectedTab {
        case .photos:
            PhotosView16()
                .font(.largeTitle)
                .padding()
        case .videos:
            Text("Videos Content")
                .font(.largeTitle)
        case .reels:
                
            Text("Biographie")
                .font(.largeTitle)
           
            Text("Découvrez l'univers artistique unique d'Elise Copter, une artiste passionnée originaire de Marseille. Connue pour son amour des pistaches et son approche audacieuse de l'art contemporain, Elise vous invite à plonger dans son monde à travers cette application mobile. Suivez ses dernières créations, explorez ses œuvres inspirées par la ville ensoleillée et ses paysages méditerranéens, et recevez des notifications exclusives sur ses nouvelles expositions. Que vous soyez amateur d'art ou simplement curieux, cette application vous offre un accès privilégié à l'univers vibrant et coloré d'Elise Copter.")
                .padding()
            Text("Contact")
                .font(.largeTitle)
                .padding()
        Text("Mail: Elisecopter@gmail.com")
            Text("Lieu : Marseille")
        }
    }
}

#Preview {
    EliseGrid()
}


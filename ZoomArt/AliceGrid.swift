//
//  AliceGrid.swift
//  ZoomArt
//
//  Created by Apprenant 82 on 25/09/2024.
//

import SwiftUI

struct TabButton: View {
    let imageName: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: imageName)
                .fontWeight(isSelected ? .bold : .regular)
                .foregroundColor(isSelected ? .darkRed : .gray)
                .padding(40)
        }
    }
}

struct AliceGrid: View {
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
            PhotosView1()
                .font(.largeTitle)
                .padding()
        case .videos:
            Text("Videos Content")
                .font(.largeTitle)
        case .reels:
            Text("Biographie")
                .font(.largeTitle)
           
            Text("Plongez dans l'univers poétique d'Alice, une peintre talentueuse qui vous invite à découvrir ses œuvres à travers cette application mobile. Inspirée par la nature, les émotions humaines et les jeux de lumière, Alice crée des peintures qui captivent l'âme et l'esprit. Explorez sa galerie en ligne, suivez son processus créatif en temps réel, et soyez les premiers à découvrir ses nouvelles collections. Que vous soyez passionné d'art ou simple curieux, laissez-vous emporter par la sensibilité et la profondeur du travail d'Alice, où chaque toile raconte une histoire unique.")
                .padding()
            Text("Contact")
                .font(.largeTitle)
                .padding()
        Text("Mail: Lilice@gmail.com")
            Text("Lieu : Montpellier")
        }
    }
}

#Preview {
    AliceGrid()
}


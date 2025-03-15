//
//  EmmaGrid.swift
//  ZoomArt
//
//  Created by Apprenant 82 on 25/09/2024.
//

//
//  EmmaGrid.swift
//  ZoomArt
//
//  Created par Apprenant 82 le 25/09/2024.
//

import SwiftUI

struct EmmaGrid: View {
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
            PhotosView13()
                .font(.largeTitle)
                .padding()
        case .videos:
            Text("Videos Content")
                .font(.largeTitle)
        case .reels:
            Text("Biographie")
                .font(.largeTitle)
        }
    }
}

#Preview {
    EmmaGrid()
}


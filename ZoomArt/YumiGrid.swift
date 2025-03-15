import SwiftUI

struct YumiGrid: View {
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
            PhotosView12()
                .font(.largeTitle)
                .padding()
        case .videos:
            
        
                Spacer()
                 VideoView()
                 .font(.largeTitle)
                 .cornerRadius(20.0)
                 .padding()
                
        
                
                    
                     Text(" #ArtisteChinoise #PopÉpurée #DécouverteMusicale")
                 Spacer()
            
         
                    
            
            
        case .reels:
            Text("Biographie")
                .font(.largeTitle)
           
            Text("Entrez dans l'univers envoûtant de Yumi Zen, une chanteuse et guitariste d'origine asiatique qui fusionne harmonieusement tradition et modernité. Avec sa voix douce et captivante, Yumi vous transporte à travers des mélodies acoustiques, mêlant influences orientales et sons contemporains. Grâce à cette application mobile, suivez de près son actualité musicale, ses performances en direct, et explorez ses albums inspirants. Que vous soyez fan de musique acoustique ou en quête de nouvelles sonorités, laissez-vous charmer par la magie apaisante de l'univers musical de Yumi Zen.")
                .padding()
            Text("Contact")
                .font(.largeTitle)
                .padding()
        Text("Mail: Yumizen@icloud.com")
            Text("Lieu : Nice")
            
        }
    }
}

#Preview {
    YumiGrid()
}


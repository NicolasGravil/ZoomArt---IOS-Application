import SwiftUI

struct SwiftUIView: View {
    @State private var searchText = ""
    @State private var showNotificationView = false // État pour gérer l'affichage de la vue de notification

    var artlists = [
        Artlist(icon: "paint", name: "ART VISUEL",images: ["Rico_Martin_Art_Visuel","Théo_Laurent_Art Visuel","Victor_Lefèvre_Art_Visuel"]),
        Artlist(icon: "music", name: "MUSIQUE",images: ["Antoine_Leroy_Musique","Aurélien_Dubois_Musique","Camille_Richard_Musique"]),
        Artlist(icon: "sculpture", name: "SCULPTURE",images: ["Chloé_Martin_Sculpture","Élodie_Girard_Sculpture","Julien_Bernard_Sculpture"]),
        Artlist(icon: "artscene", name: "ART DE LA SCENE",images: ["Lucas_Fontaine_Art_de_la_scene","Mathilde_Durand_Art_de_la_scene","Sophie_Moreau_Art_de_la _scene"])
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                // Barre de recherche
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 8)
                    TextField("Search", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    Image(systemName: "mic.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing, 8)
                }
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 5)
                .padding()
                
                // Contenu principal
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Top Artiste de la semaine")
                            .padding(5)
                        
                        HStack {
                            Image("Top1")
                                .border(Color.black, width: 2)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(radius: 10)
                                .padding(8)
                            Image("Top2")
                                .border(Color.black, width: 2)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(radius: 10)
                        }
                        
                        HStack {
                            Image("Top3")
                                .border(Color.black, width: 2)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(radius: 10)
                                .padding(8)
                            Image("Top4")
                                .border(Color.black, width: 2)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(radius: 10)
                        }
                        
                        ForEach(artlists) { artlist in
                            VStack(alignment: .leading) {
                                HStack {
                                    Image(artlist.icon)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .padding(.trailing, 10)
                                    
                                    VStack(alignment: .leading) {
                                        Text(artlist.name)
                                            .font(.headline)
                                    }
                                }
                                .padding(.bottom, 10)
                                .padding(.horizontal)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(artlist.images, id: \.self) { imageName in
                                            Image(imageName)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 100, height: 100)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                        }
                                    }
                                }
                                .frame(height: 100)
                                .padding(.horizontal)
                                
                                Divider()
                            }
                            .padding(.vertical, 10)
                        }
                    }
                }
            }
            .navigationTitle("ZoomArt")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showNotificationView.toggle() // Affiche la vue de notification
                    }) {
                        Image(systemName: "bell.badge.fill")
                            .font(.title)
                    }
                }
            }
            .navigationDestination(isPresented: $showNotificationView) {
                NotificationView() // La vue affichée après avoir cliqué sur le bouton de notification
            }
        }
    }
}

struct NotificationView: View {
    var body: some View {
        VStack {
            Image("sadbaloon")
            Text("Notifications")
            
                .font(.largeTitle)
                .padding()
            
            // Ajoute le contenu de la vue de notifications ici
            Text("Aucune nouvelle notification.")
        }
    }
}



#Preview {
    SwiftUIView()
}


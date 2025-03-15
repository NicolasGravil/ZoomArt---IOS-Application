import SwiftUI

struct Grid2: View {
    @State private var selectedTab: Tab = .photos
    @State private var isEditingBio = false // Pour contrôler l'affichage de la feuille d'édition
    @State private var biography = "Biographie de l'utilisateur ici" // Modèle pour la biographie

    enum Tab {
        case reels, photos, videos
    }

    var body: some View {
        VStack {
            // Mini navigation bar
            HStack {
                Button(action: {
                    selectedTab = .photos
                }) {
                    Image(systemName: "camera")
                        .fontWeight(selectedTab == .photos ? .bold : .regular)
                        .foregroundColor(selectedTab == .photos ? .darkRed : .gray)
                        .padding(40)
                }

                Button(action: {
                    selectedTab = .videos
                }) {
                    Image(systemName: "movieclapper")
                        .fontWeight(selectedTab == .videos ? .bold : .regular)
                        .foregroundColor(selectedTab == .videos ? .darkRed : .gray)
                        .padding()
                }
                .frame(maxWidth: .infinity)

                Button(action: {
                    selectedTab = .reels
                }) {
                    Image(systemName: "pencil.and.list.clipboard")
                        .fontWeight(selectedTab == .reels ? .bold : .regular)
                        .foregroundColor(selectedTab == .reels ? .blue : .gray)
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxHeight: 20)
            .padding(.vertical, 10)
            .background(Color(UIColor.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)

            // Content based on the selected tab
            if selectedTab == .reels {
                // Onglet reels avec le bouton éditer pour la biographie
                VStack {
                   

                    Text("BIOGRAPHIE")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text(biography)
                        .padding()
                        .multilineTextAlignment(.center)

                    // Bouton Éditer pour la biographie
                    Button(action: {
                        isEditingBio.toggle() // Affiche la feuille d'édition
                    }) {
                        Text("Éditer la Biographie")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            } else if selectedTab == .photos {
                PhotosView()
                    .font(.largeTitle)
                    .padding()

            } else if selectedTab == .videos {
                Text("Videos Content")
                    .font(.largeTitle)
            }

            Spacer()
        }
        .sheet(isPresented: $isEditingBio) {
            // Feuille pour éditer la biographie
            EditBiographyView(biography: $biography)
        }
    }
}

// Vue pour éditer la biographie
struct EditBiographyView: View {
    @Binding var biography: String
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Entrez votre biographie", text: $biography)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Spacer()
            }
            .navigationTitle("Éditer la Biographie")
            .navigationBarItems(leading: Button("Annuler") {
                dismiss() // Ferme la feuille sans sauvegarder
            }, trailing: Button("Enregistrer") {
                dismiss() // Sauvegarde la biographie et ferme la feuille
            })
        }
    }
}

#Preview {
    Grid2()
}


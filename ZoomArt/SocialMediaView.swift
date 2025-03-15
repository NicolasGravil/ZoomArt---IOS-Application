import SwiftUI

struct SocialMediaView: View {
    @State private var searchText = ""
    @State private var selectedCategory: Category = .all
    @State private var showCategoryMenu = false // New state for showing the category menu
    
    var users = [
        UserStory(name: "Alice", imageName: "Aliceuser", category: .artVisuel),
        UserStory(name: "Bertrand", imageName: "Bertranduser", category: .artVisuel),
        UserStory(name: "David", imageName: "Daviduser", category: .artVisuel),
        UserStory(name: "Sabrina", imageName: "Sabrinauser", category: .artVisuel),
        UserStory(name: "Bob", imageName: "Bobuser", category: .musique),
        UserStory(name: "Lucas", imageName: "Lucasuser", category: .musique),
        UserStory(name: "Yumi", imageName: "Yumiuser", category: .musique),
        UserStory(name: "Julien", imageName: "Julienuser", category: .musique),
        UserStory(name: "Celine", imageName: "Celineuser", category: .sculpture),
        UserStory(name: "Martin", imageName: "Martinuser", category: .sculpture),
        UserStory(name: "Thomas", imageName: "Thomasuser", category: .sculpture),
        UserStory(name: "Emma", imageName: "Emmauser", category: .artDeLaScene),
        UserStory(name: "Claire", imageName: "Claireuser", category: .artDeLaScene),
        UserStory(name: "Léa", imageName: "Léauser", category: .artDeLaScene)
    ]
    
    var posts = [
        UserPost(userImage: "Aliceuser", name: "Alice Dupont", userName: "alicesaglisse", imageTitle: "Peinture Abstraite", postImage: "Peinture1", postCount: 45, fanCount: 125, category: .artVisuel),
        UserPost(userImage: "Bertranduser", name: "Bertrand Lefèvre", userName: "PlumeOliv", imageTitle: "Peinture Minimaliste", postImage: "Peinture2", postCount: 228, fanCount: 459, category: .artVisuel),
        UserPost(userImage: "Daviduser", name: "David Moreau", userName: "DadaPicture", imageTitle: "Photographie Urbaine", postImage: "Photo1", postCount: 575, fanCount: 375, category: .artVisuel),
        UserPost(userImage: "Sabrinauser", name: "Sabrina Giraud ", userName: "SabbyVibes", imageTitle: "Peinture Surréalisme", postImage: "Peinture3", postCount: 679, fanCount: 779, category: .artVisuel),
        UserPost(userImage: "Bobuser", name: "Bob Olane", userName: "BobInspire", imageTitle: "Musique Jazz", postImage: "Music1", postCount: 566, fanCount: 1754, category: .musique),
        UserPost(userImage: "Lucasuser", name: "Lucas Marchand", userName: "Lucaspiration", imageTitle: "Musique Classique", postImage: "Music2", postCount: 55, fanCount: 756, category: .musique),
        UserPost(userImage: "Yumiuser", name: "Yumi Bo", userName: "YumiZen", imageTitle: "Musique Accoustic", postImage: "Music3", postCount: 45, fanCount: 4654, category: .musique),
        UserPost(userImage: "Julienuser", name: "Julien Garnier", userName: "JulienXArt", imageTitle: "Sculpture Moderne", postImage: "Sculpture1", postCount: 36, fanCount: 2654, category: .sculpture),
        UserPost(userImage: "Celineuser", name: "Celine Fontaine", userName: "CelineMuse", imageTitle: "Danse Contemporaine", postImage: "Danse1", postCount: 44, fanCount: 75, category: .artDeLaScene),
        UserPost(userImage: "Martinuser", name: "Martin Chevalier", userName: "MartinCraft", imageTitle: "Sculpture Moderne", postImage: "Sculpture2", postCount: 68, fanCount: 1346, category: .sculpture),
        UserPost(userImage: "Thomasuser", name: "Thomas Petit", userName: "Thomasterpiece", imageTitle: "Sculpture Moderne", postImage: "Sculpture3", postCount: 66, fanCount: 475, category: .sculpture),
        UserPost(userImage: "Emmauser", name: "Emma Loufe", userName: "EmmaInspire", imageTitle: "Danse Contemporaine", postImage: "Danse2", postCount: 56, fanCount: 1234, category: .artDeLaScene),
        UserPost(userImage: "Claireuser", name: "Claire Lorfib", userName: "Clairity", imageTitle: "Danse Classique", postImage: "Danse3", postCount: 345, fanCount: 133, category: .artDeLaScene),
        UserPost(userImage: "Léauser", name: "Lea Gomare", userName: "LeaArtflow", imageTitle: "Chanteuse", postImage: "Danse4", postCount: 44, fanCount: 1244, category: .musique),
        
        
    ]
    
    enum Category: String, CaseIterable, Identifiable {
        case all = "Tous"
        case artVisuel = "Art Visuel"
        case musique = "Musique"
        case sculpture = "Sculpture"
        case artDeLaScene = "Art de la scène"
        
        var id: String { self.rawValue }
    }
    
  
    var filteredUsers: [UserStory] {
        let filteredByCategory = selectedCategory == .all ? users : users.filter { $0.category == selectedCategory }
        if searchText.isEmpty {
            return filteredByCategory
        } else {
            return filteredByCategory.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
 
    var filteredPosts: [UserPost] {
        if selectedCategory == .all {
            return posts
        } else {
            return posts.filter { $0.category == selectedCategory }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                // Barre de titre, sélection de catégorie et bouton de recherche
                HStack {
                    Text("Actualités")
                        .font(.title)
                        .fontWeight(.bold)
                        
                    Spacer()
                    
                    // Hamburger Button for category selection
                    Button(action: {
                        showCategoryMenu.toggle()
                    }) {
                        Image(systemName: "line.horizontal.3") // Hamburger icon
                            .font(.title)
                            .foregroundColor(.darkRed)
                    }
                    .actionSheet(isPresented: $showCategoryMenu) {
                        ActionSheet(title: Text("Select Category"),
                                    buttons: Category.allCases.map { category in
                            .default(Text(category.rawValue)) {
                                selectedCategory = category
                            }
                        } + [.cancel()])
                    }
                }
                .padding()

                // Champ de texte pour la recherche
                HStack {
                    TextField("Rechercher un utilisateur...", text: $searchText)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.darkRed)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 8)
                                
                                if !searchText.isEmpty {
                                    Button(action: {
                                        searchText = ""
                                    }) {
                                        Image(systemName: "multiply.circle.fill")
                                            .foregroundColor(.darkRed)
                                            .padding(.trailing, 8)
                                    }
                                }
                            }
                        )
                        .padding(.horizontal)
                }
                .padding(.vertical, 10)
                
                // Liste horizontale pour les stories (filtrée)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(filteredUsers) { user in
                            VStack {
                                Image(user.imageName)
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.darkRed, lineWidth: 2))
                                
                                Text(user.name)
                                    .font(.caption)
                                    .lineLimit(1)
                                    .foregroundColor(.darkRed)
                                
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 10)
                
                Divider()
                
                // Liste verticale des posts d'utilisateur (filtrée)
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(filteredPosts) { post in
                            NavigationLink(destination: ArtistView(userPost: post)) { // NavigationLink vers ArtistView
                                VStack(alignment: .leading) {
                                    HStack {
                                        Image(post.userImage)
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                            .overlay(Circle().stroke(Color.darkRed, lineWidth: 2))
                                        
                                        VStack(alignment: .leading) {
                                            Text(post.userName)
                                                .font(.headline)
                                                .foregroundColor(.darkRed)
                                            Text(post.imageTitle)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                        Spacer()
                                    }
                                    .padding(.horizontal)
                                    
                                    // Image du post
                                    Image(post.postImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 300)
                                        .clipped()
                                        .cornerRadius(10)
                                    
                                    Divider()
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

// Vue pour un artiste spécifique
struct ArtistView: View {
    var userPost: UserPost // Le post de l'utilisateur sélectionné
 
    
    var body: some View {
        VStack {
            
            VStack {
                HStack {
                    Button {
                        // Action lorsque l'utilisateur appuie sur l'image
                    } label: {
                        Image(userPost.userImage) // Utilise l'image de profil de l'utilisateur
                            .resizable()
                            .frame(width: 120, height: 120)
                            .cornerRadius(20)
                            .padding(5)
                            .background(Color.darkRed) // Utilisez .darkRed si défini
                            .cornerRadius(20)
                            .shadow(radius: 5)
                        
                    }

                    // Informations de profil à droite
                    VStack(alignment: .leading) {
                        Text(userPost.name)
                            .font(.system(size: 34))
                            .bold()
                        
                        
                        Text(userPost.category.rawValue)
                           
                            

                        Text("\(userPost.postCount) Publications ｜ \(userPost.fanCount) Favoris") // Affiche les stats
                    }
                    .padding(.leading, 20)
                    .padding(.top, 10)
                    .padding(.bottom, 10)

                    Spacer() // Espace pour pousser le bouton à droite
                }
                .padding()

                Spacer() // Espace supplémentaire pour séparer le contenu

                if userPost.userName == "alicesaglisse" {
                                    AliceGrid()
                  
                                }
               
                if userPost.userName == "PlumeOliv" {
                                    BertrandGrid()
                                }
                
                if userPost.userName == "DadaPicture" {
                                    DaviGrid()
                                }
                
                if userPost.userName == "EmmaInspire" {
                                    EmmaGrid()
                                }
                if userPost.userName == "SabbyVibes" {
                                    SabrinaGrid()
                                }
                
                if userPost.userName == "BobInspire" {
                                   BobGrid()
                                }
                
                if userPost.userName == "Lucaspiration" {
                                   LucasGrid()
                                }
                if userPost.userName == "JulienXArt" {
                                  JulienGrid()
                                }
                if userPost.userName == "CelineMuse" {
                                  CelineGrid()
                                }
                if userPost.userName == "MartinCraft" {
                                  MartinGrid()
                                }
                if userPost.userName == "Thomasterpiece" {
                                  ThomasGrid()
                                }
                
                if userPost.userName == "Clairity" {
                                  ClaireGrid()
                                }
                if userPost.userName == "LeaArtflow" {
                                  LeaGrid()
                                }
                if userPost.userName == "YumiZen" {
                                  YumiGrid()
                                }
                
            }
            
          
            
           
            
            

        }
        .navigationTitle(userPost.userName)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: HeartButtonView(showButtonHeart: true, userPost: userPost))
       
    }
}

// Modèle pour les stories avec une catégorie associée
struct UserStory: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let category: SocialMediaView.Category
    }

// Modèle pour les posts avec une catégorie associée
struct UserPost: Identifiable {
    let id = UUID()
    let userImage: String
    let name: String
    let userName: String
    let imageTitle: String
    let postImage: String
    let postCount: Int
    let fanCount: Int
    let category: SocialMediaView.Category
}

struct User: Identifiable {
    var id: UUID
    var name: String
    var username: String
    var postCount: Int
    var fanCount: Int
    var profileImage: String // Nom de l'image dans les assets
}

#Preview {
    SocialMediaView()
}

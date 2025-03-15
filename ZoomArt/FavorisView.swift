import SwiftUI

// Singleton for managing favorites
class myFavorites: ObservableObject {
    static let shared = Favorites() // Singleton instance
    @Published var items: [FavoriteItem] = [] // List of favorites
}

// Model for FavoriteItem
struct FavoriteItem: Identifiable {
    var id = UUID() // Unique identifier
    var profileImage: String
    var username: String
    var postCount: Int
    var fanCount: Int
}

// Assuming UserPost model is defined somewhere in your code
struct myUserPost {
    var userImage: String
    var name: String
    var userName: String
    var imageTitle: String
    var postImage: String
    var postCount: Int
    var fanCount: Int
    var category: Category
}

// Enum for categories
enum Category {
    case artVisuel, theater
}

// HeartButtonView
struct myHeartButtonView: View {
    @State private var isHeartFilled: Bool = false
    var showButtonHeart: Bool
    var userPost: UserPost

    var body: some View {
        HStack {
            if showButtonHeart {
                Button(action: {
                    isHeartFilled.toggle()
                    
                    // Add user post to favorites if not already added
                    if isHeartFilled {
                        let favorite = FavoriteItem(
                            profileImage: userPost.userImage,
                            username: userPost.userName,
                            postCount: userPost.postCount,
                            fanCount: userPost.fanCount
                        )
                        Favorites.shared.items.append(favorite)
                    }
                }) {
                    Image(systemName: isHeartFilled ? "heart.fill" : "heart")
                        .foregroundColor(isHeartFilled ? .red : .black)
                        .font(.title2)
                }
            }
        }
    }
}

// FavorisView to display list of favorite items
struct FavorisView: View {
    @ObservedObject var favorites = Favorites.shared // Observe the shared favorites list

    var body: some View {
        NavigationView {
            List {
                ForEach(favorites.items) { favorite in
                    HStack {
                        Image(favorite.profileImage) // Display profile image
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())

                        VStack(alignment: .leading) {
                            Text(favorite.username) // Display username
                                .font(.headline)
                            Text("\(favorite.postCount) Publication ｜ \(favorite.fanCount) Favoris") // Display post and fan count
                                .font(.subheadline)
                        }
                    }
                }
                .onDelete(perform: deleteItems) // Enable swipe to delete
            }
            .navigationTitle("Favoris")
           
        }
    }
    
    // Function to delete items from favorites
    func deleteItems(at offsets: IndexSet) {
        favorites.items.remove(atOffsets: offsets)
    }
}

// Example UserPost for ContentView
struct myContentView: View {
    var body: some View {
        let samplePost = UserPost(
            userImage: "Ricouser",
            name: "Rico Martin",
            userName: "@Rico_page",
            imageTitle: "Sample Post",
            postImage: "SampleImage",
            postCount: 2882,
            fanCount: 893,
            category: .artVisuel // Ensure this matches your existing UserPost definition
        )
        
        VStack {
            HeartButtonView(showButtonHeart: true, userPost: samplePost)
            NavigationLink(destination: FavorisView()) {
                Text("View Favorites")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

// Preview the ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

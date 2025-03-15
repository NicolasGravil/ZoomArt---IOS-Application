//
//  buttonHeartFavoris.swift
//  ZoomArt
//
//  Created by Apprenant 82 on 25/09/2024.
//

import SwiftUI

struct HeartButtonView: View {
    @State private var isHeartFilled: Bool = false
    @State private var navigateToContentView: Bool = false
    var showButtonHeart: Bool // Controls the visibility of the heart button
    var userPost: UserPost // UserPost information to be used

    var body: some View {
        HStack {
            if showButtonHeart {
                Button(action: {
                    isHeartFilled = true // Set heart as filled
                    navigateToContentView = true // Trigger navigation to ContentView
                    
                    // Create a FavoriteItem using the UserPost information
                    let favorite = FavoriteItem(
                        profileImage: userPost.userImage,
                        username: userPost.userName,
                        postCount: userPost.postCount,
                        fanCount: userPost.fanCount
                    )
                    
                    // Add user to favorites
                    Favorites.shared.items.append(favorite)
                }) {
                    Image(systemName: isHeartFilled ? "heart.fill" : "heart")
                        .foregroundColor(isHeartFilled ? .red : .darkRed)
                        .font(.title2)
                }
            }
        }
    }
}

// Preview provider for HeartButtonView
struct HeartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        let samplePost = UserPost(
            userImage: "Ricouser",
            name: "Rico Martin",
            userName: "@Rico_page",
            imageTitle: "Sample Post",
            postImage: "SampleImage",
            postCount: 2882,
            fanCount: 893,
            category: .artVisuel // Adjust as necessary
        )
        HeartButtonView(showButtonHeart: true, userPost: samplePost) // Show heart button in preview
    }
}


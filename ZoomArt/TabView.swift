//
//  TabView.swift
//  ZoomArt
//
//  Created by Apprenant 82 on 23/09/2024.
//

import SwiftUI

struct TabView: View {
    
    @StateObject var viewRouter: ViewRouter
    @State var showPopUp = false
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack{
                Spacer()
                
                switch viewRouter.currentPage {
                case .home:
                    SocialMediaView()
                case .like:
                    FavorisView()
                case .alert:
                    NotificationView()
                case .user:
                    Profil(user: User(id: UUID(), name: "Rico Martin", username: "Art Visuel", postCount: 2882, fanCount: 893, profileImage: "Ricouser"))
                }
                
                Spacer()
                
                ZStack {
                    if showPopUp {
                        PlusMenu(widthAndHeight: geometry.size.width/7)
                            .offset(y: -geometry.size.height/6)
                    }
                    
                    HStack {
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/5, heigh: geometry.size.height/28, systemIconName: "homekit", tabName: "Actualités")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .like, width: geometry.size.width/5, heigh: geometry.size.height/28, systemIconName: "heart", tabName: "Favoris")
                        
                        ZStack {
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width/7, height: geometry.size.width/7)
                                .shadow(radius: 4)
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width/7-6, height: geometry.size.width/7-6)
                                .foregroundColor(.darkRed) // Couleur modifiée ici
                                .rotationEffect(Angle(degrees: showPopUp ? 90 : 0))
                        }
                        .offset(y: -geometry.size.height/8/2)
                        .onTapGesture {
                            withAnimation {
                                showPopUp.toggle()
                            }
                        }
                        
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .alert, width: geometry.size.width/5, heigh: geometry.size.height/28, systemIconName: "bell", tabName: "Notifications")
                        
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .user, width: geometry.size.width/5, heigh: geometry.size.height/28, systemIconName: "person.crop.circle", tabName: "Profil")
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height/8)
                    .background(Color("TabBarBackground"))
                    .shadow(radius: 2)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    TabView(viewRouter: ViewRouter())
}

struct PlusMenu: View {
    let widthAndHeight: CGFloat
    @State private var showPublishView = false
    @State private var beforeOurMapView = false
    
    var body: some View {
        HStack(spacing: 50) {
            ZStack {
                Circle()
                    .foregroundColor(.darkRed) // Couleur modifiée ici
                    .frame(width: widthAndHeight, height: widthAndHeight)
                Image(systemName: "map")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                    .foregroundColor(.white)
            }
            .onTapGesture {
                beforeOurMapView = true
            }
            .sheet(isPresented: $beforeOurMapView) {
                BeforeOurMapView()
            }

            ZStack {
                Circle()
                    .foregroundColor(.darkRed) // Couleur modifiée ici
                    .frame(width: widthAndHeight, height: widthAndHeight)
                Image(systemName: "folder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                    .foregroundColor(.white)
            }
            .onTapGesture {
                showPublishView = true // Ouvre la page de publication
            }
        }
        .sheet(isPresented: $showPublishView) {
            UploadContentView()
        }
        .transition(.scale)
    }
}

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    
    let width, heigh: CGFloat
    let systemIconName, tabName: String
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: heigh)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .padding(.horizontal, -4)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
        .foregroundColor(viewRouter.currentPage == assignedPage ? .darkRed : .black) // Couleur modifiée ici
    }
}

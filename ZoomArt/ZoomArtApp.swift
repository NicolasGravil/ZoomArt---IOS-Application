//
//  ZoomArtApp.swift
//  ZoomArt
//
//  Created by Apprenant 82 on 19/09/2024.
//

import SwiftUI

@main
struct ZoomArtApp: App {
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            
            TabView(viewRouter: viewRouter)
        }
    }
}

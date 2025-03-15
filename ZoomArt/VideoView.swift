//
//  VideoView.swift
//  ZoomArt
//
//  Created by Apprenant 82 on 25/09/2024.
//


import SwiftUI
import AVKit
struct VideoView: View {
    
    let avPlayer = AVPlayer(url:  Bundle.main.url(forResource: "video", withExtension: "mp4")!)
    
    var body: some View {
        
       
        VideoPlayer(player: avPlayer)
    }
}

#Preview {
    VideoView()
}

//
//  VideoPlayerView.swift
//  ZoomArt
//
//  Created by Apprenant 82 on 26/09/2024.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var body: some View {
        VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "sampleVideo", withExtension: "mp4")!))
            .frame(height: 300)
            .onAppear {
                AVPlayer(url: Bundle.main.url(forResource: "invideo-ai-1080-asian-girl-s-mesmerizing-singing-talent-2024-09-25_XLiDPIiV", withExtension: "mp4")!).play()
            }
    }
}

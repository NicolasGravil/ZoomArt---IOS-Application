//
//  PhotosView.swift
//  ZoomArt
//
//  Created by Apprenant 82 on 23/09/2024.
//

import SwiftUI
    
struct PhotosView: View {
    @State private var detail: Int? = nil
    
    var body: some View {
        ZStack {
            photoGrid
            detailView
        }
    }
    
    @ViewBuilder
    var detailView: some View {
        if detail != nil {
            Image("Mathilde_Durand_Art_de_la_scene")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
    
    var photoGrid: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 115, maximum: 125), spacing: 3)], spacing: 3) {
                ForEach(1..<20) { ix in
                    Image("RicoArt10")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt9")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt8")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt7")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt6")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt5")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt4")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt")
                        
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt11")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt12")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt13")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt14")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt15")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt16")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt17")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt18")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt19")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt20")
                        
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt21")
                        
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt22")
                        
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt23")
                        
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt24")
                        
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("RicoArt25")
                        
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.00)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                }
            }
        }
    }
}

#Preview {
   PhotosView()
}


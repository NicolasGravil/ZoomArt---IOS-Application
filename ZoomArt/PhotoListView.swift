//
//  PhotoListView.swift
//  ZoomArt
//
//  Created by Apprenant 82 on 24/09/2024.
//

import SwiftUI

// Première vue avec les images modifiées
struct PhotosView1: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 115, maximum: 125), spacing: 3)], spacing: 3) {
                ForEach(1..<20) { ix in
                    Image("AliceArt\(ix)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.0)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                }
            }
        }
    }
}

struct PhotosView2: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 115, maximum: 125), spacing: 3)], spacing: 3) {
                ForEach(1..<20) { ix in
                    Image("BertrandArt\(ix)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.0)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                }
            }
        }
    }
}


struct PhotosView3: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 115, maximum: 125), spacing: 3)], spacing: 3) {
                ForEach(1..<20) { ix in
                    Image("BobArt\(ix)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.0)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                }
            }
        }
    }
}

struct PhotosView4: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 115, maximum: 125), spacing: 3)], spacing: 3) {
                ForEach(1..<20) { ix in
                    Image("CelineArt\(ix)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.0)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                }
            }
        }
    }
}

struct PhotosView5: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 115, maximum: 125), spacing: 3)], spacing: 3) {
                ForEach(1..<20) { ix in
                    Image("DavidArt\(ix)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.0)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                }
            }
        }
    }
}

struct PhotosView6: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 115, maximum: 125), spacing: 3)], spacing: 3) {
                ForEach(1..<20) { ix in
                    Image("JulienArt\(ix)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.0)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                }
            }
        }
    }
}

struct PhotosView7: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 115, maximum: 125), spacing: 3)], spacing: 3) {
                ForEach(1..<20) { ix in
                    Image("LéaArt\(ix)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.0)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                }
            }
        }
    }
}

struct PhotosView8: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 115, maximum: 125), spacing: 3)], spacing: 3) {
                ForEach(1..<20) { ix in
                    Image("LucasArt\(ix)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.0)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                }
            }
        }
    }
}


struct PhotosView09: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 115, maximum: 125), spacing: 3)], spacing: 3) {
                ForEach(1..<20) { ix in
                    Image("MartinArt\(ix)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.0)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                }
            }
        }
    }
}

struct PhotosView10: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 115, maximum: 125), spacing: 3)], spacing: 3) {
                ForEach(1..<20) { ix in
                    Image("SabrinaArt\(ix)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.0)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                }
            }
        }
    }
}

struct PhotosView11: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 115, maximum: 125), spacing: 3)], spacing: 3) {
                ForEach(1..<20) { ix in
                    Image("ThomasArt\(ix)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.0)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                }
            }
        }
    }
}

struct PhotosView12: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 115, maximum: 125), spacing: 3)], spacing: 3) {
                ForEach(1..<20) { ix in
                    Image("YumiArt\(ix)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.0)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                }
            }
        }
    }
}

struct PhotosView13: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 115, maximum: 125), spacing: 3)], spacing: 3) {
                ForEach(1..<20) { ix in
                    Image("EmmaArt\(ix)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.0)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                }
            }
        }
    }
}

struct PhotosView14: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 115, maximum: 125), spacing: 3)], spacing: 3) {
                ForEach(1..<20) { ix in
                    Image("BertrandArt\(ix)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.0)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                }
            }
        }
    }
}

struct PhotosView15: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 115, maximum: 125), spacing: 3)], spacing: 3) {
                ForEach(1..<20) { ix in
                    Image("ClaireArt\(ix)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.0)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                }
            }
        }
    }
}

struct PhotosView16: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 115, maximum: 125), spacing: 3)], spacing: 3) {
                ForEach(1..<20) { ix in
                    Image("EliseArt\(ix)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.0)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                }
            }
        }
    }
}

#Preview {
    Group {
        PhotosView1()
        
      
    
        // etc. pour les autres vues
    }
}

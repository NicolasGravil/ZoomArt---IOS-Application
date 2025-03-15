//
//  ContentView.swift
//  ZoomArt
//
//  Created by Apprenant 82 on 19/09/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    TabView(viewRouter: ViewRouter())
}

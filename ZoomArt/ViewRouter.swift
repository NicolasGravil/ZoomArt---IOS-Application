//
//  ViewRouter.swift
//  ZoomArt
//
//  Created by Apprenant 82 on 23/09/2024.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .home
   
}

enum Page {
    case home
    case like
    case alert
    case user
}

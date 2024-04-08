//
//  CoordinatorDestination.swift
//  Components
//
//  Created by Eduardo on 07/04/24.
//

import Foundation
import SwiftUI

enum Destination: Hashable, View {
    case home
    case profile
    
    var body: some View {
        switch self {
            case .home:
                HomeView()
                
            case .profile:
                ProfileView()
        }
    }
}

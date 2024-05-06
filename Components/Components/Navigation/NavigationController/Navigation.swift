//
//  Coordinator.swift
//  Physiotherapy
//
//  Created by Eduardo on 16/03/24.
//

import Foundation
import SwiftUI

@Observable class Navigation {
    
    var path: [Destination] = []
        
    var sheet: Destination?
    
    var fullScreenCover: Destination?

    
    func push(_ destination: Destination, type: NavigationType = .link) {
        switch type {
            case .link:
                self.path.append(destination)
                
            case .sheet:
                self.sheet = destination
                
            case .fullScreenCover:
                self.fullScreenCover = destination
        }
    }
    
    func pop() {
        if sheet != nil {
            dismissSheet()
            return
        }
        
        // Check if there are elements in the path
        guard !path.isEmpty else {
            fatalError(NavigationError.pathEmpty.string)
        }
        
        // Ensure that at least one element remains after popping
        guard path.count > 1 else {
            fatalError(NavigationError.popLast.string)
        }
        
        path.removeLast()
    }
    
    private func dismissSheet() {
        self.sheet = nil
    }
}

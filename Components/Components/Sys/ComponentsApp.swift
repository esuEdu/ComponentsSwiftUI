//
//  ComponentsApp.swift
//  Components
//
//  Created by Eduardo on 23/03/24.
//

import SwiftUI
import SwiftData
 
@main
struct ComponentsApp: App {
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
                .swiftDataManagerModifier(.appContainer)
        }
    }
}




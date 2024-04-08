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
    @State var coordinator = Coordinator()
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
                .environment(coordinator)
                .swiftDataManagerModifier(.appContainer)
        }
    }
}




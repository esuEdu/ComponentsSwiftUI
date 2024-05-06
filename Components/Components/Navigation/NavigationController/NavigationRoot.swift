//
//  CoordinatorRoot.swift
//  Components
//
//  Created by Eduardo on 08/04/24.
//

import SwiftUI
import SwiftData

struct NavigationRoot: View {
    let path: Destination
    @State var coordinator = Navigation()
    
    init(_ path: Destination) {
        self.path = path
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            path
                .navigation(Destination.self)
        }
        .sheet(item: $coordinator.sheet, content: { item in
            NavigationRoot(item)
        })
        .fullScreenCover(item: $coordinator.fullScreenCover, content: { item in
            NavigationRoot(item)
        })

        .environment(coordinator)
    }
}

#Preview {
    let modelContainer: ModelContainer = .previewContainer
    
    return NavigationRoot(.home)
        .swiftDataManagerModifier(modelContainer)
}

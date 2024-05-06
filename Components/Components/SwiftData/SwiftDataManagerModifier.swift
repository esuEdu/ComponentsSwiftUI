//
//  SwiftDataManagerModifier.swift
//  Components
//
//  Created by Eduardo on 05/04/24.
//

import Foundation
import SwiftUI
import SwiftData
 
struct SwiftDataManagerModifier: ViewModifier {
    var modelContainer: ModelContainer
    
    func body(content: Content) -> some View {
        content
            .modelContainer(modelContainer)
            .environment(SwiftDataManager(modelContainer.mainContext))
    }
}

extension View {
    func swiftDataManagerModifier(_ modelContainer: ModelContainer) -> some View {
        self.modifier(SwiftDataManagerModifier(modelContainer: modelContainer))
    }
}

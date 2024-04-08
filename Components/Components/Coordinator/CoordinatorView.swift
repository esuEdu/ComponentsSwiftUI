//
//  CoordinatorView.swift
//  Physiotherapy
//
//  Created by Eduardo on 16/03/24.
//

import SwiftUI
import SwiftData

struct CoordinatorView: View {
    @Environment(Coordinator.self) private var coordinator
    
    var body: some View {
        VStack {
            coordinator.push(.profile)
        }
    }
}

#Preview {
    let modelContainer: ModelContainer = .previewContainer
    @State var coordinator = Coordinator()
    return CoordinatorView()
        .environment(coordinator)
        .swiftDataManagerModifier(modelContainer)
}

//
//  ModelContainerExtension.swift
//  Components
//
//  Created by Eduardo on 04/04/24.
//

import Foundation
import SwiftData

extension ModelContainer {
    
    static let appContainer: ModelContainer = {
        do {
            let container = try ModelContainer(for: ProfileModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))
            return container
        } catch {
            fatalError("Failed to create appContainer")
        }
    }()
    
    static let previewContainer: ModelContainer = {
        do {
            let container = try ModelContainer(for: ProfileModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
            return container
        } catch {
            fatalError("Failed to create PreviewContainer")
        }
    }()
}

//
//  SwiftDataManager.swift
//  Components
//
//  Created by Eduardo on 04/04/24.
//

import Foundation
import SwiftData

@Observable class SwiftDataManager {
    private var modelContext: ModelContext
    
    init(_ container: ModelContext) {
        self.modelContext = container
        defer { mockData() }
    }
    
    private func mockData() {
        do {
            // Make sure the persistent store is empty. If it's not, return the non-empty container.
            var itemFetchDescriptor = FetchDescriptor<ProfileModel>()
            itemFetchDescriptor.fetchLimit = 1
            guard try modelContext.fetch(itemFetchDescriptor).count == 0 else { return }
            
            // This code will only run if the persistent store is empty.
            let person = ProfileModel()
            
            modelContext.insert(person)
        } catch {
            fatalError("Fetch failed: \(error)")
        }
    }
    
    func fetchData() -> ProfileModel {
        do {
            let descriptor = FetchDescriptor<ProfileModel>()
            if let fetchedModel = try modelContext.fetch(descriptor).first {
              return fetchedModel
            } else {
                fatalError("No data fetched")
            }
        } catch {
            fatalError("Fetch failed: \(error)")
        }
    }
}

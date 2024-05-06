//
//  DestinationExtension.swift
//  Components
//
//  Created by Eduardo on 10/04/24.
//

import Foundation

extension Destination: Hashable, Identifiable {
    static func == (lhs: Destination, rhs: Destination) -> Bool {
        switch (lhs, rhs) {
            default:
                return true
        }
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
            default:
                return hasher.combine(self.id)
        }
    }
    
    var id: some Hashable {
        self
    }
}

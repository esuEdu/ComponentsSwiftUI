//
//  Coordinator.swift
//  Physiotherapy
//
//  Created by Eduardo on 16/03/24.
//

import Foundation
import SwiftUI

@Observable class Coordinator {
    
    private let destination = Destination.self
    
    func push(_ destination: Destination) -> some View {
        return destination
    }
}




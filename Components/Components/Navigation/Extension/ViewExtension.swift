//
//  ViewCoordinatorExtension.swift
//  Components
//
//  Created by Eduardo on 08/04/24.
//

import SwiftUI

extension View {
    func navigation<D>(_ data: D.Type) -> some View where D : Hashable & View {
        self.navigationDestination(for: data, destination: { $0 })
    }
}


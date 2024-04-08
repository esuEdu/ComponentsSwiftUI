//
//  PreviewEnviroments.swift
//  Components
//
//  Created by Eduardo on 07/04/24.
//

import Foundation
import SwiftUI
import SwiftData

extension Preview {
    func bla(_ view: any View) -> any View{
        let modelContainer: ModelContainer = .previewContainer
        return view
            .swiftDataManagerModifier(modelContainer)
    }
}

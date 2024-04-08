//
//  SwiftDataViewModel.swift
//  Components
//
//  Created by Eduardo on 03/04/24.
//

import Foundation
import SwiftUI
import SwiftData

@Observable class ProfileViewModel {
    
    var modelManager: SwiftDataManager? {
        didSet {
            getData()
        }
    }
    
    var model = ProfileModel()
    
    private func getData() {
        guard let fetchedModel = modelManager?.fetchData() else { return }
        model = fetchedModel
    }
    
    var showIdadePopover: Bool = false
    var variacaoDaIdade = stride(from: 0, through: 120, by: 1).map { $0 }
}


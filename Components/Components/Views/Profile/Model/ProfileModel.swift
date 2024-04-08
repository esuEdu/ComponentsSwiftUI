//
//  SwiftDataModel.swift
//  Components
//
//  Created by Eduardo on 03/04/24.
//

import Foundation
import SwiftData

@Model
class ProfileModel {
    var name: String
    var age: Int
    var gender: Gender
    
    init(name: String = "" , age: Int = 0, gender: Gender = .Male) {
        self.name = name
        self.age = age
        self.gender = .Male
    }
}

enum Gender: Codable {
    case Male
    case Female
}

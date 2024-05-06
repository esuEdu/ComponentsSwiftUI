//
//  CoordinatorError.swift
//  Components
//
//  Created by Eduardo on 09/04/24.
//

import Foundation

enum NavigationError: String {
    case popLast
    case pathEmpty
    case pathDontExist
    
    var string: String {
        switch self {
            case .popLast:
                return "Cannot pop the last element from the path"
            case .pathEmpty:
                return "Cannot pop from an empty path"
            case .pathDontExist:
                return "The specified path does not exist"
        }
    }
}

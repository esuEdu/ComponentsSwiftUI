//
//  Gesture.swift
//  Components
//
//  Created by Eduardo on 23/03/24.
//

import SwiftUI

struct DragGestureComponent {
    
    @State var isDragging: Bool = false
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { _ in self.isDragging = true }
            .onEnded { _ in self.isDragging = false }
    }
}

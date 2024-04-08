//
//  bla.swift
//  Components
//
//  Created by Eduardo on 23/03/24.
//

import Foundation
import SwiftUI


class ControllerViewModel: ObservableObject {
    
    @Published var joystickPosition: CGPoint = .zero
    @Published var joystickLocation: CGPoint = .zero
    @Published var controllerOpacity: Double = 0.1
    private var fixJoystickLocation: CGPoint = .zero
    private var isDraging: Bool = false
    
    var dragJoystick: some Gesture {
        DragGesture()
            .onChanged { [self] value in
                // Calculate the distance from the center of the background circle
                self.controllerOpacity = 0.7
                let dragVector = value.startLocation
                let distance = hypot(dragVector.x, dragVector.y)

                // Calculate the angle
                let angle = atan2(dragVector.y, dragVector.x)
                
                if !isDraging {
                    withAnimation(.easeIn){
                        // Update joystick position based on drag within the circle
                        self.joystickLocation = CGPoint(
                            x: distance * cos(angle),
                            y: distance * sin(angle)
                        )
                    }
                    self.isDraging = true
                }
                
                // Calculate the distance from the center of the background circle
                let joystickDragVector = value.location - CGPoint(x: distance * cos(angle), y: distance * sin(angle))
                let joystickDistance = min(50, hypot(joystickDragVector.x, joystickDragVector.y))
                // Calculate the angle
                let joystickAngle = atan2(joystickDragVector.y, joystickDragVector.x)
                
                // Update joystick position based on drag within the circle
                self.joystickPosition = CGPoint(
                    x: joystickDistance * cos(joystickAngle),
                    y: joystickDistance * sin(joystickAngle)
                )
            }
            .onEnded { _ in
                // Reset joystick position and opacity after drag ends
                withAnimation(.smooth(duration: 0.2)) {
                    self.joystickPosition = .zero
                    self.joystickLocation = self.fixJoystickLocation
                    self.controllerOpacity = 0.1
                }
                self.isDraging = false
            }
    }
    
    func location(_ geometry: GeometryProxy) {
        self.joystickLocation = CGPoint(x: positionX(geometry), y: positionY(geometry))
        self.fixJoystickLocation = CGPoint(x: positionX(geometry), y: positionY(geometry))
    }
    
    func positionX(_ geometry: GeometryProxy) -> CGFloat {
        return geometry.size.width > geometry.size.height ? geometry.size.width * 0.15 : geometry.size.width * 0.15
    }
    
    func positionY(_ geometry: GeometryProxy) -> CGFloat {
        return geometry.size.width > geometry.size.height ? geometry.size.height * 0.80 : geometry.size.height * 0.80
    }
    
}

extension CGPoint {
    static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
}

//
//  JoystickView.swift
//  Components
//
//  Created by Eduardo on 23/03/24.
//

import SwiftUI

struct JoystickView: View {
    @StateObject private var controllerViewModel = ControllerViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background Circle
                Circle()
                    .stroke()
                    .frame(width: 100, height: 100)
                    .position(x: geometry.size.width * 0.0, y: geometry.size.height * 0.0)
                
                // Joystick
                Circle()
                    .fill(Color.red)
                    .frame(width: 50, height: 50)
                    .position(controllerViewModel.joystickPosition)
                    .opacity(controllerViewModel.controllerOpacity)
                    .gesture(controllerViewModel.dragJoystick)
            }
            .onAppear {
                controllerViewModel.location(geometry)
            }
            .position(x: geometry.size.width, y: geometry.size.height)
        }
    }
}


#Preview {
    JoystickView()
}

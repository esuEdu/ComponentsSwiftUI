//
//  Destination.swift
//  Components
//
//  Created by Eduardo on 07/04/24.
//
 
import Foundation
import SwiftUI

enum Destination: View {
    case home
    case profile
    case lavaLamp(Binding<String>)
    case lavaLamp2(Binding<String>)
    case list
    case detail(Int)

    var body: some View {
        switch self {
            case .home:
                HomeView()
            case .profile:
                ProfileView(viewModel: ProfileViewModel())
                    .transition(.scale)
            case .lavaLamp(let text):
                LavaLampView(text: text)
            case .list:
                ListView()
            case .detail(let index):
                DetailView(itemIndex: index)
            case .lavaLamp2(let text):
                LavaLampView(text: text)
        }
    }
}




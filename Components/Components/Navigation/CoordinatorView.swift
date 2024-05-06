//
//  CoordinatorView.swift
//  Physiotherapy
//
//  Created by Eduardo on 16/03/24.
//
 
import SwiftUI
import SwiftData
 
struct CoordinatorView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {

            NavigationRoot(.home)
                .tabItem {
                    Image(systemName: "1.square")
                    Text("Tab 1")
                }
                .tag(0)
            
            NavigationRoot(.profile)
                .tabItem {
                    Image(systemName: "2.square")
                    Text("Tab 2")
                }
                .tag(1)
        }
    }
}

#Preview {
    let modelContainer: ModelContainer = .previewContainer
    return CoordinatorView()
        .swiftDataManagerModifier(modelContainer)
}

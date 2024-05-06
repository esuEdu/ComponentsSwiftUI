//
//  ContentView.swift
//  Components
//
//  Created by Eduardo on 23/03/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(SwiftDataManager.self) private var manager
    
    @Environment(Navigation.self) private var coordinator
    
    @State var profile = ProfileModel()
    
    var body: some View {
        VStack {
            
            Text(profile.name)
            Button(action: {
                coordinator.push(.profile, type: .sheet)
            } ,label: {
                Text("Profile")
            })
            
            Button(action: {
                coordinator.push(.profile, type: .link)
            } ,label: {
                Text("pop")
            })
            
        }
        .padding()
        .navigationTitle("HomeView")
        .onAppear(perform: {
            profile = manager.fetchData()
        })
    }
}


#Preview {
    let modelContainer: ModelContainer = .previewContainer
    
    return NavigationRoot(.home)
            .swiftDataManagerModifier(modelContainer)
}

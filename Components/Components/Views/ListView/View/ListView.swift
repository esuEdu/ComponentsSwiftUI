//
//  ListView.swift
//  Components
//
//  Created by Eduardo on 09/04/24.
//

import SwiftUI

struct ListView: View {
    @Environment(Navigation.self) private var coordinator
    
    var body: some View {
        List {
            ForEach(0..<10) { index in
                
                Button(action: {coordinator.push(.detail(index))}, label: {
                    ListItemView(index: index)
                })
                .foregroundStyle(.primary)
            }
        }
        .navigationBarTitle("List with Description")
    }
}

struct ListItemView: View {
    let index: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Item \(index)")
                    .font(.title)
                Text("Description of Item \(index)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
    }
}

struct DetailView: View {
    let itemIndex: Int
    
    var body: some View {
        VStack {
            Text("Detail View for Item \(itemIndex)")
                .font(.title)
            Text("Detailed description goes here...")
                .font(.body)
                .padding()
        }
        .navigationBarTitle("Detail")
    }
}

#Preview {
    NavigationRoot(.list)
}

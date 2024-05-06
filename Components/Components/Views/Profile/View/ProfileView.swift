//
//  SwiftDataView.swift
//  Components
//
//  Created by Eduardo on 03/04/24.
//

import SwiftUI
import SwiftData

struct ProfileView: View {
    
    @Environment(SwiftDataManager.self) var swiftDataManager
    
    @Environment(Navigation.self) var coordinator
    
    @Bindable var viewModel: ProfileViewModel
    
    @State var text: String = "bbb"
    
    var body: some View {
        Form {
            TextField("Name", text: $viewModel.model.name)
            
            Button {
                viewModel.showIdadePopover.toggle()
            } label: {
                
                HStack {
                    Text("Idade")
                    Spacer()
                    Text("\(viewModel.model.age)")
                        .foregroundStyle(.secondary)
                }
                
            }.popover(isPresented: $viewModel.showIdadePopover) {
                HStack {
                    Picker("", selection: $viewModel.model.age) {
                        ForEach(0..<viewModel.variacaoDaIdade.count, id: \.self) {
                            Text("\(viewModel.variacaoDaIdade[$0])")
                        }
                    }
                    .pickerStyle(.wheel)
                }
                .frame(maxWidth: 150, maxHeight: 120)
                .presentationCompactAdaptation(.popover)
            }
            
            // Segmented picker for gender selection without "Other" option
            Picker("Gender", selection: $viewModel.model.gender) {
                Text("Male").tag(Gender.Male)
                Text("Female").tag(Gender.Female)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Section {
                Button(action: {
                    coordinator.push(.lavaLamp($text), type: .sheet)
                }, label: {
                    Text("Button")
                })
            }
        }
        .onAppear(perform: {
            viewModel.modelManager = swiftDataManager
        })
        .navigationTitle("Profile")
    }
}

#Preview {
    
    let modelContainer: ModelContainer = .previewContainer
    return NavigationRoot(.profile)
        .swiftDataManagerModifier(modelContainer)
}

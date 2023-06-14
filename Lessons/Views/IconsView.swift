//
//  IconsView.swift
//  Lessons
//
//  Created by Muhammed Taha Çağlar on 14.06.2023.
//

import SwiftUI

struct ListBootcamp: View {
    @State private var fruits: [String] = ["List Item 1", "List Item 2", "List Item 3", "List Item 4"]
    @State private var isShowingPopup = false
    @State private var newItem = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: headerView) {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit.capitalized)
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .fontWeight(Font.Weight.bold)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                    .listRowBackground(Color.yellow)
                }.shadow(radius: 10)
            }
            .accentColor(.purple)
            .navigationTitle("List View")
            .navigationBarItems(leading: EditButton(), trailing: addButton)
        }
        .accentColor(.red)
        .overlay(popupContent())
    }
    
    var headerView: some View {
        HStack {
            Text("Editable List")
                .font(.headline)
                .foregroundColor(.purple)
        }
    }
    
    var addButton: some View {
        Button("Add") {
            isShowingPopup = true
        }
    }
    
    func delete(at offsets: IndexSet) {
        fruits.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        fruits.move(fromOffsets: source, toOffset: destination)
    }
    
    func add() {
        fruits.append(newItem)
        newItem = ""
        isShowingPopup = false
    }
    
    @ViewBuilder
    func popupContent() -> some View {
        if isShowingPopup {
            ZStack {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    TextField("Enter item", text: $newItem)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    HStack {
                        Button("Add") {
                            add()
                        }
                        .disabled(newItem.isEmpty)
                        
                        Button("Cancel") {
                            isShowingPopup = false
                        }
                    }
                    .padding()
                }
                .frame(maxWidth: 300)
                .background(Color.white)
                .cornerRadius(10)
                .padding()
            }
        }
    }
}

struct ListBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ListBootcamp()
    }
}



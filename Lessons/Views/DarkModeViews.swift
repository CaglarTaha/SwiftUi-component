//
//  DarkModeViews.swift
//  Lessons
//
//  Created by Muhammed Taha Çağlar on 30.05.2023.
//

import SwiftUI

struct DarkModeView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isDarkMode = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("This color is PRIMARY")
                        .foregroundColor(.primary)
                    Text("This color is SECONDARY")
                        .foregroundColor(.secondary)
                    Text( isDarkMode ?   "Black is never seen in Dark mood": "This color is BLACK")
                        .foregroundColor( isDarkMode ? .gray: .black)
                    Text( isDarkMode ?   "This Color is White": "White is never seen in White mode")
                        .foregroundColor( isDarkMode ? .white: .gray)
                    Text("This color is RED")
                        .foregroundColor(.red)
                  
                    
                    Text("This color is locally adaptive!")
                        .foregroundColor(colorScheme == .light ? .green : .yellow)
                }
                .preferredColorScheme(isDarkMode ? .dark : .light)
            }
            .navigationTitle("Dark Mode Bootcamp")
            .navigationBarItems(trailing: Button(action: {
                isDarkMode.toggle()
            }) {
                Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                    .imageScale(.large)
            })
        }
    }
}

struct DarkModeView_Previews: PreviewProvider {
    static var previews: some View {
        DarkModeView()
    }
}


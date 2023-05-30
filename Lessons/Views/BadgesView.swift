//
//  BadgesView.swift
//  Lessons
//
//  Created by Muhammed Taha Çağlar on 30.05.2023.
//

import SwiftUI

// List
// TabView

struct BadgesBootcamp: View {
    var body: some View {
        List {
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
        }
        TabView {
            Color.red
                .tabItem {
                   Image(systemName: "heart.fill")
                   Text("Hello")
                }
                .badge("NEW")

            Color.green
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }

            Color.blue
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }
        }
    }
}

struct BadgesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BadgesBootcamp()
    }
}

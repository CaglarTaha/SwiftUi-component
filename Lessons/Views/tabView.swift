//
//  tabView.swift
//  Lessons
//
//  Created by Muhammed Taha Çağlar on 18.06.2023.
//

import SwiftUI

struct TabViewS: View {
    
    @State var selectedTab: Int = 0
    
    let İmages: [String] = [
        "nature", "ü", "doga2"
    ]
    
    
    var body: some View {
        TabView {
            ForEach(İmages, id: \.self) { child in
                Image(child)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
            }
        }
        .background(
            Color.gray
        )
        .frame(height: 300)
        .tabViewStyle(PageTabViewStyle())

        TabView(selection: $selectedTab) {
            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)

            Text("BROWSE TAB")
                .tabItem {
                    Image(systemName: "globe")
                    Text("Browse")
                }
                .tag(1)
            Text("PROFILE TAB")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)
        }
        .accentColor(.red)
    }
}

struct TabViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TabViewS()
    }
}

struct HomeView: View {
    
    
    let İmages: [String] = [
        "nature", "ü", "doga2"
    ]
    
    @Binding var selectedTab: Int
    
    var body: some View {
        TabView {
            ForEach(İmages, id: \.self) { child in
                Image(child)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
            }
        }
        .background(
            Color.gray
        )
        .frame(height: 300)
        .tabViewStyle(PageTabViewStyle())
    }
}

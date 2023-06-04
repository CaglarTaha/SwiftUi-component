//
//  Documentation.swift
//  Lessons
//
//  Created by Muhammed Taha Çağlar on 4.06.2023.
//


import SwiftUI



class EnvironmentViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        self.dataArray.append(contentsOf: ["item1", "item2", "item3", "item4 "])
    }
    
    
}

struct EnvironmentObjectsView: View {
    
    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink(
                        destination: DetailView(selectedItem: item),
                        label: {
                            Text(item)
                        })
                    
                }
            }
            .navigationTitle("iOS List To Navigate")
        }
        .environmentObject(viewModel)
    }
}

struct DetailView: View {
    
    let selectedItem: String
    
    var body: some View {
        ZStack {
            // background
            Color.white.ignoresSafeArea()
            
            //foreground
            NavigationLink(
                destination: FinalView(),
                label: {
                    Text(selectedItem)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.black)
                        .cornerRadius(30)
                })
        }
    }
}

struct FinalView: View {
    
    @EnvironmentObject var viewModel: EnvironmentViewModel
    
    var body: some View {
        ZStack {
            // background
            LinearGradient(
                gradient: Gradient(colors: [Color.white]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            // foreground
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.dataArray, id: \.self) { item in
                        Text(item)
                    }
                }
                .foregroundColor(.black)
                .font(.largeTitle)
            }
            
        }
    }
}

struct EnvironmentObjectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectsView()
        //DetailView(selectedItem: "iPhone")
        //FinalView()
    }
}

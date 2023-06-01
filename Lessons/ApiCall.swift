//
//  ApiCall.swift
//  Lessons
//
//  Created by Muhammed Taha Çağlar on 1.06.2023.
//

import SwiftUI

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}

struct ApiCall: View {
    @StateObject private var networkManager = NetworkManager()
    @State private var products: [Product] = []

    var body: some View {
        VStack {
            Button("Fetch Data") {
                networkManager.fetchData { result in
                    switch result {
                    case .success(let fetchedProducts):
                        products = fetchedProducts
                    case .failure(let error):
                        print("API Hatası: \(error.localizedDescription)")
                    }
                }
            }
            Text("Products")
                .font(.system(size: 50))
                .padding(.top)
            Rectangle()
                .frame(width: 200, height: 1, alignment: .bottom)
                           .foregroundColor(Color.gray)
            
            ScrollView(.vertical) {
                VStack(spacing: 10) {
                    ForEach(products) { product in
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: product.thumbnail)) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .padding(0)
                                            .cornerRadius(10)
                                        
                                             
                                    } else {
                                        // Placeholder görsel veya yükleme göstergesi
                                        // Örneğin:
                                        Color.gray
                                            .frame(width: 50, height: 50)
                                    }
                                }
                            ZStack{
                                Rectangle()
                                    .frame(width:  375, height: 100)
                                    .foregroundColor(Color.gray.opacity(0.4))
                                    .shadow(radius: 5)
                                Text(product.title)
                                    .foregroundColor(Color.white)
                                    .font(.largeTitle)
                                    .multilineTextAlignment(.center)
                                    .frame(alignment: Alignment.center)
                            }
                            .padding(0)
                          
                                
                        }
                            
                            
                    }
                }
                .padding(10)
                .shadow(radius: 5)
            }
            
                
               
        }
    }
}

class NetworkManager: ObservableObject {
    func fetchData(completion: @escaping (Result<[Product], Error>) -> Void) {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Response.self, from: data)
                    let products = response.products
                    completion(.success(products))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidURL
}

struct Response: Codable {
    let products: [Product]
}

struct ApiCall_Previews: PreviewProvider {
    static var previews: some View {
        ApiCall()
    }
}


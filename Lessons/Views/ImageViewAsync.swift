//
//  ImageViewAsync.swift
//  Lessons
//
//  Created by Muhammed Taha Çağlar on 30.05.2023.
//

import SwiftUI

struct AsyncImageView: View {
    @State var imageUrl: URL?
    
    var body: some View {
        VStack {
           
            if let url = imageUrl {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let returnedImage):
                        returnedImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350, height: 350)
                            .cornerRadius(20)
                    case .failure:
                        Image(systemName: "questionmark")
                            .font(.headline)
                    @unknown default:
                        Image(systemName: "questionmark")
                            .font(.headline)
                    }
                }
            } else {
                Text("Resim henüz yüklenmedi.")
                    .foregroundColor(.gray)
            }
            Button(action: {
                imageUrl = URL(string: "https://picsum.photos/400?random=\(Int.random(in: 1...1000))")
            }) {
                Text("Resmi Değiştir")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
            
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView()
    }
}

//
//  MaterialBgView.swift
//  Lessons
//
//  Created by Muhammed Taha Çağlar on 30.05.2023.
//

import SwiftUI

struct BackgroundMaterialsView: View {
    var imageUrl = URL(string: "https://img.uhdpaper.com/wallpaper/lion-roar-colorful-digital-art-animal-614@1@k-preview.jpg?dl")
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 50, height: 4)
                    .padding()
                Spacer()
            }
            .frame(height: 300)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .cornerRadius(30)
        }
        .ignoresSafeArea()
        .background(
                   AsyncImage(url: imageUrl) { phase in
                       switch phase {
                       case .empty:
                           ProgressView()
                       case .success(let image):
                           image
                               .resizable()
                               .scaledToFit()
                       case .failure:
                           Image(systemName: "questionmark")
                               .font(.largeTitle)
                       @unknown default:
                           Image(systemName: "questionmark")
                               .font(.largeTitle)
                       }
                   }
               )
       
        
    }
}

struct BackgroundMaterialsView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundMaterialsView()
    }
}

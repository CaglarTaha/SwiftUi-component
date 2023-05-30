//
//  ColorPickerView.swift
//  Lessons
//
//  Created by Muhammed Taha Çağlar on 30.05.2023.
//

import SwiftUI

struct ColorPickerView: View {
    
    @State var backgroundColor: Color = .white
    
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            ColorPicker("Pick a Color",
                        selection: $backgroundColor,
                        supportsOpacity: true)
                .padding()
                .background(Color.black)
                .cornerRadius(10)
                .foregroundColor(.white)
                .font(.headline)
                .padding(50)
        }
        
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView()
    }
}

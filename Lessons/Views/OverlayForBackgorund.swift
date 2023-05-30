//
//  Overlay For Backgorund.swift
//  Lessons
//
//  Created by Muhammed Taha Çağlar on 30.05.2023.
//

import SwiftUI


struct BackgroundAndOverlayView: View {
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .foregroundColor(Color.white)
            .background(
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                    )
                    .frame(width: 100, height: 100)
                    .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 0.5)), radius: 10, x: 0.0, y: 10)
                    .overlay(
                        Circle()
                            .fill(Color.red)
                            .frame(width: 35, height: 35)
                            .overlay(
                                Text("2")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            )
                            .shadow(color: Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 0)), radius: 10, x: 5, y: 5)
                        , alignment: .bottomTrailing)
            )
    }
}

struct BackgroundAndOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundAndOverlayView()
    }
}

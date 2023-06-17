//
//  FacebookView.swift
//  Lessons
//
//  Created by Muhammed Taha Çağlar on 16.06.2023.
//

import SwiftUI

import SwiftUI

struct FacebookView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Image("FacebookLogo")
                .resizable()
                .frame(width: 200, height: 200)
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Email")
                    .font(.headline)
                TextField("Email adresinizi girin", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Password")
                    .font(.headline)
                SecureField("Şifrenizi girin", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                  
                }) {
                    Text("Giriş Yap")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.top, 16)
            }
            .padding()
        }
    }
}

struct FacebookView_Previews: PreviewProvider {
    static var previews: some View {
        FacebookView()
    }
}


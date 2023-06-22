//
//  İnstagramView.swift
//  Lessons
//
//  Created by Muhammed Taha Çağlar on 16.06.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var selectedLanguage = "English"
    let languages = ["English", "Spanish", "French", "German"]
    
    
    
    var UsernameText: String {
        switch selectedLanguage {
        case "Spanish":
            return "Nombre de usuario"
        case "French":
            return "Nom d'utilisateur"
        case "German":
            return "Benutzername"
        default:
            return "Username"
        }
    }

    var PasswordText: String {
        switch selectedLanguage {
        case "Spanish":
            return "Contraseña"
        case "French":
            return "Mot de passe"
        case "German":
            return "Passwort"
        default:
            return "Password"
        }
    }

    var GetHelpText: String {
        switch selectedLanguage {
        case "Spanish":
            return "Obtener ayuda para iniciar sesión"
        case "French":
            return "Obtenir de l'aide pour se connecter"
        case "German":
            return "Hilfe bei der Anmeldung erhalten"
        default:
            return "Get help logging in"
        }
    }

    var OrText: String {
        switch selectedLanguage {
        case "Spanish":
            return "O"
        case "French":
            return "OU"
        case "German":
            return "ODER"
        default:
            return "OR"
        }
    }


    var DontHaveAcountText: String {
        switch selectedLanguage {
        case "Spanish":
            return "¿No tienes una cuenta?"
        case "French":
            return "Vous n'avez pas de compte ?"
        case "German":
            return "Sie haben noch keinen Account?"
        default:
            return "Don't have an account?"
        }
    }
    
    var loginButtonText: String {
        switch selectedLanguage {
        case "Spanish":
            return "Iniciar sesión"
        case "French":
            return "Se connecter"
        case "German":
            return "Anmelden"
        default:
            return "Log In"
        }
    }
    
    var forgotPasswordText: String {
        switch selectedLanguage {
        case "Spanish":
            return "¿Olvidaste tu contraseña?"
        case "French":
            return "Mot de passe oublié ?"
        case "German":
            return "Passwort vergessen?"
        default:
            return "Forgot your password?"
        }
    }
    
    var signUpText: String {
        switch selectedLanguage {
        case "Spanish":
            return "Crear cuenta"
        case "French":
            return "Créer un compte"
        case "German":
            return "Konto erstellen"
        default:
            return "Sign Up"
        }
    }
    
    var body: some View {
        VStack {
            Picker(selection: $selectedLanguage, label: Text("Select Language:")) {
                ForEach(languages, id: \.self) { language in
                    Text(language)
                        .foregroundColor(.gray)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding(.horizontal, 40)
            .foregroundColor(.gray)
            .onChange(of: selectedLanguage) { _ in
                // Dil değiştiğinde yapılacak işlemleri burada gerçekleştirebilirsiniz
                // Örneğin, LocalizationManager gibi bir sınıf kullanarak dil ayarlarını güncelleyebilirsiniz
                // LocalizationManager.shared.setLanguage(selectedLanguage)
            }
            
            Image("Logo-Instagram")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            TextField(UsernameText, text: $username)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
            
            SecureField(PasswordText, text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
            
            Button(action: {
                // Giriş işlemi gerçekleştirme veya başka bir işlem yapma
                print("Username: \(username)")
                print("Password: \(password)")
            }) {
                Text(loginButtonText)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
            
            HStack {
                Text(forgotPasswordText)
                    .foregroundColor(.black)
                    .padding(.top, 8)
                
                Button(action: {
                    // Yardım sayfasına yönlendirme veya başka bir işlem yapma
                }) {
                    Text(GetHelpText)
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding(.top, 8)
                }
            }
            
            HStack {
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 1)
                
                Text(OrText)
                
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 1)
            }
            .padding(.vertical)
            
            Text(DontHaveAcountText)
            
            Button(action: {
                // Kayıt olma işlemine yönlendirme veya başka bir işlem yapma
            }) {
                Text(signUpText)
                    .font(.headline)
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}

struct InstagramView: View {
    var body: some View {
        NavigationView {
            LoginView()
        }
    }
}

struct InstagramView_Previews: PreviewProvider {
    static var previews: some View {
        InstagramView()
    }
}


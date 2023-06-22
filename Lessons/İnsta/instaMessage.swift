//
//  instaMessage.swift
//  Lessons
//
//  Created by Muhammed Taha Çağlar on 22.06.2023.
//

import SwiftUI

struct Message: Identifiable {
    var id = UUID()
    var sender: String
    var message: String
}

struct MessageView: View {
    var message: Message
    var isCurrentUser: Bool
    
    var body: some View {
        HStack {
            if !isCurrentUser {
                Image("FacebookLogo") // Karşı tarafın profil resmi
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(message.sender)
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(message.message)
                        .padding(10)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(16)
                }
                
                Spacer()
            } else {
                Spacer()
                
                Text(message.message)
                    .padding(10)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(16)
            }
        }
    }
}

struct İnstaMessageView: View {
    @State private var newMessage = ""
    @State private var messages: [Message] = [
        Message(sender: "John", message: "Hello!"),
        Message(sender: "Me", message: "Hi there!"),
        Message(sender: "John", message: "How are you?"),
        Message(sender: "Me", message: "I'm good, thanks!"),
        Message(sender: "John", message: "Great!"),
    ]
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {}) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                .padding(.leading)
                
                Spacer()
                Image("FacebookLogo") // Karşı tarafın profil resmi
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text("Jhon")
                    .font(.headline)
                
                Spacer()
                
                HStack{
                    Button(action: {}) {
                        Image(systemName: "video.fill")
                            .font(.title)
                            .foregroundColor(.gray)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "phone.fill")
                            .font(.title)
                            .foregroundColor(.gray)
                    }
                }
            
                
                Spacer()
            }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.horizontal)
            .padding(.bottom, 8)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(messages) { message in
                        MessageView(message: message, isCurrentUser: message.sender == "Me")
                    }
                }
                .padding()
            }
            
            HStack {
                TextField("Mesajınızı girin", text: $newMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(10)
                
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                .padding(10)
            }
            
           
        }
    }
    
    func sendMessage() {
        let message = Message(sender: "Me", message: newMessage)
        messages.append(message)
        newMessage = ""
    }
}



struct İnstaMessageView_Previews: PreviewProvider {
    static var previews: some View {
        İnstaMessageView()
    }
}

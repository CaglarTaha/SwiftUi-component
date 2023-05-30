import SwiftUI

struct AppStorageView: View {
    @AppStorage("name") var currentUserName: String?
    @State private var nameInput: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            if let userName = currentUserName {
                Text(userName)
                    .lineLimit(1)
            } else {
                Text("Add Name here")
                    .foregroundColor(.gray)
            }
            
            TextField("Enter Name", text: $nameInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Save".uppercased()) {
                currentUserName = nameInput
                nameInput = ""
            }
            
            Button("Clear".uppercased()) {
                currentUserName = nil
            }
        }
        .padding()
    }
}

struct AppStorageView_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageView()
    }
}

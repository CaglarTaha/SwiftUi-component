import SwiftUI

struct AlertView: View {
    
    @State var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil

    @State var backgroundColor: Color = Color.yellow
    
    enum MyAlerts {
        case success
        case error
        case deneme
        case start
        
    }
    
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            VStack {
                Button {
                    alertType = .deneme
    
                    showAlert.toggle()
                } label: {
                    Text("Deneme").foregroundColor(Color.white)
                }
                .padding()
                .background(Color(red: 0, green: 0, blue: 0.5))
                .clipShape(Capsule())
               //Button 2
                Button {
                    alertType = .deneme
                    
                    showAlert.toggle()
                } label: {
                    Text("Button 2").foregroundColor(Color.white)
                }
                
                .padding()
                .background(Color(red: 0, green: 0, blue: 0.5))
                .clipShape(Capsule())
                
                
                
                //Button 3
                
                Button {
                    alertType = .deneme
                   
                    showAlert.toggle()
                } label: {
                    Text("Button 3").foregroundColor(Color.white)
                }
                .padding()
                .background(Color(red: 0, green: 0, blue: 0.5))
                .clipShape(Capsule())
                
                Button(action: {
                    alertType = .start
                    
                    showAlert.toggle()
                }) {
                    Text("Button 4")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(20)
                        .shadow(color: .gray, radius: 5, x: 0, y: 2)
                }
                
                Button(action: {
                 
                }) {
                    Text("Button 5")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.pink)
                        .cornerRadius(10)
                }
                Button(action: {
                  
                }) {
                    Text("Button 6")
                        .foregroundColor(.orange)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.orange, lineWidth: 2)
                        )
                }
                
                Button("Erroor"){
                    alertType = .error
              
                    showAlert.toggle()
                    }
                    .padding()
                    .background(Color(red: 0, green: 0, blue: 0.5))
                    .clipShape(Capsule())
                
                Button("Success") {
                    alertType = .success
              
                    showAlert.toggle()
                }
            }
            .alert(isPresented: $showAlert, content: {
                getAlert()
            })
        }
    }
    
    func getAlert() -> Alert {
        switch alertType {
        case.start :
            return Alert(title: Text("start"))
        case.deneme :
            return Alert(title: Text("Deneme"))
        case .error:
            return Alert(title: Text("There was an error!"))
        case .success:
            return Alert(title: Text("This was a success!"), message: nil, dismissButton: .default(Text("OK"), action: {
                backgroundColor = .green
            }))
        default:
            return Alert(title: Text("ERROR"))
        }
        
//
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}

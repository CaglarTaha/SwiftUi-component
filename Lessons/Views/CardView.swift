import SwiftUI

struct ContentViews: View {
    var body: some View {
        ScrollView {
            VStack {
                
                CardView(imageName: "nature",title: "Doga Resmi" ,text: "Deneme")
                CardView(imageName: "ü",title: "Doga Resmi" ,text: "Deneme")
                CardView(imageName: "doga2",title: "Doga Resmi" ,text: "Deneme")
                CardView(imageName: "nature",title: "Doga Resmi" ,text: "Deneme")
            }
            .padding()
        }
    }
}

struct CardView: View {
    var imageName: String
    var title : String
    var text: String
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10) {
                Spacer()
                
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
               
                
                Text(text)
                    .foregroundColor(.black)
                        .padding(7)
                        .shadow(radius: 20)
                        .cornerRadius(30)
                        .background(.white).opacity(0.9)
                    
                    
            }
            .padding()
            
            HStack {
                Spacer()
                
                HStack {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                    
                    Image(systemName: "ellipsis")
                }
                .padding()
                .background(Color.white.opacity(0.5))
                .cornerRadius(10)
            }
            .padding()
            
        }

        .cornerRadius(10)
        .shadow(radius: 4)
    }
}

struct ContentViews_Previews: PreviewProvider {
    static var previews: some View {
        ContentViews()
    }
}

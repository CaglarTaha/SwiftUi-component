//
//  GridView.swift
//  Lessons
//
//  Created by Muhammed Taha Çağlar on 8.06.2023.
//

import SwiftUI

struct GridView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 3, alignment: nil),
        GridItem(.flexible(), spacing: 3, alignment: nil),
        
    ]
    
    var body: some View {
        ScrollView {
         
                
                Text("Grid System")
                .foregroundColor(.black)
                .font(.system(size: 40))
                .fontWeight(Font.Weight.bold)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
     
            
            
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 10,
                pinnedViews: [.sectionHeaders],
                content: {
                    Section(header:
                                ZStack{
                        Rectangle()
                            .fill(Color.white)
                            .frame(height: 50)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                        Text("First Grid Menu")
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                        .fontWeight(Font.Weight.heavy)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                    }
                                
                    ){
                        ForEach(0..<10) { index in
                            
                            ZStack{
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(height: 150)
                                    .shadow(radius: 20)
                                    .cornerRadius(10)
                                Text(String(index))
                                    
                            }.shadow(radius: 10)
                        }
                    }
                    Spacer()
                    Section(header:
                                ZStack{
                        Rectangle()
                            .fill(Color.black)
                            .frame(height: 50)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                        Text("Second Grid Menu")
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .fontWeight(Font.Weight.heavy)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                    }
                    ) {
                        ForEach(0..<20) { index in
                          
                            HStack{
                                ZStack{
                                    Rectangle()
                                        .fill(Color.green)
                                        .frame(height: 150)
                                        .shadow(radius: 10)
                                        .cornerRadius(10)
                                    Text(String(index))
                                        
                                }
                            }
                            
                          
                        }
                    }
                    
            })
        }.padding()
    }
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}

//
//  DenemView.swift
//  Lessons
//
//  Created by Muhammed Taha Çağlar on 10.06.2023.
//

import SwiftUI



struct PieSliceData {
    var startAngle: Angle
    var endAngle: Angle
    var color: Color
    var title : String
}


struct mainView : View{
    
    var body: some View{
        VStack{
            Text("PieChart").font(.largeTitle)
        ZStack{
            PieSliceView(pieSliceData: PieSliceData.init(startAngle: Angle.degrees(0), endAngle: Angle.degrees(270), color: Color.purple,title: "deneme")).shadow(radius: 30)
                
            PieSliceView(pieSliceData: PieSliceData.init(startAngle: Angle.degrees(0), endAngle: Angle.degrees(200), color: Color.red,title: "deneme")).shadow(radius: 10)
            PieSliceView(pieSliceData: PieSliceData.init(startAngle: Angle.degrees(-90), endAngle: Angle.degrees(0), color: Color.blue,title: "deneme") ).shadow(radius: 10)
        }.padding()
        
        }
    }
}


struct PieSliceView: View {
    var pieSliceData: PieSliceData
    
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                Path { path in
                    let width: CGFloat = min(geometry.size.width, geometry.size.height)
                    let height = width
                    
                    let center = CGPoint(x: width * 0.5, y: height * 0.5)
                    
                    path.move(to: center)
                    
                    path.addArc(
                        center: center,
                        radius: width * 0.5,
                        startAngle: Angle(degrees: -90.0) + pieSliceData.startAngle,
                        endAngle: Angle(degrees: -90.0) + pieSliceData.endAngle,
                        clockwise: false)
                    
                    
                }
                .fill(pieSliceData.color)
                .shadow(radius: 10)
                
            }
            .aspectRatio(1, contentMode: .fit)
            
          
            }
                
        }
        
        }
       


struct DenemView_Previews: PreviewProvider {
    static var previews: some View {
     mainView()
    }
}

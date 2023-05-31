//
//  ClockView.swift
//  Lessons
//
//  Created by Muhammed Taha Çağlar on 31.05.2023.
//

import SwiftUI

struct ClockView: View {
    @State private var currentTime = Date()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 300, height: 300)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
            ZStack{
                Text(timeFormatter.string(from: currentTime))
                    .font(.system(size: 48))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.bottom, 10)
                ForEach(0..<60) { index in
                                   Rectangle()
                                       .fill(index % 5 == 0 ? Color.black : Color.gray)
                                       .frame(width: 2, height: index % 5 == 0 ? 15 : 5)
                                       .offset(y: -140)
                                       .rotationEffect(Angle.degrees(Double(index) * 6))
                               }

            }
            }
            VStack {
                Spacer()
                
                
        }
        .onReceive(timer) { input in
            currentTime = input
        }
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}

//
//  DarkPickerView.swift
//  Lessons
//
//  Created by Muhammed Taha Çağlar on 31.05.2023.
//

import SwiftUI

struct DatePickerView: View {
    
    @State var selectedDate: Date = Date()
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date()
    let endingDate: Date = Date()
    
    var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return formatter
    }
    
    var monthFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter
    }
    var yeaFormater : DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY"
        return formatter
    }
    var body: some View {
        VStack {
            Spacer()
            ClockView()
            Text("SELECTED DATE IS")
                .font(.system(size: 30))
                .padding()
            
            HStack{ Text(dayFormatter.string(from: selectedDate)  ) // Sadece günü gösterir
                    .font(.title)
                Text( monthFormatter.string(from: selectedDate)) // Sadece ayı gösterir
                    .font(.title)
                
                
                Text(yeaFormater.string(from: selectedDate)) // Sadece ayı gösterir
                    .font(.title)
                
            }
            
            
            
            DatePicker("Select a date", selection: $selectedDate, in: startingDate...endingDate, displayedComponents: [.date])
                .tint(Color.red)
                .datePickerStyle(CompactDatePickerStyle())
                .padding()
        }
        
        
        
        
        
    }
}


struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}

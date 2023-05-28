//
//  AlarmView.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/16.
//


import SwiftUI

struct AlarmCardView : View {
    @ObservedObject var alarmData: AlarmData
//    @State private var isEditing: Bool
    let alarm: Alarm
    
    var alarmIndex: Int? {
        alarmData.alarms.firstIndex(where: { $0.id == alarm.id })
    }
    
    let timeFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm"
        return formatter
    }()
    
    let meridiemFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "a"
        return formatter
    }()
    
    var body: some View {
        if let index = alarmIndex {
          Toggle(isOn: $alarmData.alarms[index].isActive) {
            // 뷰 내용
              VStack(alignment: .leading, spacing: 0) {
                  HStack(alignment: .firstTextBaseline, spacing: -2.0){
                      Text("\(self.alarm.date, formatter: self.meridiemFormat)")
                          .font(.system(size: 30))
                      
                      Text("\(self.alarm.date, formatter: self.timeFormat)")
                          .font(.system(size: 50))
                          .fontWeight(.light)
                  }
                  
                  HStack(spacing: 0) {
                      Text(self.alarm.label)
                          .font(.subheadline)
                      
                      if self.alarm.repeats != "" {
                          Text(", \(self.alarm.repeats)")
                              .font(.subheadline)
                      }
                  }
              }
          }//toggle
          .tint(Color.green)
        } else {
          Text("알람을 찾을 수 없음")
        }

    }
}


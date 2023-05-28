//
//  AlarmView.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/16.
//


import SwiftUI

struct AlarmCardView : View {
    @ObservedObject var alarmData: AlarmData
    @Environment(\.editMode) var editMode
//    var isEditing: Bool
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
            if editMode?.wrappedValue.isEditing == true {
                       // Editing 모드일 때의 뷰
                       NavigationLink(destination: EditModalView(alarmIndex: alarmIndex!)) {
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
                       }
                   } else {
                       // 일반 모드일 때의 뷰
                       Toggle(isOn: $alarmData.alarms[index].isActive) {
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
                       }
                       .tint(Color.green)
                   }
        } else {
          Text("알람을 찾을 수 없음")
        }

    }
}


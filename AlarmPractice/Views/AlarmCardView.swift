//
//  AlarmView.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/16.
//

import SwiftUI
import CoreData

struct AlarmCardView : View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.editMode) var editMode
    @FetchRequest(
        entity: Alarm.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Alarm.date, ascending: true)]) var alarms: FetchedResults<Alarm>
    var alarm: FetchedResults<Alarm>.Element
    @State var isOn: Bool = false
    
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
        if let date = alarm.date {
            
            if editMode?.wrappedValue.isEditing == true {
                // Editing 모드일 때의 뷰
                //                       NavigationLink(destination: EditModalView(alarmIndex: alarmIndex!)) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack(alignment: .firstTextBaseline, spacing: -2.0){
                        Text("\(date, formatter: self.meridiemFormat)")
                            .font(.system(size: 30))
                        
                        Text("\(date, formatter: self.timeFormat)")
                            .font(.system(size: 50))
                            .fontWeight(.light)
                    }
                    
                    HStack(spacing: 0) {
                        Text(alarm.label!)
                            .font(.subheadline)
                        
                        if alarm.repeatDay?.repeats != "" {
                            Text(", \(alarm.repeatDay!.repeats)")
                                .font(.subheadline)
                        }
                    }
                }
                //                       }
            } else {
                // 일반 모드일 때의 뷰
                Toggle(isOn: $isOn ) {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(alignment: .firstTextBaseline, spacing: -2.0){
                            Text("\(date, formatter: self.meridiemFormat)")
                                .font(.system(size: 30))
                            
                            Text("\(date, formatter: self.timeFormat)")
                                .font(.system(size: 50))
                                .fontWeight(.light)
                        }
                        
                        HStack(spacing: 0) {
                            Text(alarm.label!)
                                .font(.subheadline)
                            
                            if alarm.repeatDay?.repeats != "" {
                                Text(", \(alarm.repeatDay!.repeats)")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                .onAppear() {
                    isOn = alarm.isSnoozed
                }
                .onChange(of: alarm.isSnoozed) { newValue in
                    isOn = newValue
                    alarm.isSnoozed = isOn
                }
//                .onChange(of: isOn) { newValue in
//                    alarm.isSnoozed = isOn
//                                }
                .tint(Color.green)
            }
        }
    }
}


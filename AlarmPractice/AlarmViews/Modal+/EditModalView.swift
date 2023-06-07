//
//  EditModalView.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/23.
//

import SwiftUI

struct EditModalView: View {
    
    @State private var date = Date()
    @State var repeatDay: [RepeatDay] = []
    @State var isSnoozed: Bool = true
    @State var label: String = "알람"
    @State var isActive: Bool = true
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var managedObjectContext
    var alarm: FetchedResults<Alarm>.Element? = nil
    @State var isFirst: Bool = true
    
    var body: some View {
        NavigationView {
            VStack{
                DatePicker("", selection: $date,
                           displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .navigationTitle("알람 편집")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button {
                            updateAlarmListener()
                        } label: {
                            Text("저장")
                                .bold()
                                .foregroundColor(.orange)
                        }
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Button("취소", role: .cancel) {
                            self.dismiss()
                        }
                        .foregroundColor(.orange)
                    }
                }//toolbar
                List {
                    Section{
                        AlarmAddRepeatCellView(repeatDay: $repeatDay)
                        AlarmAddLabelCellView(label: $label)
                        AlarmAddSoundCellView()
                        AlarmAddSnoozeCellView(isSnoozed: $isSnoozed)
                    }
                    Section{
                        Button {
                            deleteAlarmListener()
                        } label: {
                            HStack {
                                Spacer()
                                Text("알람 삭제")
                                    .foregroundColor(.red)
                                Spacer()
                            }
                        }
                    }
                }
                .listStyle(.insetGrouped)
                .scrollDisabled(true)
            }
            .onAppear() {
                if let alarm = alarm {
                    date = alarm.date!
                    label = alarm.label!
                    isActive = alarm.isActive
                    isSnoozed = alarm.isSnoozed
                    if isFirst {
                        let enumValues = alarm.repeatDay?.compactMap { RepeatDay( rawValue: $0 ) }
                        repeatDay = enumValues!
                        self.isFirst = false
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }//body
    
    func updateAlarmListener() {
        let repeatArr = repeatDay.map {$0.rawValue}
        DataController.shared.updateAlarm(alarm: alarm!, date: date, label: label, repeatDay: repeatArr, isActive: isActive, isSnoozed: isSnoozed, context: managedObjectContext)
        dismiss()
    }
    
    func deleteAlarmListener() {
        DataController.shared.removeAlarm(alarm: alarm!, context: managedObjectContext)
        dismiss()
    }
}


//struct EditModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditModalView()
//    }
//}

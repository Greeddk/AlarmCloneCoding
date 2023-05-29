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

//    var alarmData: AlarmData
//    var alarmIndex: Int
//
//    private var alarm: Alarm {
//        globalAlarmData.alarms[alarmIndex]
//        }
    
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
                            self.dismiss()
                        } label: {
                            Text("저장")
                                .bold()
                        }
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Button("취소", role: .cancel) {
                            self.dismiss()
                        }
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
            .onAppear {
//                date = globalAlarmData.alarms[alarmIndex].date;
//                repeatDay = globalAlarmData.alarms[alarmIndex].repeatDay.map { RepeatDay(rawValue: $0)! };
//                label = globalAlarmData.alarms[alarmIndex].label
            }
        }
        .navigationBarBackButtonHidden(true)
    }//body
    
    func updateAlarmListener() {
        DataController.shared.updateAlarm(alarm: alarm!, date: date, label: label, repeatDay: repeatDay, isActive: isActive, isSnoozed: isSnoozed, context: managedObjectContext)
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

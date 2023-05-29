//
//  ModalView.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/11.
//

import SwiftUI

struct ModalView: View {
    
    @State private var date = Date()
    @State var repeatDay: [RepeatDay] = []
    @State var isSnoozed: Bool = true
    @State var label: String = "알람"
    @State var isActive: Bool = true
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.managedObjectContext) var managedObjectContext
    var alarm: FetchedResults<Alarm>.Element? = nil
    
    var body: some View {
        NavigationView {
            VStack{
                DatePicker("Please enter a date", selection: $date,
                           displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .navigationTitle("알람 추가")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button {
                            newAlarmListener()
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
                    AlarmAddRepeatCellView(repeatDay: $repeatDay)
                    AlarmAddLabelCellView(label: $label)
                    AlarmAddSoundCellView()
                    AlarmAddSnoozeCellView(isSnoozed: $isSnoozed)
                }
                .listStyle(.insetGrouped)
                .scrollDisabled(true) 
            }
        }
        
    }//body
    
    func newAlarmListener() {
        DataController.shared.createAlarm(date: date, label: label, repeatDay: repeatDay, isActive: isActive, isSnoozed: isSnoozed, context: managedObjectContext)
        dismiss()
    }
}


//struct ModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        ModalView()
//    }
//}

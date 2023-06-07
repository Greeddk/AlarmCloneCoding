//
//  TimerView.swift
//  AlarmPractice
//
//  Created by Greed on 2023/06/07.
//

import SwiftUI

struct TimerView: View {
    @State var date = Date()
    var body: some View {
        VStack {
            DatePicker("", selection: $date, displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
            .labelsHidden()
            
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

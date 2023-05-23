//
//  AlarmData.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/16.
//

import Combine
import SwiftUI

class AlarmData: ObservableObject {
    @Published var alarms = Alarm.arr
    
    func remove(at index: Int) {
        alarms.remove(at: index)
    }
}

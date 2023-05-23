//
//  Alarm.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/14.
//
import SwiftUI

struct Alarm: Identifiable {
    let id: UUID
    var date: Date
    var label: String
    var repeatDay: [Int]
    var isActive: Bool
    var isSnooze: Bool
    
    var repeats: String {
        guard repeatDay.count > 0 else { return "" }
        return repeatDay.repeats
    }
    
    init(id: UUID = UUID(), date: Date, label: String, repeatDay: [RepeatDay], isActive: Bool, isSnooze: Bool) {
        self.id = id
        self.date = date
        self.label = label
        self.repeatDay = repeatDay.map { $0.rawValue }
        self.isActive = isActive
        self.isSnooze = isSnooze
    }
    
//    static var defaultAlarm: [Alarm] {
//        [
//            Alarm(id: UUID(), date: Date().addingTimeInterval(-1000), label: "Alarm", repeatDay: [.sunday], isActive: true, isSnooze: true)
//        ]
//    }
}

extension Alarm {
    static var arr: [Alarm] = []
}

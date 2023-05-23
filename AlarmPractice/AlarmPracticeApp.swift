//
//  AlarmPracticeApp.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/08.
//

import SwiftUI

@main
struct AlarmPracticeApp: App {
    @StateObject private var alarmData = AlarmData() // AlarmData 객체 생성
    
    var body: some Scene {
        WindowGroup {
            MyTabView()
                .environmentObject(alarmData) // AlarmData 객체 주입
        }
    }
}

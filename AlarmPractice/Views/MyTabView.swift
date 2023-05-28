//
//  TabView.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/09.
//

import SwiftUI

struct MyTabView: View {
    @StateObject private var alarmData = AlarmData() // 공통의 AlarmData 객체 생성
    var body: some View {
        
        ZStack {
//            Color.black
//                .edgesIgnoringSafeArea(.all)
            
            TabView {
                MyView(title: "세계 시계")
                    .tabItem{
                        Image(systemName: "globe")
                        Text("세계 시계")
                    }
                    .tag(0)
                AlarmView()
                    .environmentObject(alarmData) // 공통의 AlarmData 객체 주입
                    .tabItem{
                        Image(systemName: "alarm.fill")
                        Text("알람")
                    }
                    .tag(1)
                StopWatchView()
                    .tabItem{
                        Image(systemName: "stopwatch.fill")
                        Text("스톱워치")
                    }
                    .tag(2)
                MyView(title: "타이머")
                    .tabItem{
                        Image(systemName: "timer")
                        Text("타이머")
                    }
                    .tag(3)
            }
            .onAppear() {
//                UITabBar.appearance().backgroundColor = .black
                UITabBar.appearance().unselectedItemTintColor = .lightGray
            }
            //accentcolor은 이제 없어질 예정 tint로 쓰자
            .tint(.orange)
        }
        .environmentObject(alarmData) // 공통의 AlarmData 객체 주입
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
            .environmentObject(AlarmData())
    }
}

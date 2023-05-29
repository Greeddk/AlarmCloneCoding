//
//  AlarmPracticeApp.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/08.
//

import SwiftUI

@main
struct AlarmPracticeApp: App {
    let dataController = DataController.shared
    
    var body: some Scene {
        WindowGroup {
            MyTabView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}

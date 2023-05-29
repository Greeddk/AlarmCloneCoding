//
//  DataController.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/28.
//

import Foundation
import CoreData
import SwiftUI

class DataController: ObservableObject {
    static let shared = DataController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Alarm")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    func saveContext(context: NSManagedObjectContext) {
        //        let context = container.viewContext // container의 viewContext에 접근해서 database에 접근
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }//saveContext
    
    func createAlarm(date: Date, label: String, repeatDay: [RepeatDay], isActive: Bool, isSnoozed: Bool, context: NSManagedObjectContext) {
        let newAlarm = Alarm(context: context)
        newAlarm.id = UUID()
        newAlarm.date = date
        newAlarm.label = label
        newAlarm.repeatDay = repeatDay
        newAlarm.isActive = isActive
        newAlarm.isSnoozed = isSnoozed
        
        saveContext(context: context)
    }
    
    func updateAlarm(alarm: Alarm, date: Date, label: String, repeatDay: [RepeatDay], isActive: Bool, isSnoozed: Bool, context: NSManagedObjectContext) {
        alarm.date = date
        alarm.label = label
        alarm.repeatDay = repeatDay
        alarm.isActive = isActive
        alarm.isSnoozed = isSnoozed
        
        saveContext(context: context)
    }
    
    func removeAlarm(alarm: Alarm, context: NSManagedObjectContext) {
        context.delete(alarm)
        saveContext(context: context)
    }
    
    
}


//
//  DataController.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/28.
//

import Foundation
import CoreData

class DataController: ObservableObject {
   static let shared = DataController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "AlarmArray")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    func saveContext() {
        let context = container.viewContext // container의 viewContext에 접근해서 database에 접근
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }//saveContext
    
    func creatAlarm() {
        
    }
    
    func removeAlarm(at index: Int) {
//        alarms.remove(at: index)
    }
    
    
}


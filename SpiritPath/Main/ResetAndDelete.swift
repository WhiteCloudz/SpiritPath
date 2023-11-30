//
//  FactoryReset.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 11/29/23.
//
import UIKit
import CoreData

extension UIViewController {
    
    
  func deleteZikirAndRoutineData(){
        deleteAllZikirCoreData()
        deleteAllUserDataWithZikirPattern()
        deleteRemindUserData()
    }
    
  func deleteLibraryData(){
        deleteAllLibraryCoreData()
        deleteAllUserDataWithBookPattern()
    }
    
   func deleteAllData(){
        deleteAllZikirCoreData()
        deleteAllLibraryCoreData()
        deleteRemindUserData()
        deleteAllUserDataWithZikirPattern()
        deleteAllUserDataWithBookPattern()
    }
    
    
    
    
    func deleteAllZikirCoreData() {
        let entitiesToDelete: [(name: String, fetchRequest: NSFetchRequest<NSFetchRequestResult>)] = [
            ("RoutineData", RoutineData.fetchRequest()),
            ("DataOfWeek", DataOfWeek.fetchRequest()),
            ("SwitchData", SwitchData.fetchRequest())
        ]
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        for (_, data) in entitiesToDelete.enumerated() {
            do {
                let existingEntities = try context.fetch(data.fetchRequest)
                
                if existingEntities.isEmpty {
                    print("\(data.name) bulunamadı.")
                } else {
                    for entity in existingEntities {
                        context.delete(entity as! NSManagedObject)
                        print("\(data.name) silindi.")
                    }
                }
            } catch {
                print("Error while deleting \(data.name): \(error.localizedDescription)")
            }
        }
    }
    
    
    func deleteAllLibraryCoreData() {
        let entitiesToDelete: [(name: String, fetchRequest: NSFetchRequest<NSFetchRequestResult>)] = [
            ("DataOfLibrary", DataOfLibrary.fetchRequest()),
            ("Bookmarks", Bookmarks.fetchRequest())
        ]
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        for (_, data) in entitiesToDelete.enumerated() {
            do {
                let existingEntities = try context.fetch(data.fetchRequest)
                
                if existingEntities.isEmpty {
                    print("\(data.name) bulunamadı.")
                } else {
                    for entity in existingEntities {
                        context.delete(entity as! NSManagedObject)
                        print("\(data.name) silindi.")
                    }
                }
            } catch {
                print("Error while deleting \(data.name): \(error.localizedDescription)")
            }
        }
    }
    
    func deleteRemindUserData() {
        let userDefaultsKeysToDelete = ["LastShownReminderDate"]
        let userDefaults = UserDefaults.standard
        
        for key in userDefaultsKeysToDelete {
            userDefaults.removeObject(forKey: key)
            print("\(key) silindi.")
        }
    
    }

    func deleteAllUserDataWithZikirPattern() {
        let userDefaults = UserDefaults.standard
        let dictionary = userDefaults.dictionaryRepresentation()
        
        for (key, _) in dictionary {
            if key.hasPrefix("zikir_") {
                userDefaults.removeObject(forKey: key)
                print("\(key) silindi.")
            }
        }
    }

    func deleteAllUserDataWithBookPattern() {
        let userDefaults = UserDefaults.standard
        let dictionary = userDefaults.dictionaryRepresentation()
        
        for (key, _) in dictionary {
            if key.hasPrefix("book_") {
                userDefaults.removeObject(forKey: key)
                print("\(key) silindi.")
            }
        }
    }
    
}

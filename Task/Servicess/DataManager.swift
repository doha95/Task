//
//  DataManager.swift
//  Task
//
//  Created by Doha Tubaileh on 19/5/2021.
//

import Foundation
import UIKit
import CoreData

open class DataManager: NSObject {
    
    public static let sharedInstance = DataManager()
    
    private override init() {}
    
    /**
     Get the app context
     
     - Returns: `NSManagedObjectContext`.
     */
    private func getContext() -> NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return appDelegate.persistentContainer.viewContext
    }
    
    /**
     Save the preson data into database

     - Parameter user: The person obj needed to be saved.
     - Returns: a managerObject containing the `user` data `NSManagedObject`.
     */
    func save(user: Person) -> NSManagedObject? {
        guard let managedContext = getContext() else { return nil }
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        person.setValue(user.id, forKeyPath: "id")
        person.setValue(user.userName, forKeyPath: "userName")
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Failed to save session data! \(error)")
        }
        return person
    }
    
    /**
     Retrieve the data from the databse as an array of `NSManagedObject`
     */
    func retrievePersons(completion: @escaping ([NSManagedObject]) -> Void ){
        guard let managedContext = getContext() else { return  }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do {
            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            completion(result)
        } catch let error as NSError {
            print("Retrieving user failed. \(error): \(error.userInfo)")
            return
        }
    }
    
    
}

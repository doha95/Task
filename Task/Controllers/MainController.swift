//
//  ViewController.swift
//  Task
//
//  Created by Doha Tubaileh on 19/5/2021.
//

import UIKit
import Alamofire
import CoreData

let URL = "https://api.github.com/users?since=0"
let URL_DETAIL = "https://api.github.com/users/"

class MainController: UITableViewController {
    
    var items: [NSManagedObject] = []
    var selectedName : String?
    let dataManager = DataManager.sharedInstance
    let networkingManager = NetworkingService.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataManager.retrievePersons { [unowned self] (savedData) in
            if savedData.count > 0 {
                self.items = savedData
            } else {
                networkingManager.urlRequestPerson { [unowned self] (persons) in
                    for item in persons {
                        if let savedManagedObj = self.dataManager.save(user: item) {
                            items.append(savedManagedObj)
                        }
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        networkingManager.urlRequestPerson { [unowned self] (persons) in
            for item in persons {
                _ = self.dataManager.save(user: item)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.value(forKeyPath: "userName") as? String
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedName = items[indexPath.row].value(forKeyPath: "userName") as? String
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? ProfileController else { return }
        destinationVC.userName = selectedName
    }
    
}




//
//  ViewController.swift
//  Todoey
//
//  Created by Andrei Giuglea on 30/03/2019.
//  Copyright © 2019 Andrei Giuglea. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController  {

    
    var itemArray = ["Mike","Kiddo","Run for your life"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell" , for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
        
    }
    
    //MARK: Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(tableView.cellForRow(at: indexPath)?.textLabel?.text!)
        
       
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
         tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: Add new items
    
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController.init(title: "Add N ew Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction.init(title: "Item", style: .default) { (action) in
           // print("Succes!")
            self.itemArray.append(textField.text! ?? "New Item" )
            self.tableView.reloadData()
        }
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
            //self.itemArray.append(alertTextField.text!)
        }
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
}


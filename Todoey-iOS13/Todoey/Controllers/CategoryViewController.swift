//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Jaime Escobar on 07/05/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class CategoryViewController: SwipeTableViewController {
    
    var realm = try! Realm()

    var categoryArray: Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let navBar = navigationController?.navigationBar else {
            fatalError("NavigationBar doesn't exist")
        }
        let backColor = UIColor(hexString: "0A84FF")
        navBar.backgroundColor = backColor
        navBar.barTintColor = backColor
    }
    
    // MARK: - TableView DataSource func
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //In order to use the superclass cell on SwipeTableViewController
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        cell.textLabel?.text = categoryArray?[indexPath.row].name ?? "No categories added yet"
        if let colorString = categoryArray?[indexPath.row].color{
            if let color = UIColor(hexString: colorString){
                cell.backgroundColor = color
                cell.textLabel?.textColor = ContrastColorOf(color, returnFlat: true)
            }
        }
        
        
        return cell
    }
    
    // MARK: - TableView Delegate func
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        if let indexPath = tableView.indexPathForSelectedRow{
            destinationVC.selectedCategory = categoryArray?[indexPath.row]
        }
    }
    
    // MARK: - Add button action
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add Category"
        }
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            if let text = alert.textFields![0].text{
                if text.count > 0 {
                    let newCategory = Category()
                    newCategory.name = text
                    newCategory.color = UIColor.randomFlat().hexValue()
                    self.save(category: newCategory)
                }
            }
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    // MARK: - Manipulates data
    
    func save(category: Category) {
        do{
            try realm.write{
                realm.add(category)
            }
        }catch{
            print(error)
        }
        self.tableView.reloadData()
    }
    
    func loadData() {
        categoryArray = realm.objects(Category.self)
        self.tableView.reloadData()
    }
    
    override func updateModel(at indexPath: IndexPath) {
        if let category = self.categoryArray?[indexPath.row]{
            do{
                try self.realm.write{
                    self.realm.delete(category)
                }
            }catch{
                print(error)
            }
        }
    }
    
}

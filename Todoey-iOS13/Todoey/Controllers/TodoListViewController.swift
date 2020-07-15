//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class TodoListViewController: SwipeTableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var todoItems: Results<Item>?
    let realm = try! Realm()
    var selectedCategory: Category? {
        didSet{
            loadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let colorHex = selectedCategory?.color{
            title = selectedCategory!.name
            guard let navBar = navigationController?.navigationBar else {
                fatalError("NavigationBar doesn't exist")
            }
            let categoryColor = UIColor(hexString: colorHex)
            navBar.backgroundColor = categoryColor
            navBar.barTintColor = categoryColor
            navBar.tintColor = ContrastColorOf(categoryColor!, returnFlat: true)
            navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : ContrastColorOf(categoryColor!, returnFlat: true)]
            navBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : ContrastColorOf(categoryColor!, returnFlat: true)]
            searchBar.barTintColor = categoryColor
        }
    }
    
    // MARK - TableView DataSource func
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        if let item = todoItems?[indexPath.row]{
            cell.textLabel?.text = item.name
            cell.accessoryType = item.done ? .checkmark : .none
            if let categoryColor = UIColor(hexString: self.selectedCategory!.color){
                if let color = categoryColor.darken(byPercentage: CGFloat(indexPath.row)/CGFloat(todoItems!.count)) {
                    cell.backgroundColor = color
                    cell.textLabel?.textColor = ContrastColorOf(color, returnFlat: true)
                }
            }
            
        }else{
            cell.textLabel?.text = "No items added yet"
        }
        return cell
    }
    
    // MARK - TableView Delegate func
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = todoItems?[indexPath.row]{
            do{
                try realm.write{
                    item.done = !item.done
                }
            }catch{
                print(error)
            }
        }
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK - Add Item func
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Item", message: "", preferredStyle: .alert)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add new item"
        }
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            if let text = alert.textFields![0].text{
                if let currentCategory = self.selectedCategory {
                    if text.count > 0 {
                        do{
                            try self.realm.write{
                                let newItem = Item()
                                newItem.name = text
                                currentCategory.items.append(newItem)
                            }
                        }catch{
                            print(error)
                        }
                    }
                }
            }
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    // MARK - Manipulates data
    
    
    func loadData() {
        todoItems = selectedCategory?.items.sorted(byKeyPath: "name", ascending: true)
        self.tableView.reloadData()
    }
    
    override func updateModel(at indexPath: IndexPath) {
        if let item = todoItems?[indexPath.row]{
            do{
                try self.realm.write{
                    self.realm.delete(item)
                }
            }catch{
                print(error)
            }
        }
    }
    
}

// MARK: - Search bar methods

extension TodoListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        todoItems = todoItems?.filter("name CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: true)
        tableView.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0{
            loadData()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}

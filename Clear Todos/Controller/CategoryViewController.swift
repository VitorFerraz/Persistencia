//
//  CategoryViewController.swift
//  Clear Todos
//
//  Created by Vitor Ferraz Varela on 03/10/21.
//

import UIKit

class CategoryViewController: UITableViewController {
    var categories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDynamicSizingTableView()
        setupRegisterNibCell()
    }
    
    fileprivate func setupDynamicSizingTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    fileprivate func setupRegisterNibCell() {
        let cellNib = UINib(nibName: String(describing: TodoTableViewCell.self), bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier:
                            String(describing: TodoTableViewCell.self))
    }
    
    //MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = super.tableView(tableView, cellForRowAt: indexPath)
//
//        if let category = categories?[indexPath.row] {
//
//            cell.textLabel?.text = category.name
//
//            guard let categoryColour = UIColor(hexString: category.colour) else {fatalError()}
//
//            cell.backgroundColor = categoryColour
//            cell.textLabel?.textColor = ContrastColorOf(categoryColour, returnFlat: true)
//
//        }
        return UITableViewCell()
        
        
    }

    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationVC = segue.destination as! TodoListViewController
//
//        if let indexPath = tableView.indexPathForSelectedRow {
//            destinationVC.selectedCategory = categories?[indexPath.row]
//        }
//    }
    
    //MARK: - Data Manipulation Methods
    
    func save(category: Category) {
        
        tableView.reloadData()
        
    }
    
    func loadCategories() {
        
    
        tableView.reloadData()
        
    }
    
    //MARK: - Delete Data From Swipe
    
   
    
    
    //MARK: - Add New Categories

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Adicionar categoria", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Adicionar", style: .default) { (action) in
            
            var newCategory = Category()
            newCategory.name = textField.text!
//            newCategory.colour = UIColor.randomFlat.hexValue()
            
            self.save(category: newCategory)
            
        }
        
        alert.addAction(action)
        
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new category"
        }
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

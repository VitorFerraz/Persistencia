//
//  TodoListUserDefaultsViewController.swift
//  Clear Todos
//
//  Created by Vitor Ferraz Varela on 03/10/21.
//

import UIKit

class TodoListUserDefaultsViewController: UITableViewController {    
    //User Defaults
    let persistence = UserDefaultsPersistence()
    override func viewDidLoad() {
        super.viewDidLoad()
        persistence.fetchItems()
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
    
    
    //MARK: - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persistence.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TodoTableViewCell.self), for: indexPath) as? TodoTableViewCell else { return UITableViewCell() }
        let itemTitle = persistence.items[indexPath.row]
        cell.update(with: itemTitle)
        return cell
    }
    
    
    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Adicionar novo item", message: "", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Criar", style: .default) { [weak self] (action) in
            guard let self = self else { return }
            guard let item = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
            self.persistence.save(newItem: item)
            self.reloadTableViewLastItem()
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)

        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Criar nova tarefa"
            textField = alertTextField
        }
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func reloadTableViewLastItem() {
        tableView.performBatchUpdates({
            let row = max(tableView.numberOfRows(inSection: 0), 0)
            tableView.insertRows(at: [IndexPath(row: row, section: 0)], with: .automatic)
        }, completion: nil)
    }
}

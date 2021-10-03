//
//  TodoTableViewCell.swift
//  Clear Todos
//
//  Created by Vitor Ferraz Varela on 03/10/21.
//

import UIKit

class TodoTableViewCell: UITableViewCell {    
    @IBOutlet weak var titleLabel: UILabel!
    
    func update(with title: String) {
        titleLabel.text = title
    }
}

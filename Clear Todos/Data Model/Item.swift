//
//  Item.swift
//  Clear Todos
//
//  Created by Vitor Ferraz Varela on 03/10/21.
//

import Foundation

struct Item {
    var title: String = ""
    var done: Bool = false
    var dateCreated: Date?
    var parentCategory: Category
}

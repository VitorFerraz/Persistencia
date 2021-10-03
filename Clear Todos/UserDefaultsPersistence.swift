//
//  UserDefaultsPersistence.swift
//  Clear Todos
//
//  Created by Vitor Ferraz Varela on 03/10/21.
//

import Foundation
class UserDefaultsPersistence {
    let defaults = UserDefaults.standard
    var items = [String]()
    
    static let UserDefaultsKey = "TodoList"
    
    func save(newItem item: String) {
        items.append(item)
        defaults.set(items, forKey: UserDefaultsPersistence.UserDefaultsKey)
    }
    
    func fetchItems() {
        items = defaults.value(forKey: UserDefaultsPersistence.UserDefaultsKey) as? [String] ?? []
    }
    
    //Check plist
    //po NSHomeDirectory()
    //  Library -> Preferences
}

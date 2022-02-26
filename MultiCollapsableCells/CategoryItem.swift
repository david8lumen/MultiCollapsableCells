//
//  CategoryItem.swift
//  MultiCollapsableCells
//
//  Created by David Grigoryan on 26.02.2022.
//

import Foundation

class CategoryItem: Identifiable & Hashable {
    let text: String
    let subcategories: [CategoryItem]

    init(text: String, subcategories: [CategoryItem] = []) {
        self.text = text
        self.subcategories = subcategories
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: CategoryItem, rhs: CategoryItem) -> Bool {
        return lhs.id == rhs.id
    }
}

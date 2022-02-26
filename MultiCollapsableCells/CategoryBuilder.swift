//
//  CategoryBuilder.swift
//  MultiCollapsableCells
//
//  Created by David Grigoryan on 26.02.2022.
//

import Foundation

struct CategoryItemsBuilder {
    public static let categoryItems = [
        carsCatergory,
        moviesCategory,
        techCategory,
    ]
    
    private static let carsCatergory = CategoryItem(text: "Cars", subcategories: [
        .init(text: "BMW", subcategories:
                [
                    .init(text: "730i"),
                    .init(text: "x7"),
                ]),
        .init(text: "Tesla", subcategories:
                [
                    .init(text: "Model 3"),
                    .init(text: "Model Y"),
                    .init(text: "Model X"),
                ]),
        .init(text: "Audi", subcategories:
                [
                    .init(text: "A3"),
                    .init(text: "A5"),
                    .init(text: "A6"),
                    .init(text: "Q7"),
                ]),
    ])
    
    private static let moviesCategory = CategoryItem(text: "Movies", subcategories: [
        .init(text: "Romance", subcategories:
                [
                    .init(text: "The lucky one"),
                    .init(text: "Little Women"),
                ]),
        .init(text: "Mystery", subcategories:
                [
                    .init(text: "My Son"),
                    .init(text: "The Commuter"),
                ]),
    ])
    
    private static let techCategory = CategoryItem(text: "Tech", subcategories: [
        .init(text: "Smartphones", subcategories:
                [
                    .init(text: "Apple", subcategories: [
                        .init(text: "iPhone XR"),
                        .init(text: "iPhone 11"),
                        .init(text: "iPhone 12 Mini"),
                        .init(text: "iPhone 13 Pro Max"),
                    ]),
                    .init(text: "Google", subcategories: [
                        .init(text: "Pixel 6"),
                        .init(text: "Pixel 6 Pro"),
                    ]),
                    .init(text: "Samsung", subcategories: [
                        .init(text: "Galaxy s20"),
                        .init(text: "Galaxy s22"),
                        .init(text: "Galaxy s8"),
                    ]),
                ]),
        .init(text: "Laptops", subcategories:
                [
                    .init(text: "Apple", subcategories: [
                        .init(text: "Macbook Pro 13\" 2020"),
                        .init(text: "Macbook Air 13\" 2020"),
                        .init(text: "Macbook Pro 16\" 2021"),
                    ]),
                    .init(text: "Lenovo", subcategories: [
                        .init(text: "Thinkpad x1 carbon gen 7"),
                        .init(text: "Thinkpad x1 carbon gen 8"),
                        .init(text: "Thinkpad x1 carbon gen 9"),
                    ]),
                ]),
    ])
}

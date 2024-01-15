//
//  Form.swift
//  MazaadyTask
//
//  Created by eslam dweeb on 15/01/2024.
//

import Foundation
struct Property {
    let id: Int
    let name: String
    var childProperties: [Property]?
}

struct Subcategory {
    let id: Int
    let name: String
    let properties: [Property]
}

struct Category {
    let id: Int
    let name: String
    let subcategories: [Subcategory]
}

class MockedData{
    static let Categories = [
        Category(id: 1, name: "Category 1", subcategories: [
            Subcategory(id: 11, name: "Subcategory1A", properties: [
                Property(id: 111, name: "Property1A1"),
                Property(id: 112, name: "Property1A2")
            ]),
            Subcategory(id: 12, name: "Subcategory1B", properties: [
                Property(id: 121, name: "Property1B1",childProperties: [
                    .init(id: 190, name: "process Type"),
                    .init(id: 191, name: "Brand",childProperties: [
                        .init(id: 201, name: "BMW",childProperties: [
                            .init(id: 301, name: "SERIES X",childProperties: [
                                .init(id: 401, name: "X1"),
                                .init(id: 402, name: "X3"),
                                .init(id: 403, name: "X6"),
                            ])
                        ]),
                        .init(id: 202, name: "Ford")
                    ]),
                ]),
                Property(id: 122, name: "Property1B2")
            ])
        
        ]),
        Category(id: 2, name: "Category 2", subcategories: [
            Subcategory(id: 13, name: "Subcategory2A", properties: [
                Property(id: 131, name: "Property2A1"),
                Property(id: 132, name: "Property2A2")
            ]),
            Subcategory(id: 14, name: "Subcategory2B", properties: [
                Property(id: 141, name: "Property2B1"),
                Property(id: 142, name: "Property2B2")
            ])
        ]),
        Category(id: 3, name: "Category 3", subcategories: [
            Subcategory(id: 15, name: "Subcategory3A", properties: [
                Property(id: 151, name: "Property3A1"),
                Property(id: 152, name: "Property3A2")
            ]),
            Subcategory(id: 16, name: "Subcategory3B", properties: [
                Property(id: 161, name: "Property3B1"),
                Property(id: 162, name: "Property3B2")
            ])
        ])
    ]
}

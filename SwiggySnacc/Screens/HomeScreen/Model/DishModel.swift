//
//  DishModel.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 26/01/25.
//

import Foundation

struct Dish:Identifiable, Codable, FoodItem{
    let id:String
    let name:String
    let image:String
    let description:String
    var price:Double{
        Double(description.count + 9)
    }
    var quantity: Int = 1
    
    enum CodingKeys: String, CodingKey{
        case id = "idCategory"
        case name = "strCategory"
        case image = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
    static var sampleData = Dish(id: "", name: "Chicken", image: "https://www.themealdb.com/images/category/chicken.png", description: "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]")
}

struct Menu: Codable{
    let categories: [Dish]
}

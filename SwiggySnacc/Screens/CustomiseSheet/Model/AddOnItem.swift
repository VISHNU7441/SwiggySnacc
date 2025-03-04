//
//  AddOnItem.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 27/01/25.
//

import Foundation

struct AddOnItem:Identifiable, FoodItem{
    let id = UUID().uuidString
    let title:String
    let price:Double
    var quantity: Int = 1
    
    static var sampleData = AddOnItem(title: "Adrak Chai (Ginger Tea - Serves 2)", price: 75)
}

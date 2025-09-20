//
//  CartManager.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 10/02/25.
//

import Foundation

// Handle all cart related functions

// try new change

class CartManager{
    static let shared = CartManager()
    var addedProducts:[FoodItem] = []
    var latestAddedProduct:Dish?
    
    private init(){  }
    
    
    func addAddOnesToCart(addOn:AddOnItem){
        addedProducts.append(addOn)
    }
    
    func deleteAddOnFromCart(addOn:AddOnItem){
        if let index = addedProducts.firstIndex(where: { ($0 as? AddOnItem)?.id == addOn.id }) {
                addedProducts.remove(at: index)
        }
    }
    
    func addDishToCart(dish:Dish){
        addedProducts.append(dish)
        latestAddedProduct = dish
    }
    

    
    func changeQuantityOfDish(quantity:Int){
        if let indices = addedProducts.firstIndex(where: { ($0 as? Dish)?.id == latestAddedProduct?.id } ){
            addedProducts[indices].quantity = quantity
        }
    }
    
}

protocol FoodItem{
    var quantity:Int  { get set }
}

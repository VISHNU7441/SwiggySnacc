//
//  SwiggySnaccTests.swift
//  SwiggySnaccTests
//
//  Created by vishnu r s on 17/02/25.

// This file test the "CartManager" class which is a singleton in the SwiggySnaccApp.
// This insures the CartManager works as expected when the AddOn Item or Dish Item is added to the cart.

import XCTest

@testable import SwiggySnacc
final class SwiggySnaccTests:XCTestCase{
    
    var cartManager:CartManager!
    
    override func setUp() {
        cartManager = CartManager.shared
        cartManager.latestAddedProduct = nil
        cartManager.addedProducts = []
    }
    
    override func tearDown() {
        cartManager.latestAddedProduct = nil
        cartManager.addedProducts = []
    }
    
    
    func test_addAddOnesToCart(){
        let addOn = AddOnItem(title: "testItem", price: 10, quantity: 1)
  
        cartManager.addAddOnesToCart(addOn: addOn)
        
        XCTAssertEqual(cartManager.addedProducts.count , 1 , "Expected 1 item in the cart, but got \(cartManager.addedProducts.count)")
        XCTAssertNotNil(cartManager.addedProducts.first(where: {($0 as? AddOnItem)?.title == "testItem"}))
        XCTAssertNil(cartManager.addedProducts.first(where: {($0 as? Dish)?.name == "testItem"}))
    }
    
    // Test cases on deleteAddOnFromCart function
    func test_deleteAddOnFromCart_correctAddOnIsDeleted_true(){
        let addOn1 = AddOnItem(title: "testItem1", price: 10, quantity: 1)
        let addOn2 = AddOnItem(title: "testItem2", price: 20, quantity: 1)
        cartManager.addAddOnesToCart(addOn: addOn1)
        cartManager.addAddOnesToCart(addOn: addOn2)

        cartManager.deleteAddOnFromCart(addOn: addOn1)

        XCTAssertEqual(cartManager.addedProducts.count, 1, "Expected count is 1, but got \(cartManager.addedProducts.count)")
    }
    
    func test_deleteAddOnFromCart_onlyDeleteAddOnIsPresent_true(){
        let addOn1 = AddOnItem(title: "testItem1", price: 10, quantity: 1)
        let addOn2 = AddOnItem(title: "testItem2", price: 20, quantity: 1)
        cartManager.addAddOnesToCart(addOn: addOn1)
        cartManager.addAddOnesToCart(addOn: addOn2)
        let addOn3 = AddOnItem(title: "testItem3", price: 20, quantity: 1)
        
        cartManager.deleteAddOnFromCart(addOn: addOn3)
        
        XCTAssertEqual(cartManager.addedProducts.count, 2, "Deleted the wrong AddOn Item")
    }
    
    // Test cases on addDishToCart function
    func test_addDishToCart_verifyDishItemIsAdded_true(){
        let dish = Dish(id: "1", name: "testDish", image: "", description: "")
        
        cartManager.addDishToCart(dish: dish)
        
        XCTAssertEqual(cartManager.addedProducts.count, 1, "Expected count is 1, but got \(cartManager.addedProducts.count)")
        XCTAssertNotNil(cartManager.addedProducts.first(where: {($0 as? Dish)?.name == "testDish" }))
        XCTAssertNil(cartManager.addedProducts.first(where: {($0 as? AddOnItem)?.title == "testDish"}))
    }
    
    func test_addDishToCart_latestAddedProductIsAddedDishItem_true(){
        let dish = Dish(id: "1", name: "testDish", image: "", description: "")
        
        cartManager.addDishToCart(dish: dish)
        
        XCTAssertEqual(cartManager.latestAddedProduct?.name, dish.name , "The latestAddedProduct is not same as the final added item in addedProduct")
    }
    
    // Test case on changeQuantityOfDish function
    func test_changeQuantityOfDish_isGivenQuantity(){
        let dish = Dish(id: "1", name: "testDish", image: "", description: "", quantity: 1)
        cartManager.addDishToCart(dish: dish)
        cartManager.changeQuantityOfDish(quantity: 2)
        
        if let givenDish = cartManager.addedProducts.first(where: {($0 as? Dish)?.id == dish.id}){
            XCTAssertEqual(givenDish.quantity, 2, "The quantity of the given dish item is not changed")
        }
    }
}


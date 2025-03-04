//
//  CustomiseViewModelTest.swift
//  SwiggySnaccTests
//
//  Created by vishnu r s on 17/02/25.
//

import XCTest

@testable import SwiggySnacc
final class CustomiseViewModelTest: XCTestCase {
    
    var viewModel:CustomiseSheetViewModel!
    var cartManager:CartManager!
    
    override func setUp()  {
        super.setUp()
        viewModel = CustomiseSheetViewModel()
        cartManager = CartManager.shared
    }
    
    override func tearDown(){
        viewModel.totalPrice = 0
        cartManager.addedProducts = []
        viewModel = nil
        super.tearDown()
    }
    
    // Test cases for initialisation
    func test_customiseSheetViewModel_isInitialisedProperly_true(){
        XCTAssertNotNil(viewModel)
    }
 
    func test_initialData_true(){
        XCTAssertEqual(viewModel.totalPrice, 0, "The totalPrice is not set to 0")
        XCTAssertEqual(viewModel.selectedDish.name, Dish.sampleData.name, "The default selectedDish is not sampleData")
    }
    
    func test_updateListOfAddOnes(){
        XCTAssertEqual(viewModel.listOfAddOnItems.count, 4, "The updateListOfAddOnes is not not called")
    }
    
    // Test case for addAddOnesToCart function
    func test_addAddOnesToCart_isAddOnAdded(){
        let testAddOn = AddOnItem(title: "testAddOn", price: 100, quantity: 1)
        viewModel.addAddOnesToCart(addOn: testAddOn)
        
        XCTAssertNotNil(cartManager.addedProducts.first(where: {($0 as? AddOnItem)?.title == "testAddOn" }))
    }
    
    func test_addAddOnesToCart_isPriceAddedToTotalPrice(){
        let testAddOn = AddOnItem(title: "testAddOn", price: 100, quantity: 1)
        viewModel.addAddOnesToCart(addOn: testAddOn)
        
        XCTAssertEqual(viewModel.totalPrice, testAddOn.price, "The price of the AddOn item is not added to total price")
    }
    
    // Test case for deleteAddOnFromCart function
    func test_deleteAddOnFromCart_isAddOnDeletedFromCart(){
        let testAddOn1 = AddOnItem(title: "testAddOn1", price: 100, quantity: 1)
        let testAddOn2 = AddOnItem(title: "testAddOn2", price: 200, quantity: 1)
        viewModel.addAddOnesToCart(addOn: testAddOn1)
        viewModel.addAddOnesToCart(addOn: testAddOn2)
        
        viewModel.deleteAddOnFromCart(addOn: testAddOn1)
        
        XCTAssertNil(cartManager.addedProducts.first(where: {($0 as? AddOnItem)?.title == "testAddOn1" }))
    }
    
    func test_deleteAddOnFromCart_isPriceDeductedFromTotalPrice(){
        let testAddOn1 = AddOnItem(title: "testAddOn1", price: 100, quantity: 1)
        let testAddOn2 = AddOnItem(title: "testAddOn2", price: 200, quantity: 1)
        viewModel.addAddOnesToCart(addOn: testAddOn1)
        viewModel.addAddOnesToCart(addOn: testAddOn2)
        
        viewModel.deleteAddOnFromCart(addOn: testAddOn1)
        
        XCTAssertEqual(viewModel.totalPrice, (testAddOn1.price + testAddOn2.price) - testAddOn1.price, "The price of the deleted AddOn is not properly deducted from total price." )
    }
    
    // Test case for updateTheQuantityOfDish function
    func test_updateTheQuantityOfDish_isChangedToGivenQuantity(){
        let testAddOn1 = AddOnItem(title: "testAddOn1", price: 100, quantity: 1)
        let testAddOn2 = AddOnItem(title: "testAddOn2", price: 200, quantity: 1)
        viewModel.addAddOnesToCart(addOn: testAddOn1)
        viewModel.addAddOnesToCart(addOn: testAddOn2)
        let testDish1 = Dish(id: "1", name: "testDish", image: "", description: "")
        cartManager.addDishToCart(dish: testDish1)
        
        viewModel.updateTheQuantityOfDish(quantity: 2)
        if let givenDish = cartManager.addedProducts.first(where: {($0 as? Dish)?.id == testDish1.id}){
            XCTAssertEqual(givenDish.quantity, 2, "The quantity of the dish is not updated")
        }
    }
    
    func test_updateTheQuantityOfDish_isTotalPriceUpdated(){
        let testDish1 = Dish(id: "1", name: "testDish", image: "", description: "")
        let testAddOn1 = AddOnItem(title: "testAddOn1", price: 100, quantity: 1)
        let testAddOn2 = AddOnItem(title: "testAddOn2", price: 200, quantity: 1)
        cartManager.addDishToCart(dish: testDish1)
        viewModel.addAddOnesToCart(addOn: testAddOn1)
        viewModel.addAddOnesToCart(addOn: testAddOn2)
       
        viewModel.updateTheQuantityOfDish(quantity: 2)
        
        XCTAssertEqual(viewModel.totalPrice, testAddOn1.price + testAddOn2.price + (testDish1.price * 2))
    }
    
    // Test case for updateTotalPrice function
    func test_updateTotalPrice(){
        let testDish1 = Dish(id: "1", name: "testDish", image: "", description: "test description")
        let testAddOn1 = AddOnItem(title: "testAddOn1", price: 100, quantity: 1)
        let testAddOn2 = AddOnItem(title: "testAddOn2", price: 200, quantity: 1)
        cartManager.addDishToCart(dish: testDish1)
        viewModel.addAddOnesToCart(addOn: testAddOn1)
        viewModel.addAddOnesToCart(addOn: testAddOn2)
        
      
        XCTAssertEqual(viewModel.totalPrice, testDish1.price + testAddOn1.price + testAddOn2.price)
    }
    
}




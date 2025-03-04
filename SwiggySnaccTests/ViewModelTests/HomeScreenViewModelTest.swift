//
//  HomeScreenViewModelTest.swift
//  SwiggySnaccTests
//
//  Created by vishnu r s on 18/02/25.
//

import XCTest
import Combine

@testable import SwiggySnacc
final class HomeScreenViewModelTest: XCTestCase {
    
    var viewModel:HomeScreenViewModel!
    var cartManager:CartManager!
    var cancellable = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()
        viewModel = HomeScreenViewModel()
        cartManager = CartManager.shared
    }

    override func tearDown() {
        viewModel = nil
        
        super.tearDown()
    }
    
    // Test case for initialisation
    func test_HomeScreenViewModel_initialState(){
        XCTAssertNotNil(viewModel)
        XCTAssertEqual(viewModel.listOfDishes.count, 0, "Initial values of listOfDishes is not empty")
        XCTAssertEqual(viewModel.listOfBannerItem.count, 3, "Unauthorised contents are present in listOfBanners")
        XCTAssertFalse(viewModel.isCustomiseSheetPresent)
    }
    
    func test_fetchBannerItems(){
        XCTAssertEqual(viewModel.listOfBannerItem[0].title, "Items at ₹49", "The items are not fetched as per desired")
        XCTAssertEqual(viewModel.listOfBannerItem.count, 3, "The banner items are not fully fetched")
    }
    
    func test_fetchDishes_isDataFetched(){
        let expectation = expectation(description: "waiting for data to fetched")
        
        viewModel.$listOfDishes
            .dropFirst()
            .sink { completion in
                switch completion{
                case .finished:
                    print("sucess")
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { value in
                XCTAssertGreaterThan(value.count, 0)
                expectation.fulfill()
            }
            .store(in: &cancellable)
        
        wait(for: [expectation], timeout: 5)

    }
    
    // Test cases for addDishToCart function
    func test_addDishToCart_addDishesToCart(){
        let testDish = Dish(id: "1", name: "testDish", image: "", description: "testDescription", quantity: 1)
        viewModel.addDishToCart(dish: testDish)
        
        XCTAssertGreaterThan(cartManager.addedProducts.count, 0, "The dish is not added to cart")
    }
    
    // Test case for callTheCustomSheet function
    func test_callTheCustomiseSheet_initialValue_false(){
        XCTAssertFalse(viewModel.isCustomiseSheetPresent)
    }

    func test_callTheCustomiseSheet_true(){
        viewModel.callTheCustomiseSheet()
        
        XCTAssertTrue(viewModel.isCustomiseSheetPresent)
    }
    
}


//
//  CustomiseSheetViewModel.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 10/02/25.
//

import Foundation

class CustomiseSheetViewModel:ObservableObject{
    @Published var selectedDish:SelectedDish = .sampleData
    @Published var totalPrice:Double = 0
    @Published var listOfAddOnItems:[AddOnItem] = []
    let cartManager = CartManager.shared
    
    init(){
        updateData()
        updateListOfAddOnes()
    }
    
    private func updateData(){
        if let newlySelectedDish = cartManager.latestAddedProduct{
            let currentSelectedDish  = SelectedDish(name: newlySelectedDish.name, image: newlySelectedDish.image)
            selectedDish = currentSelectedDish
            updateTotalPrice()
        }
    }
    
    private func updateListOfAddOnes(){
        let listOfAddOnes:[AddOnItem] = [
            AddOnItem(title: "Filter Coffee (Serves 2)", price: 75),
            AddOnItem(title: "Adrak Chai (Ginger Tea Serves 2)", price: 75),
            AddOnItem(title: "TWT Cold Coffee protein Shake", price: 159),
            AddOnItem(title: "Lemon Iced Tea (200 ml)", price: 79)
        ]
        self.listOfAddOnItems = listOfAddOnes
    }
    
    func addAddOnesToCart(addOn:AddOnItem){
        cartManager.addAddOnesToCart(addOn: addOn)
        updateTotalPrice()
    }
    
    func deleteAddOnFromCart(addOn:AddOnItem){
        cartManager.deleteAddOnFromCart(addOn: addOn)
        updateTotalPrice()
    }
    
    func updateTheQuantityOfDish(quantity:Int){
        cartManager.changeQuantityOfDish(quantity: quantity)
        updateTotalPrice()
    }
    
    func updateTotalPrice(){
        var total:Double = 0
        for item in cartManager.addedProducts{
            if let dish = item as? Dish{
                total += dish.price * Double(dish.quantity)
            }else if let addOn = item as? AddOnItem{
                total += addOn.price * Double(addOn.quantity)
            }
        }
        self.totalPrice = total
    }
}

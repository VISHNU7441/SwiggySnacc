//
//  HomeScreenViewModel.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 10/02/25.
//

import Foundation
import Combine

class HomeScreenViewModel:ObservableObject{
    @Published var listOfDishes:[Dish] = []
    @Published var listOfBannerItem:[BannerContent] = []
    @Published var isCustomiseSheetPresent:Bool = false
    
    private let cartManager = CartManager.shared
    private let urlString = "https://www.themealdb.com/api/json/v1/1/categories.php"
    private var cancellable = Set<AnyCancellable>()
    
    init(){
        do{
            fetchBannerItems()
            try fetchDishes()
        }
        catch{
            print(error)
        }
    }
    
    private func fetchDishes() throws{
        guard let url = URL(string: urlString) else{ throw URLError(.badURL)}
        
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Menu.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            
        publisher.sink { completion in
            switch completion{
            case .finished:
                print("success")
            case .failure(let error):
                print("unable to process due to error: \(error)")
            }
        } receiveValue: {[weak self] data in
            self?.listOfDishes = data.categories
            print(data.categories)
        }
        .store(in: &cancellable)

    }
  
   private func fetchBannerItems(){
        let items = [BannerContent(id: 0, title: "Items at ₹49", icon: "Deal of Day", subHeading1: "ON SELECT ITEMS"), BannerContent(id: 1, title: "20% off upto ₹50", icon: "%", subHeading1: "USE TRYNEW", subHeading2: "| ABOVE ₹159") , BannerContent(id: 2, title: "Free cookie", icon: "%", subHeading1: "NO CODE REQUIRED", subHeading2: "| ABOVE ₹149")]
        listOfBannerItem.append(contentsOf: items)
    }
    
    
    //MARK: list of functions to add dishes to Cart
    
    func addDishToCart(dish:Dish){
        cartManager.addDishToCart(dish: dish)
        callTheCustomiseSheet()
    }
    
    func callTheCustomiseSheet(){
        isCustomiseSheetPresent = true
    }
}

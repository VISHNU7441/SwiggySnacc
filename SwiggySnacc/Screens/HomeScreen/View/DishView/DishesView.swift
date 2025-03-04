//
//  DishesView.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 26/01/25.
//

import SwiftUI

struct DishesView: View {
    @StateObject var viewModel = HomeScreenViewModel()
    private var column:[GridItem] = [GridItem( spacing: 20), GridItem(spacing: 20)]
    var body: some View {
        VStack(alignment:.leading){
            Text("120 Dishes")
                .fontDesign(.rounded)
                .bold()
            LazyVGrid(columns: column, alignment: .center, spacing: 30){
                ForEach(viewModel.listOfDishes){ dish in
                    // DishView
                    DishView(dish: dish)
                }
            }
        }
        .padding()
    }
}

#Preview {
    DishesView()
}

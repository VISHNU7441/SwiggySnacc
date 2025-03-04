//
//  DishButtonView.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 26/01/25.
//

import SwiftUI

struct DishButtonView: View {
    let dish:Dish
    @EnvironmentObject var viewModel:HomeScreenViewModel
    var body: some View {
        Button {
            viewModel.addDishToCart(dish: dish)
        } label: {
            Image(systemName: "plus")
                .bold()
                .foregroundStyle(.textBlack)
                .padding(10)
                .background{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.snaccGreen)
                        .shadow(color: .textBlack, radius: 0, x: 4, y: 3)
                }
            

        }
        

    }
}

#Preview {
    DishButtonView(dish: .sampleData)
}

//
//  DishesButtonView.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 27/01/25.
//

import SwiftUI

struct DishesButtonView: View {
    let dish:Dish
    @EnvironmentObject var viewModel:HomeScreenViewModel
    var body: some View {
        Button {
            viewModel.addDishToCart(dish: dish)
        } label: {
            Text("ADD")
                .fontWeight(.heavy)
                .foregroundStyle(.textBlack)
                .padding(10)
                .padding(.horizontal, 5)
                .background{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.snaccGreen)
                        .shadow(color: .textBlack, radius: 0, x: 4, y: 3)
                }
            

        }
    }
}

#Preview {
    DishesButtonView(dish: .sampleData)
}

//
//  QuantityAddButton.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 27/01/25.
//

import SwiftUI

struct QuantityAddButton: View {
    @EnvironmentObject var viewModel:CustomiseSheetViewModel
    @State private var quantity:Int = 1
    var body: some View {
        HStack(spacing: 25){
            Button {
                if quantity > 1{
                    quantity -= 1
                    viewModel.updateTheQuantityOfDish(quantity: quantity)
                }
            } label: {
                Image(systemName: "minus")
                    
            }
            
            Text("\(quantity)")
            
            Button {
                quantity += 1
                viewModel.updateTheQuantityOfDish(quantity: quantity)
            } label: {
                Image(systemName: "plus")
                    
            }
        }
        .bold()
        .font(.title2)
        .foregroundStyle(.textBlack)
        .padding(10)
        .background{
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder()
                
        }
        

    }
}

#Preview {
    QuantityAddButton()
}

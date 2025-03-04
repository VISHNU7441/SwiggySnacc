//
//  AddOnItemView.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 27/01/25.
//

import SwiftUI

struct AddOnItemView: View {
    let item:AddOnItem
    @EnvironmentObject var viewModel:CustomiseSheetViewModel
    @State private var isSelected:Bool = false
    var body: some View {
        HStack(alignment:.firstTextBaseline, spacing: 0){
            Image(systemName: "button.programmable.square")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .bold()
                .foregroundStyle(.green)
            
            Text(item.title)
                .font(.title3)
                .foregroundStyle(.black.opacity(0.7))
                .lineLimit(2, reservesSpace: true)
                .multilineTextAlignment(.leading)
                .padding(.leading)
               // .frame(maxWidth: 250)
            Spacer()
            Text(String(format: "₹%.f", item.price))
                .font(.title3)
                .foregroundStyle(.black.opacity(0.5))
            ZStack{
                if isSelected{
                    Image(systemName: "checkmark.square.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.red.opacity(0.8))
                }else{
                    RoundedRectangle(cornerRadius: 5)
                        .strokeBorder()
                }
            }
            .frame(width: 20, height: 20)
            .padding(.leading)
        
        }
        .padding()
        .frame(width: 400 , height: 50)
        .onTapGesture {
            isSelected.toggle()
            if isSelected{
                viewModel.addAddOnesToCart(addOn: item)
            }else{
                viewModel.deleteAddOnFromCart(addOn: item)
            }
            
        }
        
      
    }
}

#Preview {
   // AddOnItemView(item: .sampleData)
    HomeView()
}

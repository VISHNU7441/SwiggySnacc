//
//  CustomiseSheetView.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 27/01/25.
//

import SwiftUI

struct CustomiseSheetView: View {
    @StateObject var viewModel = CustomiseSheetViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(alignment:.leading, spacing: 9){
            Spacer()
            Group{
                HStack {
                    CustomiserHeaderView(dish: viewModel.selectedDish)
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "multiply")
                            .padding()
                    }
                    .tint(.black)

                  }
                
                Text("Customise as per your taste")
                    .bold()
                    .font(.title2)
                Divider()
                    .padding(.top,13)
                    .padding(.bottom,13)
                Text("Add On Beverages")
                    .bold()
                    .font(.title3)
                Text("Select upto 3")
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal)
            Form{
                ForEach(viewModel.listOfAddOnItems){ item in
                    AddOnItemView(item: item)
                }
            }
            .formStyle(.columns)
            Divider()
            HStack(spacing: 30){
                QuantityAddButton()
                
                FinalAddItemButton(totalPrice: viewModel.totalPrice)
    
            }
            .frame(maxWidth: 450)
        }
        .padding(30)
        .ignoresSafeArea(edges: .bottom)
        .environmentObject(viewModel)
    }
}


#Preview {
    HomeView()
}


#Preview {
    CustomiseSheetView()
}

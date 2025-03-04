//
//  CompactDishView.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 26/01/25.
//

import SwiftUI

struct CompactDishView: View {
    let dish:Dish
    var body: some View {
        VStack(alignment:.leading){
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.dishBackground.opacity(0.6))
                AsyncImage(url: URL(string: dish.image) ){ result in
                    switch result {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    case .failure:
                        ProgressView()
                    @unknown default:
                        fatalError("unable to process")
                    }
                }
            }
            .frame(width: 120, height: 100)
            .overlay(alignment: .bottomTrailing) {
                DishButtonView(dish: dish)
            }
            HStack(spacing: 2){
                Image(systemName: "arrowtriangle.up.square.fill")
                    .foregroundStyle(.red.opacity(0.7))
            
                Text(dish.name)
                    .fontDesign(.rounded)
                    .fontWeight(.medium)
                    .foregroundStyle(.textBlack)
                    .lineLimit(2)

            }
            Text(String(format: "₹ %.1f", dish.price))
        
        }
        .frame(width: 120)
        

    }
}

#Preview {
    CompactDishView(dish: .sampleData)
}

//
//  DishView.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 26/01/25.
//

import SwiftUI

struct DishView: View {
    let dish:Dish
    var body: some View {
        VStack(alignment:.leading,spacing: 4){
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.dishBackground.opacity(0.7))
                AsyncImage(url: URL(string: dish.image)){ result in
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
                        fatalError("Unable to process")
                    }
                    
                }
            }
            .frame(width: 180, height: 200)
                Image(systemName: "arrowtriangle.up.square.fill")
                    .foregroundStyle(.red.opacity(0.7))
                Text(dish.name)
                    .bold()
            
            HStack{
                Text(String(format: "₹ %.1f", dish.price))
                    .bold()
                Spacer()
                DishesButtonView(dish: dish)
                    .padding(.trailing)
            }
            .frame(maxWidth: 190)
            
        }
        .frame(width:200)
    }
}

#Preview {
   // DishView(dish: .sampleData)
    DishesView()
}

//
//  CustomiserHeaderView.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 11/02/25.
//

import SwiftUI

struct CustomiserHeaderView: View {
    let dish:SelectedDish
    var body: some View {
        HStack{
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
            .frame(width: 100, height: 70)
            
            Text(dish.name)
                .bold()
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    CustomiserHeaderView(dish: .sampleData)
}

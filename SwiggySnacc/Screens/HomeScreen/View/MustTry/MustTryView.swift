//
//  ForCheck.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 26/01/25.
//

import SwiftUI

struct MustTryView: View {
    @StateObject private var viewModel = HomeScreenViewModel()
    var body: some View {
        VStack(alignment: .leading){
            Text("  Must Try")
                .bold()
            ScrollView(.horizontal) {
                HStack{
                    ForEach(viewModel.listOfDishes){ dish in
                        // CompactDishView()
                        CompactDishView(dish: dish)
                    }
                }
                .padding(.leading)
                .scrollClipDisabled()
            }
            .scrollIndicators(.hidden)
        }
    }
}


#Preview {
    MustTryView()
}


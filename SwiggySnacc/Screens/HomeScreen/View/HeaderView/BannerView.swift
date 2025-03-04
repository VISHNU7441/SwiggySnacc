//
//  BannerView.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 26/01/25.
//

import SwiftUI

struct BannerView: View {
    @StateObject var vieModel = HomeScreenViewModel()
    @State private var selection:Int = 0
    var body: some View {
        HStack(spacing: 0){
            TabView(selection: $selection) {
                ForEach(vieModel.listOfBannerItem){ item in
                    BannerContentView(content: item)
                        .tag(item.id)
                }
            }
            .frame(width: 300, height: 70)
            .tabViewStyle(.page(indexDisplayMode:.never))
        
            DotView(currentIndex: $selection)
        }
        
        .padding(.horizontal)
        .background{
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder()
                
        }
       
    }
}

#Preview {
    BannerView()
}



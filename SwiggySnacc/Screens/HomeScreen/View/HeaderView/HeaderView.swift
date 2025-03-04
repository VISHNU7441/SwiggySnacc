//
//  HeaderView.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 23/01/25.
//

import SwiftUI

struct HeaderView: View {
    @Binding var isScrolling:Bool
    var body: some View {
        VStack(spacing: 8){
            HStack{
                Text(" 10\nMins")
                    .font(.system(size: 15))
                    .bold()
                    .foregroundStyle(.snaccGreen)
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.snaccBlue))
                VStack(alignment:.leading){
                    Text("158/1")
                    Text("Janatha Colony, Chikkabellandur, Benga")
                        .lineLimit(1)
                        .frame(maxWidth: 290)
                        .foregroundStyle(.secondary)
                }
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke()
                    }
                    
            }
            // search bar
            GeometryReader{ geo in
                let yOffset = geo.frame(in: .global).minY
                    SearchBar()
                    .offset(y: max((64 - yOffset), 0))
                    .onChange(of: yOffset) { _ , newValue in
                            if newValue == 150{
                                isScrolling = false
                            }else{
                                isScrolling = true
                            }
                        }
                }
            .frame(height: 50)
        }
        .padding()
        .background(.snaccGreen)
    }
}

#Preview {
    HomeView()
}

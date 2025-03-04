//
//  SearchBar.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 23/01/25.
//

import SwiftUI

struct SearchBar: View {
    @State private var searchTerm:String = ""
    var body: some View {
        HStack{
            TextField("Search for 'Samosa'", text: $searchTerm)
                .font(.title3)
                .frame(maxWidth: 300)
            Image(systemName: "magnifyingglass")
            Divider()
                .frame(height: 30)
                .background(.black)
            Image(systemName: "mic.fill")
                .foregroundStyle(.subIndicatorOrange)
        }
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 15)
                .fill(.white)
                .strokeBorder(.gray)
                .frame(height: 50)
                
        }
    }
}

#Preview {
    SearchBar()
}

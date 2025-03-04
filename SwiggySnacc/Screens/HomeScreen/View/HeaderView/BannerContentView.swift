//
//  SwiftUIView.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 24/01/25.
//

import SwiftUI

struct BannerContentView: View {
    let content:BannerContent
    var body: some View {
        HStack{
            Image(systemName: "seal.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 55, height: 55)
                .foregroundStyle(.subIndicatorOrange)
                .overlay(alignment: .center) {
                    Text(content.icon.uppercased())
                        .bold()
                        .font(content.icon == "%" ? .title2 : .system(size: 11))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding(2)
                }
            
            VStack(alignment:.leading){
                Text(content.title)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.textBlack)
                Text("\(content.subHeading1)" + " \(content.subHeading2 ?? "")")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
    }
}

#Preview {
    BannerContentView(content: .sampleData)
}

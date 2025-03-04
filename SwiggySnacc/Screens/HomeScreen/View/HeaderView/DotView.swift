//
//  DotView.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 26/01/25.
//
import SwiftUI


struct DotView:View {
    @Binding var currentIndex:Int
    var body: some View {
        VStack{
            Text("\(currentIndex + 1) / 3")
                .font(.title3)
                .bold()
                .foregroundStyle(.subIndicatorOrange)
            
            HStack{
                ForEach(0..<3){ index in
                    Circle()
                        .frame(width: currentIndex == index ? 10 : 5)
                        .foregroundStyle( currentIndex == index ? .subIndicatorOrange : .gray)
                        .animation(.bouncy, value: currentIndex)
                }
            }
        }
    }
}

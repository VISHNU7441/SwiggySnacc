//
//  LogoView.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 26/01/25.
//
import SwiftUI


struct LogoView:View {
    var body: some View {
        VStack(spacing: 30){
            Image("snaccLogo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 280, height: 0)
                .background(.red)
                .padding(.top)
            Text("Dope dishes in minutes")
                .font(.headline)
            
        }
    }
}


         

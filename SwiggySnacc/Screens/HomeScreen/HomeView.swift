//
//  ContentView.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 23/01/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeScreenViewModel()
    @State var isScrolling:Bool = true
    var body: some View {
        ZStack{
            Color.snaccGreen.ignoresSafeArea()
//                .animation(.easeInOut, value: isScrolling)
            ScrollView{
                VStack(spacing: 0){
                    HeaderView(isScrolling: $isScrolling)
                        .zIndex(2)
                    UnevenRoundedRectangle( bottomLeadingRadius: 20, bottomTrailingRadius: 20,style: .continuous)
                        .fill(.snaccGreen)
                        .frame(height: 109)
                        .overlay {
                            LogoView()
                            
                        }
                    Group{
                        BannerView()
                    
                        MustTryView()
                    }
                    .padding(.top, 8)
                    DishesView()
                }
                .background{
                    Color.white.ignoresSafeArea(edges:.bottom)
                }
            }
            .scrollIndicators(.hidden)
            .zIndex(1)
        }
        .sheet(isPresented: $viewModel.isCustomiseSheetPresent){
            CustomiseSheetView()
                .presentationDetents([.fraction(0.7)])
        }
        .safeAreaInset(edge: .top,spacing: 0) {
            Color.snaccGreen.frame(height: 70)
                
        }
        .ignoresSafeArea()
        .environmentObject(viewModel)
    }
}

#Preview {
    HomeView()
}

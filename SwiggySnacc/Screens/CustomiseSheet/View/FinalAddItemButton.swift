//
//  FinalAddItemButton.swift
//  SwiggySnacc
//
//  Created by vishnu r s on 11/02/25.
//

import SwiftUI

struct FinalAddItemButton: View {
    @Environment(\.dismiss) var dismiss
    let totalPrice:Double
    var body: some View {
        Button {
            dismiss()
        } label: {
            HStack{
                Text("Add Item")
                    
                Divider()
                    .frame(width: 2,height: 20)
                    .background(.textBlack)
                Text(String(format: "₹ %.f", totalPrice))
            }
            .font(.title3)
            .bold()
            .frame(height: 50)
            .padding(.horizontal)
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .fill(.snaccGreen)
                    .strokeBorder()
            }
        }
        .tint(.textBlack)

    }
}

#Preview {
    FinalAddItemButton(totalPrice: 0)
}

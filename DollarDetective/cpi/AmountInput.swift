//
//  AmountInput.swift
//  DollarDetective
//
//  Created by Matt Duncan on 10/22/24.
//

import SwiftUI

struct AmountInput: View {
    @Binding var amount : String
    @FocusState var isInputFocused : Bool
    
    var body: some View {
        TextField("Amount", text: $amount)
                .tint(.black)
                .padding(3)
                .font(.title3)
                .focused($isInputFocused)
                .disableAutocorrection(true)
                .frame(width: 130)
                .keyboardType(.decimalPad)
                .textFieldStyle(.plain)
                .background(Color.white)
                .foregroundStyle(.black)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 11, height: 11)))
                .overlay(
                    RoundedRectangle(cornerRadius: 11)
                        .stroke(isInputFocused ? .blue : .black, lineWidth: 2)
                )
                .onChange(of: amount, {prev, curr in
                    if (curr != "" && Double(curr) == nil) || curr.count > 11 {
                        amount = prev
                    }
                })
                
        }
}

//#Preview {
//    AmountInput(amount: 1000.00)
//}

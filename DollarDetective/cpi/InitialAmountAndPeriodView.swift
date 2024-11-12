//
//  InitialAmountAndPeriodView.swift
//  DollarDetective
//
//  Created by Matt Duncan on 10/23/24.
//

import SwiftUI

struct InitialAmountAndPeriodView: View {
    @Binding var amount : String
    var month : String
    var year : String
    @FocusState var isInputFocused : Bool
    
    var body: some View {
        HStack {
            Image(
                systemName: "dollarsign"
            )
            .renderingMode(.template)
            .foregroundColor(
                .mainText
            )
            .font(.title3)
        
            AmountInput(amount: $amount, isInputFocused: _isInputFocused)
            Text(
                "in \(month) \(year)"
            )
            .font(.title3)
            .foregroundStyle(.mainText)
            Spacer()
        }
    }
}

//#Preview {
//    InitialAmountAndPeriodView()
//}

//
//  ChainedSwitchView.swift
//  DollarDetective
//
//  Created by Matt Duncan on 10/23/24.
//

import SwiftUI

struct ChainedSwitch: View {
    @Binding var isChained : Bool
    @Binding var res : String
    var body: some View {
        Toggle(
            isOn: $isChained
        ) {
            Text("chained")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundStyle(.mainText)
        }
        .toggleStyle(
            .switch
        )
        .tint(.green)
        .onChange(of: isChained, {prev, curr in
            res = ""
        })
        .padding(.trailing, 8)
    }
}

//#Preview {
//    ChainedSwitchView()
//}

//
//  CalculateBtn.swift
//  DollarDetective
//
//  Created by Matt Duncan on 10/23/24.
//

import SwiftUI

struct CalculateBtn: View {
    @Binding var isUploading : Bool
    var res : String
    var calculate : () -> Void
    
    var body: some View {
        Button(action: calculate, label: {
            HStack {
                Spacer()
                if isUploading  {
                    SpinnerView()
                    
                } else {
                    Text("Calculate")
                        .padding()
                        .foregroundStyle(.black)
                        .font(.headline)
                        .fontWeight(.medium)
                }
                Spacer()
            }
            
        })
        .frame(maxWidth: .infinity, minHeight: 50, idealHeight: 55, maxHeight: 55)
        .background(
            .white,
            in: RoundedRectangle(cornerSize: CGSize(width: 11, height: 11)))
        .disabled(res.count > 1)
    }
}


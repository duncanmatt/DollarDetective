//
//  DiscoverBtn.swift
//  DollarDetective
//
//  Created by Matt Duncan on 10/23/24.
//

import SwiftUI

struct DiscoverBtn: View {
    var isUploading : Bool
    var res : String
    
    var fetch : () -> Void
    
    var body: some View {
        Button(action: fetch, label: {
            HStack {
                Spacer()
                if isUploading {
                    SpinnerView()
                    
                } else {
                    Text("Discover")
                        .padding()
                        .foregroundStyle(.black)
                        .font(.headline)
                        .fontWeight(.medium)
                    
                }
                Spacer()
            }
            
        })
        .frame(maxWidth: .infinity, minHeight: 50, idealHeight: 55)
        .background(.white)
        .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 11, bottomLeading: 11, bottomTrailing: 11, topTrailing: 11)))
        .buttonStyle(.plain)
        .disabled(res.count > 1)
    }
}

//#Preview {
//    DiscoverBtn()
//}

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
        .disabled(res.count > 1)
        .frame(maxWidth: .infinity, minHeight: 50, idealHeight: 55, maxHeight: 55, alignment: .center)
        .background(
            .white,
            in: RoundedRectangle(cornerSize: CGSize(width: 11, height: 11))
        )
        .frame(alignment: .bottom)
    }
}

//#Preview {
//    DiscoverBtn()
//}

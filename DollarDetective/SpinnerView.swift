//
//  Spinner.swift
//  DollarDetective
//
//  Created by Matt Duncan on 10/20/24.
//

import SwiftUI

struct SpinnerView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .black))
            .scaleEffect(1.2, anchor: .center)
    }
}

#Preview {
    SpinnerView()
}

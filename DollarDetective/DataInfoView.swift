//
//  FoodInfoView.swift
//  DollarDetective
//
//  Created by Matt Duncan on 10/20/24.
//

import SwiftUI
import SafariServices

struct DataInfoView: View {
    @State private var webViewOpen : Bool = false
    @State private var urlString : String?
    var isCPI : Bool
    
    private let cpiText : String = "Calculations are based on Consumer Price Index data published by the Bureau of Labor Statistics. Specifically, U.S city average concerning all items regardless of seasonal adjustments."
    
    private let foodText : String = "grocery prices represent the average price for urban consumers" 
    
    
    var body: some View {
        VStack {
            Text(isCPI ? self.cpiText : self.foodText)
                .padding()
            Text("BLS.gov cannot vouch for the data or analyses derived from these data after the data have been retrieved from BLS.gov.")
                .padding()
            Spacer()
            VStack {
                Button("BLS.gov") {
                    self.urlString = "https://www.bls.gov"
//                    self.webViewOpen = true
                }
                .padding()

                Button("Privacy Policy") {
                    self.urlString = "https://www.termsfeed.com/live/49af2305-1691-443a-b98b-0c27f74de6e5"
//                    self.webViewOpen = true
                }
            }
            Spacer()
        }
        .onChange(of: urlString, {
            guard self.urlString != nil else { return }
            self.webViewOpen = true
        })
        .fullScreenCover(isPresented: $webViewOpen) {
            if let url = URL(string: urlString!) {
                SafariWebView(url: url)
                    .onDisappear(perform: {
                        self.urlString = nil
                        self.webViewOpen = false
                    })
                    .ignoresSafeArea()
            }
        }
    }
    
}

#Preview {
    DataInfoView(isCPI: true)
}

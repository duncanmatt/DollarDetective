//
//  FoodPricesView.swift
//  DollarDetective
//
//  Created by Matt Duncan on 10/16/24.
//

import SwiftUI

struct FoodPricesView: View {
    @StateObject var viewModel = FoodPricesViewModel()
    @FocusState var isInputFocused : Bool
    
    var body: some View {
        NavigationStack {
        VStack {
            Spacer()
            HStack {
                Text("average price per lb. of")
                    .font(.title2)
                Spacer()
            }
            .padding(.leading, 10)
            ItemAndPeriod(searchIsActive: $viewModel.searchIsActive, selected: $viewModel.selected, month: $viewModel.month, year: $viewModel.year, res: $viewModel.res, items: $viewModel.items, searchQuery: $viewModel.searchQuery, filterFn: viewModel.filterItems)
                Spacer()
                Text(viewModel.isError ? "No data available" : "$\(viewModel.res)")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundStyle(viewModel.isError ? .red : .mainText)
                Spacer()
                DiscoverBtn(isUploading: viewModel.isUploading, res: viewModel.res, fetch: viewModel.fetch)
            }
            .padding()
            .navigationTitle("Food Prices")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink {
                     DataInfoView(isCPI: false)
                    } label: {
                        Image(systemName: "info.circle")
                            .foregroundStyle(.mainText)
                    }
                    
                }
            }
            .background(.bg)
            .ignoresSafeArea(.keyboard)
        }
        
    }
}

#Preview {
    FoodPricesView()
}

//
//  CPICalculatorView.swift
//  DollarDetective
//
//  Created by Matt Duncan on 10/14/24.
//

import SwiftUI


struct CPICalculatorView: View {
    @StateObject var viewModel = InflationCalcViewModel()
    @FocusState var isInputFocused: Bool
    
    var body: some View {
        
        NavigationStack {
            VStack {
                InitialAmountAndPeriodView(amount: $viewModel.amount, month: viewModel.startMonth, year: viewModel.startYear, isInputFocused: _isInputFocused)
                CPIPeriodPickerView(
                    month: $viewModel.startMonth,
                    year: $viewModel.startYear,
                    res: $viewModel.res
                )
                Text(
                    viewModel.isError ? "No data available for selected periods" : "Is worth $\(viewModel.res) in \(viewModel.endMonth) \(viewModel.endYear)"
                )
                .font(.title3)
                .foregroundStyle(viewModel.isError ? .red : .white)
                .padding(.vertical, 5)
                    
                CPIPeriodPickerView(
                    month: $viewModel.endMonth,
                    year: $viewModel.endYear,
                    res: $viewModel.res
                )
                ChainedSwitch(isChained: $viewModel.isChained, res: $viewModel.res)
                Spacer()
                CalculateBtn(isUploading: $viewModel.isUploading, res: viewModel.res, calculate: viewModel.calculate)
            }
            .padding()
            .navigationTitle("CPI Inflation")
            .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        NavigationLink {
                            DataInfoView(isCPI: true)
                        } label: {
                            Label("info", systemImage: "info.circle")
                                .foregroundStyle(.white)
                            
                        }
                    }
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("Clear") {
                            viewModel.amount = ""
                        }
                        .foregroundStyle(.red)
                        .fontWeight(.bold)
                    
                        Spacer()
                        Button("Done") {
                            viewModel.syncAmount()
                            isInputFocused = false
                        }
                        .foregroundStyle(.green)
                        .fontWeight(.bold)
                    }
                }
                .ignoresSafeArea(.keyboard)
                .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

#Preview {
    CPICalculatorView()
}

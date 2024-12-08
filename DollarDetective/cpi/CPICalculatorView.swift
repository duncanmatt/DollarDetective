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
    
    @Binding var theme : Theme
    
    var body: some View {
        
        NavigationStack {
            VStack {
                InitialAmountAndPeriodView(amount: $viewModel.amount, month: viewModel.startMonth, year: viewModel.startYear, isInputFocused: _isInputFocused)
                CPIPeriodPickerView(
                    month: $viewModel.startMonth,
                    year: $viewModel.startYear,
                    res: $viewModel.res
                )
                HStack {
                    Text(
                        viewModel.isError ? "No data available for selected periods" : "Is worth $\(viewModel.res) in \(viewModel.endMonth) \(viewModel.endYear)"
                    )
                    Spacer()
                }
                .font(.title3)
                .foregroundStyle(viewModel.isError ? .red : .mainText)
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
            .background(.bg)
            .navigationTitle("CPI Inflation")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink {
                        DataInfoView(isCPI: true)
                    } label: {
                        Image(systemName: "info.circle")
                            .renderingMode(.template)
                            .scaledToFit()
                            .foregroundStyle(.mainText)
                        
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    SegmentedThemePicker(theme: $theme)
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
        }
    }
}

//#Preview {
//    CPICalculatorView()
//}

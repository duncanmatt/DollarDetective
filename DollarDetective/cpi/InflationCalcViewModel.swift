//
//  InflationCalcViewModel.swift
//  DollarDetective
//
//  Created by Matt Duncan on 10/14/24.
//

import Foundation
import Combine
import SwiftUI

let months : Dictionary = [
    "January": "01",
    "February": "02",
    "March": "03",
    "April": "04",
    "May": "05",
    "June": "06",
    "July": "07",
    "August": "08",
    "September": "09",
    "October": "10",
    "November": "11",
    "December": "12"
]

class InflationCalcViewModel: ObservableObject {
    @Published var startMonth: String = "September"
    @Published var startYear: String = "2023"
    @Published var endMonth: String = "September"
    @Published var endYear: String = "2024"
    @Published var amount : String = "1000.00"
    @Published var amountDbl : Double = 1000.00
    @Published var res : String = "1,024.41"
    @Published var isChained : Bool = false
    @Published var isUploading : Bool = false
    @Published var isError : Bool = false
    
    private func formatMonth(_ month: String) -> String {
        if let monthVal = months[month] {
            return monthVal
        }
        return ""
    }
    
    func clearInput() {
        self.amount = ""
    }
    
    func syncAmount() {
        if let dbl = Double(self.amount) {
            if dbl != self.amountDbl {
                self.res = ""
                self.amountDbl = dbl
            }
        } else {
            self.res = "0.00"
            self.amountDbl = 0.00
        }
    }
    
    func calculate() {
        self.isUploading = true
        guard let url = URL(
            string: "https://l3x75qqjdh.execute-api.us-east-2.amazonaws.com/api/cpi"
        ) else {
            self.isUploading = false
            self.isError = true
            return
        }
        var req = URLRequest(
            url: url
        )
        req.httpMethod = "POST"
        req.addValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        let body = InflationCalculationReqBody(
            id: UUID(),
            startMonth: self.formatMonth(self.startMonth),
            startYear: self.startYear,
            endMonth: self.formatMonth(self.endMonth),
            endYear: self.endYear,
            seriesId: "\(isChained ? "S" : "C")UUR0000SA0"
        )
        
            let bodyJson = try? JSONEncoder().encode(
                body
            )
            req.httpBody = bodyJson
            
            URLSession.shared.dataTask(
                with: req
            ) {
                data,
                response,
                error in
                guard let data = data,
                      error == nil else {
                    print(
                        error as Any
                    )
                    self.isUploading = false
                    self.isError = true
                    return
                }
                
                
                do {
                    let decodedRes = try JSONDecoder().decode(
                        InflationCalculationRes.self,
                        from: data
                    )
                    
                    let decodedData: Double = decodedRes.data
                    let rate = Double(
                        (
                            decodedData / 100
                        ) + 1
                    )
                    
                    DispatchQueue.main.async {
                        self.isError = false
                        let resVal = (self.amountDbl * rate).formatted(.number.rounded(increment: 0.01).grouping(.automatic))
                        self.res = resVal
                        self.isUploading = false
                    }
                } catch {
                    self.isError = true
                    self.isUploading = false
                }
                
                
        }.resume()
        
    }
}

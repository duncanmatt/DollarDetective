//
//  FoodPricesViewModel.swift
//  DollarDetective
//
//  Created by Matt Duncan on 10/16/24.
//
import Foundation
import Combine

let itemsDict: Dictionary<String, String> = [
    "sliced bacon": "704111",
    "bananas": "711211",
    "american cheese": "710211",
    "cheddar cheese": "710212",
    "all purpose flour": "701111",
    "ground beef": "703112",
    "lemons": "711412",
]

let itemsArr = Array(itemsDict.keys)

class FoodPricesViewModel : ObservableObject {
    @Published var selected : String = "ground beef"
    @Published var month : String = "December"
    @Published var year : String = "2024"
    @Published var res : String = "0.0"
    @Published var searchQuery: String = ""
    @Published var items : [String] = itemsArr
    @Published var searchIsActive : Bool = false
    @Published var isUploading : Bool = false
    @Published var isError : Bool = false
    
    func toggleSearch() {
        return self.searchIsActive.toggle()
    }
    
    private func formatItem(_ item: String) -> String {
        if let itemCode = itemsDict[item] {
            return itemCode
        }
        return ""
    }
    
    private func formatMonth(_ month: String) -> String {
        if let monthVal = months[month] {
            return monthVal
        }
        return ""
    }
    
    func filterItems(_ query: String) -> Void {
        if query.count > 1 {
            let filtered: [String] = itemsArr.filter({ $0.contains(query) })
            self.items = filtered
        } else {
            self.items = itemsArr
        }
    }

    
    func fetch() async {
        DispatchQueue.main.async {
            self.isUploading = true
            
            guard let url = URL(
                string: "https://l3x75qqjdh.execute-api.us-east-2.amazonaws.com/api/food?item=\(self.formatItem(self.selected))&period=\(self.formatMonth(self.month))_\(self.year)") else {
                self.isError = true
                self.isUploading = false
                return
            }
            
            var req = URLRequest(
                url: url
            )
            req.httpMethod = "GET"
            req.addValue(
                "application/json",
                forHTTPHeaderField: "Content-Type"
            )
            
            URLSession.shared.dataTask(with: req) { data, response, error in
                guard let data = data, error == nil else {
                    DispatchQueue.main.async {
                        self.isError = true
                        self.isUploading = false
                    }
                    return
                }
                
                
                do {
                    let decodedRes = try JSONDecoder().decode(FoodPricesRes.self, from: data)
                    let decodedData = decodedRes.data
                    
                    DispatchQueue.main.async  {
                        self.isError = false
                        self.res = String(format: "%.2f", decodedData)
                        self.isUploading = false
                    }
                } catch let error {
                    DispatchQueue.main.async {
                        self.isError = true
                        self.isUploading = false
                    }
                    print("ERROR: \(error)")
                }
                
            }.resume()
        }
    }
}

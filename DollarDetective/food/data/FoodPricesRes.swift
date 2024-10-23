//
//  FoodPricesRes.swift
//  DollarDetective
//
//  Created by Matt Duncan on 10/16/24.
//

import Foundation

struct FoodPricesRes: Decodable {
    enum data: Double, Decodable {
        case swift, combine, debugging, xcode
    }
    var data: Double
}

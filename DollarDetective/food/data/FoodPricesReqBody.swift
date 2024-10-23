//
//  FoodPricesReqBody.swift
//  DollarDetective
//
//  Created by Matt Duncan on 10/16/24.
//

import Foundation

struct FoodPricesReqBody: Codable, Identifiable {
    var id: UUID
    var year : String
    var month : String
    var item : String
}

//
//  InflationCalculation.swift
//  DollarDetective
//
//  Created by Matt Duncan on 10/14/24.
//

import Foundation

struct InflationCalcResBody { var data: Int }

struct InflationCalculationRes: Decodable {
    enum data: Double, Decodable {
        case swift, combine, debugging, xcode
    }
    var data: Double
}

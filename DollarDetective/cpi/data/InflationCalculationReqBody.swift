//
//  InflationCalculationReqBody.swift
//  DollarDetective
//
//  Created by Matt Duncan on 10/14/24.
//

import Foundation

struct InflationCalculationReqBody: Codable, Identifiable {
    var id: UUID
    var startMonth : String
    var startYear : String
    var endMonth : String
    var endYear : String
    var seriesId : String
}

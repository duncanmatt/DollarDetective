//
//  FoodPeriodPickerView.swift
//  DollarDetective
//
//  Created by Matt Duncan on 10/14/24.
//

import SwiftUI

struct FoodPeriodPickerView: View {
    @Binding var month : String
    @Binding var year : String
    @Binding var res : String
    
    let months : [String] = [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"
    ]
    
    let years : [String] = [
        "1984",
        "1985",
        "1986",
        "1987",
        "1988",
        "1989",
        "1990",
        "1991",
        "1992",
        "1993",
        "1994",
        "1995",
        "1996",
        "1997",
        "1998",
        "1999",
        "2002",
        "2003",
        "2004",
        "2005",
        "2006",
        "2007",
        "2008",
        "2009",
        "2010",
        "2011",
        "2012",
        "2013",
        "2014",
        "2015",
        "2016",
        "2017",
        "2018",
        "2019",
        "2020",
        "2021",
        "2022",
        "2023",
        "2024",
    ]
    
    var body: some View {
        HStack(spacing: 0) {
            Picker("Month", selection: $month) {
                ForEach(months, id: \.self) { month in
                    Text(month)
                        .foregroundStyle(.mainText)
                }
            }
            .background(.accent)
            .onChange(of: month, { prev, curr in
                self.res = ""
            })
            Picker("Year", selection: $year) {
                ForEach(years, id: \.self) { year in
                    Text(verbatim: year)
                        .foregroundStyle(.mainText)
                }
            }
            .background(.accent)
            .onChange(of: year, { prev, curr in
                self.res = ""
            })
        }
        .pickerStyle(.wheel)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 11, height: 11)))
    
    }
}

//#Preview {
//    FoodPeriodPickerView()
//}

//
//  ItemAndPeriod.swift
//  DollarDetective
//
//  Created by Matt Duncan on 10/23/24.
//

import SwiftUI

struct ItemAndPeriod: View {
    @Binding var searchIsActive : Bool
    @Binding var selected : String
    @Binding var month : String
    @Binding var year : String
    @Binding var res : String
    @Binding var items : [String]
    @Binding var searchQuery : String
    
    var filterFn : (String) -> Void
    
    @FocusState var isInputFocused : Bool
    
    var body: some View {
        Button(action: {
            withAnimation {
                searchIsActive.toggle()
            }
            
        }, label: {
            HStack {
                Text(selected)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .padding(.leading)
                Spacer()
                Image(systemName:
                        searchIsActive ? "chevron.up" : "chevron.down")
                .foregroundStyle(.white)
                .fontWeight(.semibold)
                .scaledToFit()
                .padding(.trailing)
            }
            .frame(width: .infinity, height: 55)
            .contentShape(Rectangle())
        })
        .background(.accent)
        .clipShape(.rect(cornerRadius: 11))
        .buttonStyle(.plain)
                
        VStack {
            HStack {
                Text("in \(month) \(year)")
                    .font(.title2)
                    .frame(minHeight: 50, alignment: .leading)
                Spacer()
            }
            .padding(.leading, 10)
            FoodPeriodPickerView(month: $month, year: $year, res: $res)
                .padding(.top)
        }
        .overlay {
            if searchIsActive {
                ItemSearchSelect(selected: $selected, searchQuery: $searchQuery, res: $res, items: $items, searchIsActive:$searchIsActive, filterFn: filterFn, isInputFocused: _isInputFocused)
                        .id("item list")
                        .transition(.move(edge: searchIsActive ? .top : .bottom))
                    
                }
                
            }
            .zIndex(2)
            .clipShape(.rect(topLeadingRadius: 0,
                             bottomLeadingRadius: searchIsActive ? 11 : 0,  bottomTrailingRadius:  searchIsActive ? 11 : 0,  topTrailingRadius: 0))
            .offset(CGSize(width: 0, height: -15))
    }
}

//#Preview {
//    ItemAndPeriod()
//}

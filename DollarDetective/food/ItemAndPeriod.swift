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
                    .foregroundStyle(.mainText)
//                    .padding(.leading, 1)
                Spacer()
                Image(systemName:
                        searchIsActive ? "chevron.up" : "chevron.down")
                .foregroundStyle(.mainText)
                .fontWeight(.semibold)
                .scaledToFit()
            }
            .contentShape(Rectangle())
        })
        .padding()
        .background(.accent)
        .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 11, bottomLeading: searchIsActive ? 0 : 11, bottomTrailing: searchIsActive ? 0 : 11, topTrailing: 11)))
        .buttonStyle(.plain)
                
        VStack {
            HStack {
                Text("in \(month) \(year)")
                    .font(.title2)
                    .frame(minHeight: 52, alignment: .center)
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
        .zIndex(searchIsActive ? 2 : 0)
        .clipShape(.rect(topLeadingRadius: 0,
                             bottomLeadingRadius: searchIsActive ? 11 : 0,  bottomTrailingRadius:  searchIsActive ? 11 : 0,  topTrailingRadius: 0))
            .offset(CGSize(width: 0, height: -15))
    }
}

//#Preview {
//    ItemAndPeriod()
//}

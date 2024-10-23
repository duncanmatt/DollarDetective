//
//  ItemSearchSelect.swift
//  DollarDetective
//
//  Created by Matt Duncan on 10/16/24.
//

import SwiftUI

struct ItemSearchSelect: View {
    @Binding var selected: String
    @Binding var searchQuery: String
    @Binding var res : String
    @Binding var items: [String]
    @Binding var searchIsActive : Bool
    var filterFn : (String) -> Void
    
    @FocusState var isInputFocused : Bool
    
    
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search", text: $searchQuery)
                    .padding()
                    .focused($isInputFocused)
                    .background(.accent)
                    .onChange(of: searchQuery) { prev, curr in
                        self.filterFn(curr.lowercased())
                    }
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.white)
                    .padding(.trailing)
            }
            Divider()
                .frame(minHeight: 2)
                .overlay(Color.white)
            
            List(items, id: \.self) { item in
                Button(action: {
                    if item != selected {
                        selected = item
                        self.res = ""
                    }
                    
                    withAnimation {
                        searchIsActive.toggle()
                    }
                }, label: {
                    Text(item)
                        .font(.headline)
                        .foregroundStyle(.white)
                })
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.accent)
                .listRowInsets(.init())
                .environment(\.defaultMinListRowHeight, 0)
            }
            .listStyle(.plain)
            
            
        }
        .background(.accent)
    }
}

//#Preview {
//    ItemSearchSelect()
//}

//
//  ItemListView.swift
//  Trading (iOS)
//
//  Created by 廣中 雅大 on 2021/02/12.
//

import SwiftUI

enum ItemList: CaseIterable {
    case stocksList, autoTrading
    
    var title: String {
        switch self {
        case .stocksList: return "Stocks List"
        case .autoTrading: return "Auto Trading"
        }
    }
    
//    var view: View {
//        switch self {
//        case .stocksList: return StocksListView()
//        case .autoTrading: return AutoTradingView()
//        }
//    }
}

struct ItemListView: View {
    
    var body: some View {
        NavigationView {
            List(0..<ItemList.allCases.count) { localIndex in
                NavigationLink(destination: StocksListView(stocksList: StocksList())) {
                    Text("\(localIndex+1). \(ItemList.allCases[localIndex].title)")
                }
            }
            .navigationBarTitle("Item List")
        }
    }
}

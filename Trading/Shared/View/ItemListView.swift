//
//  ItemListView.swift
//  Trading (iOS)
//
//  Created by 廣中 雅大 on 2021/02/12.
//

import SwiftUI

struct Item<T: View> {
    let title: String
    let view: T
}

struct ItemListView: View {
    
    let items = [
        Item(title: "Stocks List", view: StocksListView(stocksList: StocksList())),
        Item(title: "Auto Trading", view: StocksListView(stocksList: StocksList()))
    ]

    var body: some View {
        NavigationView {
            List(0..<items.count) { localIndex in
                NavigationLink(destination: items[localIndex].view) {
                    Text("\(localIndex). \(items[localIndex].title)")
                }
            }
            .navigationBarTitle("Item List")
        }
    }
}

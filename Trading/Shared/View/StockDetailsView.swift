//
//  StockDetailsView.swift
//  Trading (iOS)
//
//  Created by 廣中 雅大 on 2021/02/12.
//

import SwiftUI

struct StockDetailsView: View {
    let name: String
    let stock: Stock
    
    var body: some View {
        List {
            Text("株価: \(stock.detail?.currentPrice ?? "0")")
        }
        .navigationBarTitle(stock.name ?? "\(stock.detail?.name ?? "")") // 後々、修正必要かも
    }
}

//
//  Stock.swift
//  Trading (iOS)
//
//  Created by 廣中 雅大 on 2021/02/12.
//

import Foundation

class Stock: Identifiable {
    
    let id: Int
    let name: String?
    var detail: StockDetail?
    
    init(id: Int, name: String?) {
        let stockDetail = StockDetail(id: id)
        self.detail = stockDetail
        self.id = id
        if (name != nil) { // 後々、修正必要かも
            self.name = name
        } else {
            self.name = stockDetail.name
        }
    }
}

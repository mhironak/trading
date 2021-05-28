//
//  StocksList.swift
//  Trading (iOS)
//
//  Created by 廣中 雅大 on 2021/02/12.
//

import Foundation

class StocksList: ObservableObject {
    @Published var items: [Stock] = [
        Stock(id: 4689, name: "Zホールディングス"),
        Stock(id: 9984, name: "ソフトバンクグループ"),
        Stock(id: 3938, name: "LINE"),
        Stock(id: 3092, name: "ZOZO"),
    ]
}

//
//  StockDetail.swift
//  Trading (iOS)
//
//  Created by 廣中 雅大 on 2021/02/12.
//

import Foundation
import Alamofire
import Kanna

class StockDetail: ObservableObject {
    let kabutanDomain = "https://kabutan.jp"
    let kabutanDir = "/stock/"
    let kabutanParam = "?code="
    
    let id: Int
    var name: String?
    var currentPrice: String?
    var marketCapitalization: String?
    
    init(id: Int?) {
        self.id = id ?? 0
        getStockInformation()
    }
    
    private func getStockInformation() {
        let url = kabutanDomain + kabutanDir + kabutanParam + String(id)
        
        AF.request(url).responseString { response in
            guard let html = response.value else {
                return
            }
            
            guard let doc = try? HTML(html: html, encoding: .utf8) else {
                return
            }
            
            self.name = self.scrapeName(doc: doc)
            self.currentPrice = self.scrapeCurrnetPrice(doc: doc)
        }
    }
    
    private func scrapeCurrnetPrice(doc: HTMLDocument) -> String? {
        
        return doc.xpath("//span[@class='kabuka']").first?.text
    }

    private func scrapeName(doc: HTMLDocument) -> String? {
        let text = doc.xpath("//div[@class='si_i1_1']/h2").first?.text
        return text?.replacingOccurrences(of: String(self.id), with: "")
    }
}

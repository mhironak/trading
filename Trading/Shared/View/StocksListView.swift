//
//  StocksListView.swift
//  Trading (iOS)
//
//  Created by 廣中 雅大 on 2021/02/12.
//

import SwiftUI

struct StocksListView: View {
    @Environment(\.editMode) var editMode
    @ObservedObject var stocksList: StocksList
    @State var addStockName = ""
    
    
    var body: some View {
        VStack(alignment: .leading) {
            if editMode?.wrappedValue.isEditing == true {
                VStack(alignment: .leading) {
                    HStack {
                        TextField("追加する銘柄コードを入力", text: $addStockName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button(action: {
                            self.stocksList.items.append(Stock(id: Int(self.addStockName) ?? 0, name: nil))
                            self.addStockName = ""
                        }) {
                            Text("Add")
                                .bold()
                        }
                    }
                }.padding([.leading, .trailing])
            }
            List {
                ForEach(stocksList.items) { stock in
                    NavigationLink(destination: StockDetailsView(name: stock.name ?? "", stock: stock)) {
                        Text("\(String(stock.id)): \(stock.name ?? "\(stock.detail?.name ?? "Now Loading ...")")") // 後々、修正必要かも
                    }
                }
                .onDelete(perform: delete)
                .onMove(perform: onMove)
            }
            .navigationBarTitle("Stocks List")
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    private func onEdit() {
        
    }
    
    private func onAdd() {
        stocksList.items.append(Stock(id: 0, name: "Add Stock"))
    }
    
    private func delete(at offsets: IndexSet) {
        stocksList.items.remove(atOffsets: offsets)
    }
    
    private func onMove(source: IndexSet, destination: Int) {
        stocksList.items.move(fromOffsets: source, toOffset: destination)
    }
}

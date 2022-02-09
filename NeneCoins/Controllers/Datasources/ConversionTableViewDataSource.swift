//
//  ConversionTableViewDataSource.swift
//  NeneCoins
//
//  Created by Gabriel Ferreira de Carvalho on 07/02/22.
//

import UIKit

class ConversionTableViewDataSource: NSObject, UITableViewDataSource {
    var toCoin: Coin
    var fromCoin: Coin
    
    init(fromCoin: Coin, toCoin: Coin){
        self.toCoin = toCoin
        self.fromCoin = fromCoin
    }
    
    func invertData() {
        let previousTo = self.fromCoin
        self.fromCoin = self.toCoin
        self.toCoin = previousTo
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConversionView.cellIdentifier, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = coin(for: indexPath)
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        
        cell.backgroundColor = .secondarySystemBackground
        return cell
    }
    private func coin(for indexPath: IndexPath) -> String {
        if indexPath.row == 0 {
            return "From: \(self.fromCoin.name)"
        }
        else{
            return "To: \(self.toCoin.name)"
        }
    }
    
}

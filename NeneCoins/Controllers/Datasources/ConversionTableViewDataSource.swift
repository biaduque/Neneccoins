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
    
    init(fromCoin: Coin, toCoin: Coin) {
        self.fromCoin = fromCoin
        self.toCoin = toCoin
    }
    
    func invertData() {
        let previousFrom = fromCoin
        fromCoin = toCoin
        toCoin = previousFrom
    }
    
    func changeCoin(to coin: Coin, at indexPath: IndexPath) {
        if indexPath.row == 0 {
            fromCoin = coin
        } else {
            toCoin = coin
        }
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
        if indexPath.row == 0  {
            return "From: \(fromCoin.name)"
        } else {
            return "To: \(toCoin.name)"
        }
    }
}

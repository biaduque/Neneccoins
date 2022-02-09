//
//  ConversionTableViewDataSource.swift
//  NeneCoins
//
//  Created by Gabriel Ferreira de Carvalho on 07/02/22.
//

import UIKit

class ConversionTableViewDataSource: NSObject, UITableViewDataSource {
    private var data: [Coin] = []
    
    var toCoin: Coin {
        data[0]
    }
    
    var fromCoin: Coin {
        data[1]
    }
    
    func startUp(with coins: [Coin]) {
        data = coins
    }
    
    func invertData() {
        if data.count < 2 {
            return
        }
        
        let previousTo = data[0]
        data[0] = data[1]
        data[1] = previousTo
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConversionView.cellIdentifier, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = data[indexPath.row].name
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        
        cell.backgroundColor = .secondarySystemBackground
        return cell
    }
}

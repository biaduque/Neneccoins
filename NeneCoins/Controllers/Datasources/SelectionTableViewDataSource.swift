//
//  SelectionTableViewDataSource.swift
//  NeneCoins
//
//  Created by Gabriel Ferreira de Carvalho on 08/02/22.
//

import Foundation
import UIKit

class SelectionTableViewDataSource: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SelectionView.cellIdentifier, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = "IMPLEMENTAR!!!"
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        
        cell.backgroundColor = .secondarySystemBackground
        return cell
    }
    
    
}

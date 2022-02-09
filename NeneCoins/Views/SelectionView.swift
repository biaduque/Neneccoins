//
//  SelectionView.swift
//  NeneCoins
//
//  Created by Gabriel Ferreira de Carvalho on 08/02/22.
//

import Foundation
import UIKit

class SelectionView: UIView {
    
    static var cellIdentifier: String = "SelectionViewCell"
    
    private let selectionTable: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: SelectionView.cellIdentifier)
        table.backgroundColor = .systemBackground
        return table
    }()
    
    init() {
        super.init(frame: .zero)
        setupHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        addSubview(selectionTable)
        
    }
    
    private func setupConstraints() {
        let selectionTableConstraints: [NSLayoutConstraint] = [
            selectionTable.topAnchor.constraint(equalTo: topAnchor),
            selectionTable.leadingAnchor.constraint(equalTo: leadingAnchor),
            selectionTable.trailingAnchor.constraint(equalTo: trailingAnchor),
            selectionTable.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(selectionTableConstraints)
    }
    
    func setupViewBindings(dataSource: UITableViewDataSource, tableViewDelegate: UITableViewDelegate) {
        selectionTable.dataSource = dataSource
    }
}

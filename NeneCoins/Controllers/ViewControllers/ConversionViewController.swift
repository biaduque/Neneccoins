//
//  ViewController.swift
//  NeneCoins
//
//  Created by Gabriel Ferreira de Carvalho on 07/02/22.
//

import UIKit

class ConversionViewController: UIViewController {
    
    private var toCoin: Coin
    private var fromCoin: Coin
    
    private var contentView: ConversionView
    private var dataSource: ConversionTableViewDataSource
    
    init(fromCoin: Coin, toCoin: Coin) {
        self.fromCoin = fromCoin
        self.toCoin = toCoin
        self.contentView = ConversionView(frame: .zero)
        self.dataSource = ConversionTableViewDataSource()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationStyle()
        contentView.setupViewBindings(dataSource: dataSource)
    }
    
    private func setupNavigationStyle() {
        title = "Nenecoins"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}


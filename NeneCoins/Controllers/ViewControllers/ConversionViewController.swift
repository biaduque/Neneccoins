//
//  ViewController.swift
//  NeneCoins
//
//  Created by Gabriel Ferreira de Carvalho on 07/02/22.
//

import UIKit

class ConversionViewController: UIViewController {
    private var contentView: ConversionView
    private var dataSource: ConversionTableViewDataSource
    
    init(fromCoin: Coin, toCoin: Coin) {
        self.contentView = ConversionView(frame: .zero)
        self.dataSource = ConversionTableViewDataSource(fromCoin: fromCoin, toCoin: toCoin)
        
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
        contentView.setupViewBindings(dataSource: dataSource, tableViewDelegate: self)
        contentView.delegate = self
    }
    
    private func setupNavigationStyle() {
        title = "Nenecoins"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func convertToReal(value: Double, coin: Coin) -> Double {
        let real = (value * coin.conversionFactor)
        return real
    }
    
    private func convertReal(to coin: Coin, value: Double) -> Double {
        let convertedValue = (value / coin.conversionFactor)
        return convertedValue
    }
}

extension ConversionViewController: ConversionViewDelegate {
    func didTapInvert() {
        dataSource.invertData()
        contentView.updateCoinsTable()
        //ATUALIZAR TELA E DATASOURCE DA TABLE1VIEW
    }
    
    func didType(_ content: String) {
        guard let value = Double(content) else { return }
        let real = convertToReal(value: value, coin: dataSource.fromCoin)
        let coin = convertReal(to: dataSource.toCoin, value: real)
        
        contentView.updateResultLabel(with: coin, for: dataSource.toCoin)
    }
}

extension ConversionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectionViewController = SelectionViewController(titulo: coinTitle(for: indexPath))
        navigationController?.pushViewController(selectionViewController, animated: true)
    }
    
    private func coinTitle(for indexPath: IndexPath) -> String{
        if indexPath.row == 0 {
            return "From"
        }
        else{
            return "To"
        }
    }
}

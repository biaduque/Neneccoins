//
//  SelectionViewController.swift
//  NeneCoins
//
//  Created by Beatriz Duque 09/02/22.
//

import UIKit

class SelectionViewController: UIViewController {
    private var contentView: SelectionView
    private var dataSource: SelectionTableViewDataSource
    
    weak var delegate: SelectionViewControllerDelegate?
    
    init(title: String) {
        self.contentView = SelectionView()
        self.dataSource = SelectionTableViewDataSource(coins: CoinRepository.shared.fetchAllCoins())
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.setupViewBindings(dataSource: dataSource, tableViewDelegate: self)
    }
    
    private func setupNavigationStyle() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}

extension SelectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /// PASSAMOS PARA A TELA ANTERIOR O CONTEUDO SELECIONADO NA TABELA DE ACORDO COM O CLIQUE DO USUARIO
        delegate?.didSelect(coin: dataSource.contentCoin[indexPath.row])
        navigationController?.popViewController(animated: true)
    }
}

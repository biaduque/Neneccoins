//
//  SelectionViewController.swift
//  NeneCoins
//
//  Created by Beatriz Duque on 09/02/22.
//

import UIKit

class SelectionViewController: UIViewController {
    private var contentView: SelectionView
    private var dataSource: SelectionTableViewDataSource
    
    init(titulo: String){
        self.contentView = SelectionView()
        self.dataSource = SelectionTableViewDataSource()
        super.init(nibName: nil, bundle: nil)
        title = titulo
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
        contentView.setupViewBindings(dataSource: self.dataSource)
    }
    private func setupNavigationStyle() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}

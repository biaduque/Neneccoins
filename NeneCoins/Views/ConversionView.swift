//
//  ConversionView.swift
//  NeneCoins
//
//  Created by Gabriel Ferreira de Carvalho on 07/02/22.
//

import Foundation
import UIKit

class ConversionView: UIView {
    
    static var cellIdentifier: String = "ConversionViewCell"
    
    private let invertButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "repeat"), for: .normal)
        button.setTitle(" invert", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.imageView?.tintColor = .systemBlue
        return button
    }()
    
    private let coinsTableView: UITableView = {
        var table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: ConversionView.cellIdentifier)
        table.isScrollEnabled = false
        table.backgroundColor = .clear
        table.separatorColor = .clear
        table.layer.cornerRadius = 10
        table.rowHeight = 45
        
        return table
    }()
    
    private let inputTextField: UITextField = {
        var tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 10
        tf.backgroundColor = .secondarySystemBackground
        tf.leftViewMode = .always
        tf.keyboardType = .decimalPad
        tf.placeholder = "3,14"
        
        return tf
    }()
    
    private let inputLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "IMPL"
        label.frame =  CGRect(x: 18, y: 0, width: 45, height: 45)
        return label
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        label.backgroundColor = .secondarySystemBackground
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        
        label.numberOfLines = 0
        
        let value = NSMutableAttributedString(string: "Your result is: \nIMPL 00.00")
        if let range = value.string.range(of: "IMPL 00.00") {
            let nsRange = NSRange(range, in: value.string)
            value.addAttribute(NSAttributedString.Key.font, value: UIFont.preferredFont(forTextStyle: .title3), range: nsRange)
            label.attributedText = value
        } else {
            print("failed")
        }
        
        return label
    }()
    
    weak var delegate: ConversionViewDelegate?
    
    func setupViewBindings(dataSource: UITableViewDataSource, tableViewDelegate: UITableViewDelegate) {
        coinsTableView.dataSource = dataSource
        inputTextField.delegate = self
        invertButton.addTarget(self, action: #selector(didTypeInvert), for: .touchUpInside)
        coinsTableView.delegate = tableViewDelegate
        //COLOCAR AQUI OUTRAS CONEXÕES DA VIEW
        
    }
    
    func updateCoinsTable() {
        coinsTableView.reloadData()
    }
    
    func updateInputLabel(with abbreviation: String) {
        inputLabel.text = abbreviation
    }
    
    func updateResultLabel(with result: Double, for coin: Coin) {
        let attributedText = NSMutableAttributedString(string: "Your result is: \n\(coin.abbreviation) \(result)")
        guard let range = attributedText.string.range(of: "\(coin.abbreviation) \(result)") else { return }
        
        let nsRange = NSRange(range, in: attributedText.string)
        attributedText.addAttribute(NSAttributedString.Key.font,
                                    value: UIFont.boldSystemFont(ofSize: 26),
                                    range: nsRange)
        resultLabel.attributedText = attributedText
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupConstraints()
        backgroundColor = .systemBackground
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        addSubview(coinsTableView)
        addSubview(inputTextField)
        addSubview(invertButton)
        addSubview(resultLabel)
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 63, height: 45))
        leftView.addSubview(inputLabel)
        
        inputTextField.leftView = leftView
        
    }
    
    private func setupConstraints() {
        let buttonConstraints: [NSLayoutConstraint] = [
            invertButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            invertButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -24),
            invertButton.heightAnchor.constraint(equalToConstant: 44)
        ]
        
        NSLayoutConstraint.activate(buttonConstraints)
        
        let tableViewConstraints: [NSLayoutConstraint] = [
            coinsTableView.topAnchor.constraint(equalTo: invertButton.bottomAnchor, constant: 8),
            coinsTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 18),
            coinsTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -18),
            coinsTableView.heightAnchor.constraint(equalToConstant: 90)
        ]
        
        NSLayoutConstraint.activate(tableViewConstraints)
        
        let textFieldConstraints: [NSLayoutConstraint] = [
            inputTextField.topAnchor.constraint(equalTo: coinsTableView.bottomAnchor, constant: 8),
            inputTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 18),
            inputTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -18),
            inputTextField.heightAnchor.constraint(equalToConstant: 45)
        ]
        
        NSLayoutConstraint.activate(textFieldConstraints)
        
        let resultLabelConstraints: [NSLayoutConstraint] = [
            resultLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 18),
            resultLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -18),
            resultLabel.topAnchor.constraint(equalTo: inputTextField.bottomAnchor, constant: 8),
            resultLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3)
        ]
        
        NSLayoutConstraint.activate(resultLabelConstraints)
    }
    
    @objc
    func didTypeInvert() {
        delegate?.didTapInvert()
    }
}

extension ConversionView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var text = textField.text ?? ""
        
        if range.upperBound == range.lowerBound {
            text.append(string)
        } else if range.upperBound > range.lowerBound {
            text.removeLast()
        }
        
        text = text.replacingOccurrences(of: ",", with: ".")
        
        if text.isEmpty {
            delegate?.didType("0")
            return true
        }
        
        if Double(text) == nil {
            return false
        }
        
        delegate?.didType(text)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(false)
    }
}

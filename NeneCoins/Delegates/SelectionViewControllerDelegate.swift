//
//  SelectionViewControllerDelegate.swift
//  NeneCoins
//
//  Created by Beatriz Duque on 09/02/22.
//

import Foundation

protocol SelectionViewControllerDelegate: AnyObject{
    func didSelect(coin: Coin)
}

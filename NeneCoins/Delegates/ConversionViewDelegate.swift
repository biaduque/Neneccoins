//
//  ConversionViewDelegate.swift
//  NeneCoins
//
//  Created by Gabriel Ferreira de Carvalho on 09/02/22.
//

import Foundation

protocol ConversionViewDelegate: AnyObject {
    func didTapInvert()
    func didType(_ content: String)
}

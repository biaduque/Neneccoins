//
//  CoinRepository.swift
//  NeneCoins
//
//  Created by Gabriel Ferreira de Carvalho on 07/02/22.
//

import Foundation

class CoinRepository {
    
    static var shared: CoinRepository = CoinRepository()
    
    private var coins: [Coin] = [
        Coin(name: "Real", abbreviation: "BRL", conversionFactor: 1),
        Coin(name: "Dólar", abbreviation: "$", conversionFactor: 5.23),
        Coin(name: "Euro", abbreviation: "EUR", conversionFactor: 5.99),
        Coin(name: "Bitcoin", abbreviation: "BTC", conversionFactor: 237050.08),
        Coin(name: "Ethereum", abbreviation: "ETH", conversionFactor: 16792.13),
        Coin(name: "Cardano", abbreviation: "ADA", conversionFactor: 6.24),
        Coin(name: "Elrond", abbreviation: "EGLD", conversionFactor: 492.85),

    ]
    
    func fetchAllCoins() -> [Coin] {
        return coins 
    }
    
    func fetchInitialData() -> (fromCoin: Coin, toCoin: Coin) {
        return (coins[0], coins[1])
    }
}

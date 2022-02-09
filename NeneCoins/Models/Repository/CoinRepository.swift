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
        Coin(name: "Rebeccoin", abbreviation: "RBC", conversionFactor: 12.51),
        Coin(name: "Real", abbreviation: "BRL", conversionFactor: 1),
        Coin(name: "Bahiaccoin", abbreviation: "BHC", conversionFactor: 5.71),
        Coin(name: "Carolcooin", abbreviation: "CLC", conversionFactor: 10.45),
        Coin(name: "Chevisccoin", abbreviation: "CVC", conversionFactor: 9.14),
        Coin(name: "Nathccoin", abbreviation: "NTC", conversionFactor: 10.13),
        Coin(name: "Aleccoin", abbreviation: "ALE", conversionFactor: 7.20),

    ]
    
    func fetchAllCoins() -> [Coin] {
        return coins 
    }
    
    func fetchInitialData() -> (fromCoin: Coin, toCoin: Coin) {
        (Coin(name: "IMPLEMENTAR FROM", abbreviation: "IMPLF", conversionFactor: 1),
         Coin(name: "IMPLEMENTAR TO", abbreviation: "IMPLT", conversionFactor: 2))
    }
}

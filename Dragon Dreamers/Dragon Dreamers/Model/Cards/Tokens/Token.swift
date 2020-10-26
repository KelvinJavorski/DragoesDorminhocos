//
//  Token.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 23/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Token : TokenProtocol{
    var name: String
    var amount: Int
    var way: Ways
    
    init(name: String, amount: Int, way: Ways) {
        self.name = name
        self.amount = amount
        self.way = way
    }
    
    func increaseAmount(amount: Int) {
        self.amount += amount
    }
    
    func decreaseAmount(amount: Int) {
        self.amount -= amount
    }
}

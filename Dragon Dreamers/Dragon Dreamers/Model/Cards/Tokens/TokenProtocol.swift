//
//  TokenProtocol.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 23/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

protocol TokenProtocol{
    var amount : Int {get set}
    
    func increaseAmount(amount: Int)
    
    func decreaseAmount(amount: Int)
}

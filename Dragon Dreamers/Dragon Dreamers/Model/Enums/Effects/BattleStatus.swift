//
//  BattleStatus.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 07/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

enum BattleStatus : Int, CaseIterable{
    case vulnerable = 0
    case blue = 1
    case green = 2
    case red = 3
    case yellow = 4
    
    case doubleCard = 5
    case reasoning = 6
}

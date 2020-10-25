//
//  BattleStatus.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 07/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

enum BattleStatus : Int, CaseIterable, CustomStringConvertible{
    case vulnerable = 0
    case blue = 1
    case green = 2
    case red = 3
    case yellow = 4
    
    case doubleCard = 5
    case reasoning = 6
    
    var description: String{
        switch self {
        case .reasoning: return "Reasoning"
        case .vulnerable: return "Vulnerable"
        default: return ""
        }
    }
    
}

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
    case reasoning = 1
    case distant = 2
    case prevent = 3
    
    var description: String{
        switch self {
        case .reasoning: return "Reasoning"
        case .vulnerable: return "Vulnerable"
        default: return ""
        }
    }
    
}

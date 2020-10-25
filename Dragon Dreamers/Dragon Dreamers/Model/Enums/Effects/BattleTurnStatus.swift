//
//  BattleTurnStatus.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 13/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

enum BattleTurnStatus : Int, CaseIterable, CustomStringConvertible{
    case reasoning = 0
    case vulnerable = 1
    
    var description: String{
        switch self {
        case .reasoning: return "Reasoning"
        case .vulnerable: return "Vulnerable"
        }
    }
}

//
//  BattleStatus.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 07/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

enum BattleStatus : Int, CaseIterable, CustomStringConvertible{
    case desviar = 0
    case prevenir = 1
    case questionar = 2
    case examinar = 3
    case concordar = 4
    
    var description: String{
        switch self {
        case .desviar: return "Reasoning"
        case .prevenir: return "Vulnerable"
        case .questionar: return "Questionar"
        case .examinar: return "Examinar"
        case .concordar: return "Concordar"
        default: return ""
        }
    }
    
}

//
//  BattleEmotion.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 05/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

enum BattleEmotion: CaseIterable{
    case agree
    case avoid
    case questioning
    case criticize
    
    static func random<G: RandomNumberGenerator>(using generator: inout G) -> BattleEmotion {
        return BattleEmotion.allCases.randomElement(using: &generator)!
    }
    
    static func random() -> BattleEmotion {
        var g = SystemRandomNumberGenerator()
        return BattleEmotion.random(using: &g)
    }
}

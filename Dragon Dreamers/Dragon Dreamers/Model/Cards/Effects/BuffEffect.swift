//
//  BuffEffect.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 14/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class ApplyVulnerability: EffectProtocol{
    var name = "Vulnerability"
    func applyEffects(card: Card) {
        card.multiplier = 1.5
    }
}

class ApplyReasoning: EffectProtocol{
    var name = "Vulnerability"
    func applyEffects(card: Card) {
        let person = Player.shared
        person.currentTokens += person.amountInTurnEffect!
    }
}

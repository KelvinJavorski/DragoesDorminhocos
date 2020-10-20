//
//  SunEffects.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 20/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Provocar : EffectProtocol{
    func applyEffects(card: Card) {
        card.owner.currentTokens *= 2
    }
}

class Zombar : EffectProtocol{
    func applyEffects(card: Card) {
    }
}

class Incomodar : EffectProtocol{
    func applyEffects(card: Card) {
    }
}

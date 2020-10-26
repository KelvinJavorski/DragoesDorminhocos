//
//  SandEffects.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 23/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Desviar : EffectProtocol{
    func applyEffects(card: Card) {
        let opponent = card.owner.opponent
        opponent?.currentStatus.append(.distant)
    }
}

class Defender : EffectProtocol{
    func applyEffects(card: Card) {
        <#code#>
    }
}

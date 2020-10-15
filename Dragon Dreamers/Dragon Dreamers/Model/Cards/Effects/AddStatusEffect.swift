//
//  AddStatusEffect.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 14/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class AddPlayBlueCardTwiceStatus: EffectProtocol{
    func applyEffects(card: Card) {
        card.owner.currentStatus.append(.blue)
    }
}

class AddPlayGreenCardTwiceStatus: EffectProtocol{
    func applyEffects(card: Card) {
        card.owner.currentStatus.append(.green)
    }
}

class AddPlayRedCardTwiceStatus: EffectProtocol{
    func applyEffects(card: Card) {
        card.owner.currentStatus.append(.red)
    }
}

class AddPlayYellowCardTwiceStatus: EffectProtocol{
    func applyEffects(card: Card) {
        card.owner.currentStatus.append(.yellow)
    }
}

class AddReasoningStatus: EffectProtocol{
    func applyEffects(card: Card) {
        card.owner.currentStatus.append(.reasoning)
    }
}

class AddVulnerableStatus: EffectProtocol{
    func applyEffects(card: Card) {
        card.owner.currentStatus.append(.vulnerable)
    }
}

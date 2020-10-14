//
//  StatusAdditionEffects.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 09/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class PlayBlueCardTwice: EffectProtocol{
    func applyEffects(card: Card) {
        card.owner.currentStatus.append(.blue)
    }
}

class PlayGreenCardTwice: EffectProtocol{
    func applyEffects(card: Card) {
        card.owner.currentStatus.append(.green)
    }
}

class PlayRedCardTwice: EffectProtocol{
    func applyEffects(card: Card) {
        card.owner.currentStatus.append(.red)
    }
}

class PlayYellowCardTwice: EffectProtocol{
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

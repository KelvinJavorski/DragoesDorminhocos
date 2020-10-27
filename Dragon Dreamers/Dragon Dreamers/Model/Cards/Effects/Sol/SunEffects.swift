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
        let tokenType = Ways.sol
        let token = card.owner.tokens[tokenType.rawValue]
        token.increaseAmount(amount: token.amount)
    }
}

class Zombar : EffectProtocol{
    func applyEffects(card: Card) {
        let owner = card.owner
        let tokenType = Ways.sol
        let token = owner?.tokens[tokenType.rawValue]
        let handCardsAmount = owner?.hand.cards.count
        owner?.discardHand()
        token?.increaseAmount(amount: handCardsAmount!)
    }
}

class Incomodar : EffectProtocol{
    func applyEffects(card: Card) {
        let owner = Player.shared
        let tokenType = Ways.sol
        let token = owner.tokens[tokenType.rawValue]
        
        let randomWay = owner.getRandomWay(except: ["Sol"])
        randomWay.decreaseAmount(amount: token.amount)
    }
}

class Comandar : EffectProtocol{
    func applyEffects(card: Card) {
        let owner = card.owner!
        let tokenType = Ways.sol
        let token = owner.tokens[tokenType.rawValue]
        owner.currentCriticize += token.amount
    }
}

class SemNome : EffectProtocol{
    func applyEffects(card: Card) {
        let owner = card.owner!
        owner.tokens[Ways.sol.rawValue].decreaseAmount(amount: -1)
        owner.currentCriticize += 3
    }
}

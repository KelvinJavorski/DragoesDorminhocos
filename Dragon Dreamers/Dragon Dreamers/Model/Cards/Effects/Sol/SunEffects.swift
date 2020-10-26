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
        let owner = card.owner!
        let tokenType = Ways.sol
        let ways : [Ways] = [.areia, .brisa, .oceano]
        let token = owner.tokens[tokenType.rawValue]
        
        let randomNumber = Int.random(in: 0...2)
        let randomWay = ways[randomNumber]
        
        if randomWay == .areia{
            owner.currentAvoid -= token.amount
        }
        else if randomWay == .brisa{
            owner.currentQuestioning -= token.amount
        }
        else if randomWay == .oceano{
            owner.currentAgree -= token.amount
        }
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
        owner.tokens[Ways.sol.rawValue].amount -= 1
        owner.currentCriticize += 3
    }
}

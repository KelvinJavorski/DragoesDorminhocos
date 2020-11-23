//
//  SunEffects.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 20/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Reclamar : EffectProtocol{
    func applyEffects(card: Card) {
        let tokenType = Ways.sol
        let token = card.owner.tokens[tokenType.rawValue]
        token.increaseAmount(amount: token.amount)
    }
}

class Afirmar : EffectProtocol{
    func applyEffects(card: Card) {
        let owner = card.owner!
        let tokenType = Ways.sol
        let token = owner.tokens[tokenType.rawValue]
        let handCardsAmount = owner.hand.cards.count
        for card in owner.hand.cards{
            card.node.removeFromParent()
        }
        owner.discardHand()
        token.increaseAmount(amount: handCardsAmount)
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
        let owner = card.owner as! Player
        let tokenType = Ways.sol
        let token = owner.tokens[tokenType.rawValue]
        owner.sol.increaseAmount(amount: token.amount)
    }
}

class Criticar : EffectProtocol{
    func applyEffects(card: Card) {
        let owner = Player.shared
        owner.tokens[Ways.sol.rawValue].decreaseAmount(amount: -1)
        owner.sol.increaseAmount(amount: 3)
    }
}


//MARK: -CARTAS DA VÓ

class CriticarWeak: EffectProtocol{
    func applyEffects(card: Card) {
        let person = Player.shared
        person.sol.increaseAmount(amount: 1)
    }
}

class IncomodarWeak: EffectProtocol{
    func applyEffects(card: Card) {
        let person = Player.shared
        let randomWay = person.getRandomWay(except: ["Sol"])
        randomWay.decreaseAmount(amount: person.sol.current)
    }
}

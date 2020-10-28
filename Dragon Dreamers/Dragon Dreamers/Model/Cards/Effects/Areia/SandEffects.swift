//
//  SandEffects.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 23/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class DesviarStatus : EffectProtocol{
    func applyEffects(card: Card) {
        let opponent = card.owner.opponent!
        let status = Status(name: "Distante", duration: 1, target: opponent, effect: DesviarEffect())
        opponent.status.append(status)
    }
}

class DesviarEffect : EffectProtocol{
    func applyEffects(card: Card) {
        let person = Player.shared.opponent as! Enemy
        person.cardEffectBlocked = true
    }
}

class Defender : EffectProtocol{
    func applyEffects(card: Card) {
        let person = Player.shared
        let randomWay = person.getRandomWay(except: ["Areia"])
        randomWay.changeBlockStatus(true)
    }
}

class Fugir : EffectProtocol{
    func applyEffects(card: Card) {
        let person = card.owner!
        let count = person.hand.cards.count
        for card in person.hand.cards {
            card.node.removeFromParent()
        }
        person.discardHand()
        Player.shared.areia.increaseAmount(amount: count)
    }
}

class PrevenirStatus : EffectProtocol{
    func applyEffects(card: Card) {
        let person = card.owner!
        let status = Status(name: "Prevenir", duration: 1, target: person, effect: PrevenirEffect())
        person.status.append(status)
    }
}

class PrevenirEffect : EffectProtocol {
    func applyEffects(card: Card) {
        let person = Player.shared
        for card in person.hand.cards{
            card.node.removeFromParent()
        }
        Player.shared.discardHand()
        person.deck.cards.insert(contentsOf: person.lastHand.cards, at: 0)
//        person.deck.cards.append(contentsOf: person.lastHand.cards)
        person.scene.drawHandCards(5)
        //Não funciona ainda
    }
}

class Evitar : EffectProtocol{
    func applyEffects(card: Card) {
        let person = Player.shared
        person.areia.increaseAmount(amount: 1)
        for status in person.status{
            if status.name == "Distante"{
                status.increaseDuration(amount: 1)
                break
            }
        }
    }
}

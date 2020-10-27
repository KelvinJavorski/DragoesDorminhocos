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
        print("cancela efeito da proxima carta da vo")
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
        Player.shared.discardHand()
        person.hand.addCards(person.lastHand.cards)
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

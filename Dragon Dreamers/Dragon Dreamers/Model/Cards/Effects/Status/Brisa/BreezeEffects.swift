//
//  BreezeEffects.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 26/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Planejar : EffectProtocol{
    func applyEffects(card: Card) {
        let person = Player.shared
        let manas = ManaType.allCases
        var allMana = manas.filter { !$0.rawValue.contains("g") }
        
        var manaFound = false
        while(!manaFound){
            guard let randomMana = allMana.randomElement()
            else {
                return print("no mana left")
            }
            if person.manaManager.checkManaInPool(type: randomMana){
                let _ = person.manaManager.returnManaFromPoolToCollection(type: randomMana)
                let _ = person.manaManager.setManaInPool(type: ManaType.green)
                manaFound = true
                break
            }
            allMana = allMana.filter { $0.rawValue != randomMana.rawValue }
        }
        
    }
}

class QuestionarStatus : EffectProtocol{
    func applyEffects(card: Card) {
        let person = Player.shared.opponent!
        let status = Status(name: "Dúvida", duration: 1, target: person, effect: DuvidaEffect())
        person.status.append(status)
    }
}

class DuvidaEffect : EffectProtocol{
    var amount = 0
    func applyEffects(card: Card) {
        Player.shared.brisa.increaseAmount(amount: amount)
    }
    
    func setValue(amount: Int){
        self.amount = amount
    }
}

class Argumentar : EffectProtocol{
    func applyEffects(card: Card) {
        let person = card.owner as! Player
        let randomHandIndex = person.hand.getRandomCardIndex()
        let randomDeckIndex = person.deck.getRandomCardIndex()
        
        var handCard = person.hand.cards[randomHandIndex]
        var deckCard = person.deck.cards[randomDeckIndex]
        let auxCard = handCard
        handCard = deckCard
        deckCard = auxCard
        
//        deckCard.node.removeFromParent()
//        handCard.node = auxCard.node
//        handCard.node
        
        if person.status.contains(where: { $0.name == "Examinar" }){
            person.changeDeckOfCard(person.hand, person.discard, randomHandIndex)
            person.brisa.increaseAmount(amount: 1)
        }
    }
}

class ExaminarStatus : EffectProtocol{
    func applyEffects(card: Card) {
        let person = Player.shared
        let status = Status(name: "Examinar", duration: -1, target: person, effect: ExaminarEffect())
        person.status.append(status)
    }
}

class ExaminarEffect : EffectProtocol{
    func applyEffects(card: Card) {
        print("Examinar effect")
    }
}

class Comentar : EffectProtocol{
    func applyEffects(card: Card) {
        let person = Player.shared
        person.brisa.increaseAmount(amount: 1)
        for status in person.status{
            if status.name == "Dúvida"{
                status.increaseDuration(amount: 1)
                break
            }
        }
    }
}

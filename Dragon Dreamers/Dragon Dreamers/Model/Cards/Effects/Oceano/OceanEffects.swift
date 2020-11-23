//
//  OceanEffects.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 27/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Agradar : EffectProtocol{
    func applyEffects(card: Card) {
        let person = Player.shared
        let count = person.hand.cards.count
        let ocean = Ways.oceano.rawValue
        person.tokens[ocean].increaseAmount(amount: count/2)
    }
}

//class Elogiar : EffectProtocol{
//    func applyEffects(card: Card) {
//        <#code#>
//    }
//}

class ConcordarStatus : EffectProtocol{
    func applyEffects(card: Card) {
        let opponent = card.owner.opponent as! Enemy
        let status = Status(name: "Concordar", duration: 1, target: opponent, effect: ConcordarEffect(card: opponent.hand.cards[0]))
        opponent.currentAfterDrawStatus.append(status)
    }
}

class ConcordarEffect : EffectProtocol{
    init (card: Card){
        self.repeatedCard = card
    }
    
    var repeatedCard : Card!
    
    func applyEffects(card: Card) {
        let person = repeatedCard.owner as! Enemy
        
        if let aux = person.discard.cards.last{
            person.deck.addCard(person.hand.cards[0])
            person.hand.cards[0] = aux
        }
    }
}

class Aceitar : EffectProtocol{
    func applyEffects(card: Card) {
        let person = Player.shared
        let ocean = Ways.oceano.rawValue
        if person.tokens[ocean].amount >= 10{
            person.oceano.current = person.oceano.maxValue
        }
    }
}

class Aprovar : EffectProtocol{
    func applyEffects(card: Card) {
        let person = card.owner as! Player
        let ocean = Ways.oceano.rawValue
        person.oceano.increaseAmount(amount: 3)
        person.tokens[ocean].increaseAmount(amount: 1)
    }
}


//MARK: -CARTAS DA VÓ

class AprovarWeak : EffectProtocol{
    func applyEffects(card: Card) {
        let person = Player.shared
        person.oceano.increaseAmount(amount: 1)
    }
}

class AceitarWeak : EffectProtocol{
    func applyEffects(card: Card) {
        let person = Player.shared
        let ways = person.ways
        var maior = 0
        ways.forEach { (way) in
            if way.current > maior{ maior = way.current }
        }
        person.oceano.current = maior
        
    }
}

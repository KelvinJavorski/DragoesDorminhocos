//
//  CardEffect.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 21/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class CardEffect{
    var card : Card!
        
    init() {}
    
    func runEffects(card: Card, person: Person){
        switch card.effect {
            //Add a specific card to deck
            case .addCard:
                addCardToDeck(person: person, id: card.idEffect)
                break
            //Deal damage to a person (or self)
            case .dealDamage:
                dealDamage(person: person, damage: card.damage, type: card.damageType)
                break
            //Deal and take damage
            case .dealAndSufferDamage:
                dealAndSufferDamage(person: person, damage: card.damage, damageType: card.damageType, selfDamage: card.selfDamage, selfDamageType: card.selfDamageType)
                break
            //Heal an atribute
            case .heal:
                heal(person: person, healAmount: card.heal, type: card.healType)
                break
            default:
                break
        }
    }
    
    func addCardToDeck(person:Person,
                     id: Int){
        let cardsPool = person.cardsPool
        person.deck.addCard(cardsPool.cards[id])
    }
    
    func heal(person: Person,
             healAmount : Int,
             type: EnergyType){
        switch type {
            case .life:
                person.currentLife += healAmount
                break
            case .empathy:
                person.currentEmpathy += healAmount
                break
            case .reason:
                person.currentReason += healAmount
                break
            case .understanding:
                person.currentUnderstanding += healAmount
                break
        }
    }

    func dealDamage(person: Person,
                  damage : Int,
                  type: EnergyType){
        switch type {
            case .life:
               person.currentLife -= damage
               break
           case .empathy:
               person.currentEmpathy -= damage
               break
           case .reason:
               person.currentReason -= damage
               break
           case .understanding:
               person.currentUnderstanding -= damage
               break
        }
    }
    
    func dealAndSufferDamage(person: Person,
                          damage: Int,
                          damageType: EnergyType,
                          selfDamage: Int,
                          selfDamageType: EnergyType){
        
        dealDamage(person: person, damage: damage, type: damageType)
        dealDamage(person: person.opponent, damage: selfDamage, type: selfDamageType)
    }
    
}

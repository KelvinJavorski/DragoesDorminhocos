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
    
    func runEffects(card: Card){
        switch card.effect {
        case .addCard:
            addCardToDeck(id: card.idEffect)
            break
            
        case .dealDamage:
            dealDamage(damage: card.damage, type: card.damageType)
            break
            
        case .dealAndSufferDamage:
            dealAndSufferDamage(damage: card.damage, damageType: card.damageType, selfDamage: card.selfDamage, selfDamageType: card.selfDamageType)
            break
        
        case .heal:
            heal(healAmount: card.heal, type: card.healType)
            break
            
        default:
            break
            
        }
    }
    
    func addCardToDeck(id: Int){
        let cardsPool = Player.shared.cardsPool
        Player.shared.deck.addCard(cardsPool.cards[id])
    }
    
    func heal(healAmount : Int, type: EnergyType){
        switch type {
            case .life:
                Player.shared.currentLife += healAmount
                break
            case .empathy:
                Player.shared.currentEmpathy += healAmount
                break
            case .reason:
                Player.shared.currentReason += healAmount
                break
            case .understanding:
                Player.shared.currentUnderstanding += healAmount
                break
        }
    }

    func dealDamage(damage : Int, type: EnergyType){
        switch type {
            case .life:
               Enemy.shared.currentLife += damage
               break
           case .empathy:
               Enemy.shared.currentEmpathy += damage
               break
           case .reason:
               Enemy.shared.currentReason += damage
               break
           case .understanding:
               Enemy.shared.currentUnderstanding += damage
               break
        }
    }
    
    func dealAndSufferDamage(damage: Int, damageType: EnergyType, selfDamage: Int, selfDamageType: EnergyType){
        
        dealDamage(damage: damage, type: damageType)
        
        switch selfDamageType {
            case .life:
               Player.shared.currentLife -= damage
               break
           case .empathy:
               Player.shared.currentEmpathy -= damage
               break
           case .reason:
               Player.shared.currentReason -= damage
               break
           case .understanding:
               Player.shared.currentUnderstanding -= damage
               break
        }
        
        
    }
    
}

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
            
        default:
            break
            
        }
    }
    
    func addCardToDeck(id: Int){
        let cardsPool = Player.shared.cardsPool
        Player.shared.deck.addCard(cardsPool.cards[id])
    }
    
    func dealDamage(damage : Int, type: EnergyType){
        //Tira dano do enemy
    }
    
    func dealAndSufferDamage(damage: Int, damageType: EnergyType, selfDamage: Int, selfDamageType: EnergyType){
        //tira dano do enemy
    }
    
}

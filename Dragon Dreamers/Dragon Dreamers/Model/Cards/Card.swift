//
//  Card.swift
//  Dragon Dreamers
//
//  Created by Kaz Born on 05/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit


class Card : EmptyCard{
    var damage : Int!
    var damageType: EnergyType!
    var idEffect: Int!
    var selfDamage: Int!
    var selfDamageType: EnergyType!
    var heal : Int!
    var healType: EnergyType!
    
    init(){}
    
    //Send a card from Collection to Deck using ID
    init (name: String, effect: EffectType, cost: Int, cardType: CardType, cardIdEffect: Int) {
        super.init(name: name, effect: effect, cost: cost, type: cardType)
        self.idEffect = cardIdEffect
    }
    
    //Damage Card init
    init (name: String, effect: EffectType, cost: Int, cardType: CardType, damage: Int, damageType: EnergyType) {
        super.init(name: name, effect: effect, cost: cost, type: cardType)
        self.damage  = damage
        self.damageType = damageType
    }
    
    //Deal damage by using own resource/energy
    init (name: String, effect: EffectType, cost: Int, cardType: CardType, damage: Int, damageType: EnergyType, selfDamage: Int, selfDamageType: EnergyType) {
        super.init(name: name,  effect: effect, cost: cost, type: cardType)
        self.damage = damage
        self.damageType = damageType
        self.selfDamage = selfDamage
        self.selfDamageType = selfDamageType
    }
    
    //Heal your own resource/energy by some amount
    init (name: String, effect: EffectType, cost: Int, cardType: CardType, heal: Int, healType: EnergyType) {
        super.init(name: name,  effect: effect, cost: cost, type: cardType)
        self.heal = heal
        self.healType = healType
    }

    func playCard () {
        // Loops through actions and applies their effects
        CardEffect.runEffects(card: self, person: owner)
    }
    
    // Return the type of mana the card uses
    func switchCardTypeToManaType () -> ManaType {
        switch self.type {
        case .blue:
            return .b
        case .green:
            return .g
        case .red:
            return .r
        case .yellow:
            return .y
        default:
            return .b
        }
    }
    
}

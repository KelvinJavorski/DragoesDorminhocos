//
//  Card.swift
//  Dragon Dreamers
//
//  Created by Kaz Born on 05/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit


class Card {
    static var nextID : Int = 0
    
    var owner: Person!
    var name: String!
    var id : Int = 0
    var effect : EffectType!
    var cost : Int = 0
    var node : SKNode!
    var type : CardType!
    var damage : Int!
    var damageType: EnergyType!
    var idEffect: Int!
    var selfDamage: Int!
    var selfDamageType: EnergyType!
    var heal : Int!
    var healType: EnergyType!
    
    init(){
        
    }
    
    //Damage Card init
    init (cost : Int = 0, name: String = "", type : CardType, effect: EffectType, damage: Int, damageType: EnergyType) {
        self.id = Card.nextID
        Card.nextID += 1
        self.cost = cost
        self.name = name
        self.type = type
        self.effect = effect
        self.damage  = damage
        self.damageType = damageType
    }
    
    //Send a card to Deck using ID
    init (cost : Int = 0, name: String = "", type : CardType, effect: EffectType, cardIdEffect: Int) {
        self.id = Card.nextID
        Card.nextID += 1
        self.cost = cost
        self.name = name
        self.type = type
        self.effect = effect
        self.idEffect = cardIdEffect
    }
    
    //Deal damage by using own resource/energy
    init (cost : Int = 0, name: String = "", type : CardType, effect: EffectType, damage: Int, damageType: EnergyType, selfDamage: Int, selfDamageType: EnergyType) {
        self.id = Card.nextID
        Card.nextID += 1
        self.cost = cost
        self.name = name
        self.type = type
        self.effect = effect
        self.damage = damage
        self.damageType = damageType
        self.selfDamage = selfDamage
        self.selfDamageType = selfDamageType
    }
    
    init (cost : Int = 0, name: String = "", type : CardType, effect: EffectType, heal: Int, healType: EnergyType) {
        self.id = Card.nextID
        Card.nextID += 1
        self.cost = cost
        self.name = name
        self.type = type
        self.effect = effect
        self.heal = heal
        self.healType = healType
    }


    func playCard () {
        // Loops through actions and applies their effects
        CardEffect().runEffects(card: self, person: owner)
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

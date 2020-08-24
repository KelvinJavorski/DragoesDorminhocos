//
//  DeckPool.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 21/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

//mudar nome da classe
class CardsPool{
    var cards = [
        Card(cost: 1, name: "Carta 1 Deal Damage", type: .red, effect: .dealDamage, damage: 2, damageType: .life),
        Card(cost: 2, name: "Carta 2 Attack and Take Damage", type: .red, effect: .dealAndSufferDamage, damage: 2, damageType: .life, selfDamage: 2, selfDamageType: .empathy),
        Card(cost: 1, name: "Carta 3 Deal Damage and Take Damage", type: .red, effect: .dealAndSufferDamage, damage: 3, damageType: .life, selfDamage: 3, selfDamageType: .reason),
        Card(cost: 2, name: "Carta 4 Pega carta 1", type: .red, effect: .addCard, cardIdEffect: 0),
        Card(cost: 3, name: "Carta 5 Heal", type: .red, effect: .heal, heal: 5, healType: .life),
        
        //Copias
        Card(cost: 1, name: "Carta 6 Deal Damage", type: .red, effect: .dealDamage, damage: 2, damageType: .life),
        Card(cost: 2, name: "Carta 7 Attack and Take Damage", type: .red, effect: .dealAndSufferDamage, damage: 2, damageType: .life, selfDamage: 2, selfDamageType: .empathy),
        Card(cost: 1, name: "Carta 8 Deal Damage and Take Damage", type: .red, effect: .dealAndSufferDamage, damage: 3, damageType: .life, selfDamage: 3, selfDamageType: .reason),
        Card(cost: 2, name: "Carta 9 Pega carta 1", type: .red, effect: .addCard, cardIdEffect: 0),
        Card(cost: 3, name: "Carta 10 Heal", type: .red, effect: .heal, heal: 5, healType: .life),
        
        Card(cost: 1, name: "Carta 11 Deal Damage", type: .red, effect: .dealDamage, damage: 2, damageType: .life),
        Card(cost: 2, name: "Carta 12 Attack and Take Damage", type: .red, effect: .dealAndSufferDamage, damage: 2, damageType: .life, selfDamage: 2, selfDamageType: .empathy),
        Card(cost: 1, name: "Carta 13 Deal Damage and Take Damage", type: .red, effect: .dealAndSufferDamage, damage: 3, damageType: .life, selfDamage: 3, selfDamageType: .reason),
        Card(cost: 2, name: "Carta 14 Pega carta 1", type: .red, effect: .addCard, cardIdEffect: 0),
        Card(cost: 3, name: "Carta 15 Heal", type: .red, effect: .heal, heal: 5, healType: .life)
    ]
}

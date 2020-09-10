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
        Card(name: "Carta 1 Pega carta 1", effect: .addCard, cost: 1, cardType: .red, cardIdEffect: 1),
        Card(name: "Carta 2 Deal Damage", effect: .dealDamage, cost: 1, cardType: .red, damage: 2, damageType: .life),
        Card(name: "Carta 3 Deal and Take Damage", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: 5, damageType: .life, selfDamage: 2, selfDamageType: .life),
        Card(name: "Carta 4 Heal", effect: .heal, cost: 1, cardType: .red, heal: 3, healType: .life),
        Card(name: "Carta 2 Deal Damage", effect: .dealDamage, cost: 1, cardType: .red, damage: 2, damageType: .life),
    ]
}

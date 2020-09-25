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
//        Card(name: "Card Damage", effect: .dealDamage, cost: 1, cardType: .red, damage: 4, damageType: .life, humanType: .both),
//        Card(name: "Card Damage2", effect: .dealDamage, cost: 1, cardType: .red, damage: 4, damageType: .life, humanType: .both),
//        Card(name: "Card Damage3", effect: .dealDamage, cost: 1, cardType: .red, damage: 4, damageType: .life, humanType: .both),
//        Card(name: "Card Damage4", effect: .dealDamage, cost: 1, cardType: .red, damage: 4, damageType: .life, humanType: .both),
//
//        Card(name: "Card Damage5", effect: .dealDamage, cost: 1, cardType: .red, damage: 4, damageType: .life, humanType: .both),
//        Card(name: "Card Damage6", effect: .dealDamage, cost: 1, cardType: .red, damage: 4, damageType: .life, humanType: .both),
//        Card(name: "Card Damage7", effect: .dealDamage, cost: 1, cardType: .red, damage: 4, damageType: .life, humanType: .both),
//        Card(name: "Card Damage8", effect: .dealDamage, cost: 1, cardType: .red, damage: 4, damageType: .life, humanType: .both),
//
//        Card(name: "Card Damage9", effect: .dealDamage, cost: 1, cardType: .red, damage: 4, damageType: .life, humanType: .both),
//        Card(name: "Card Damage10", effect: .dealDamage, cost: 1, cardType: .red, damage: 4, damageType: .life, humanType: .both),
//        Card(name: "Card Damage11", effect: .dealDamage, cost: 1, cardType: .red, damage: 4, damageType: .life, humanType: .both),
//        Card(name: "Card Damage12", effect: .dealDamage, cost: 1, cardType: .red, damage: 4, damageType: .life, humanType: .both),
//        Card(name: "Card Damage13", effect: .dealDamage, cost: 1, cardType: .red, damage: 4, damageType: .life, humanType: .both),
//        Card(name: "Card Damage14", effect: .dealDamage, cost: 1, cardType: .red, damage: 4, damageType: .life, humanType: .both),
//        Card(name: "Card Damage15", effect: .dealDamage, cost: 1, cardType: .red, damage: 4, damageType: .life, humanType: .both),
//
//        Card(name: "Card Damage16", effect: .dealDamage, cost: 1, cardType: .red, damage: 4, damageType: .life, humanType: .both),
//        Card(name: "Card Damage17", effect: .dealDamage, cost: 1, cardType: .red, damage: 4, damageType: .life, humanType: .both),
//        Card(name: "Card Damage18", effect: .dealDamage, cost: 1, cardType: .red, damage: 4, damageType: .life, humanType: .both),
//        Card(name: "Card Damage19", effect: .dealDamage, cost: 1, cardType: .red, damage: 4, damageType: .life, humanType: .both),
////
//        Card(name: "Card Damage20", effect: .dealDamage, cost: 1, cardType: .red, damage: 4, damageType: .life, humanType: .both),

        
        //Deal damage to life and take reason (Enemy Card)
        Card(name: "Card SelfDamage1", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .life, selfDamage: -5, selfDamageType: .reason, humanType: .enemy, humorInfluence: -3),
        Card(name: "Card SelfDamage2", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .life, selfDamage: -5, selfDamageType: .reason, humanType: .enemy, humorInfluence: -4),
        Card(name: "Card SelfDamage3", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .life, selfDamage: -5, selfDamageType: .reason, humanType: .enemy, humorInfluence: -5),
        Card(name: "Card SelfDamage4", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .life, selfDamage: -5, selfDamageType: .reason, humanType: .enemy, humorInfluence: -6),
        Card(name: "Card SelfDamage5", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .life, selfDamage: -5, selfDamageType: .reason, humanType: .enemy, humorInfluence: -7),
        
        
        //Deal damage to reason and take empathy (Player card)
        Card(name: "Card SelfDamage1", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player, humorInfluence: 3),
        Card(name: "Card SelfDamage2", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player, humorInfluence: 4),
        Card(name: "Card SelfDamage3", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player, humorInfluence: 5),
        Card(name: "Card SelfDamage4", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player, humorInfluence: 6),
        Card(name: "Card SelfDamage5", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player, humorInfluence: 7),
        Card(name: "Card SelfDamage6", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player, humorInfluence: -1),
        Card(name: "Card SelfDamage7", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player, humorInfluence: -2),
        Card(name: "Card SelfDamage8", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player, humorInfluence: 1),
        Card(name: "Card SelfDamage9", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player, humorInfluence: 2),
        Card(name: "Card SelfDamage10", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player, humorInfluence: 0),
//        Card(name: "Card SelfDamage10", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player),
//        Card(name: "Card SelfDamage10", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player),
//        Card(name: "Card SelfDamage10", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player),
//        Card(name: "Card SelfDamage10", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player),
//        Card(name: "Card SelfDamage10", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player),
//        Card(name: "Card SelfDamage10", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player),
//        Card(name: "Card SelfDamage10", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player)
    ]
    
    func enemyCards() -> [Card]{
        var enemyCards : [Card] = [Card]()
        for card in cards{
            if card.humanType != HumanType.player{
                enemyCards.append(card)
            }
        }
        return enemyCards
    }
    
    func playerCards() -> [Card]{
        var playerCards : [Card] = [Card]()
        for card in cards{
            if card.humanType != HumanType.enemy{
                playerCards.append(card)
            }
        }
        return playerCards
    }
}

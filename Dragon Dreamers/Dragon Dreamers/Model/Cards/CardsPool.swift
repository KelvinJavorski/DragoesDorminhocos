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
    var deck : Deck! = Deck()
    var allCards : [Card] = []
    
    func setupCardAvailable(){
        let agreeAdd = getAgreeIncreaseCard(amount: 5)
        let agreeRemove = getAgreeDecreaseCard(amount: 5)
        let avoidAdd = getAgreeIncreaseCard(amount: 5)
        let avoidRemove = getAgreeDecreaseCard(amount: 5)
        let questioningAdd = getQuestioningIncreaseCard(amount: 5)
        let questioningRemove = getQuestioningDecreaseCard(amount: 5)
        let criticizeAdd = getCriticizeIncreaseCard(amount: 5)
        let criticizeRemove = getCriticizeDecreaseCard(amount: 5)
        let reasoningAdd = getReasoningIncreaseCard(amount: 5)
        let reasoningRemove = getReasoningDecreaseCard(amount: 5)
        
        allCards.append(contentsOf: [agreeAdd, agreeRemove, avoidAdd, avoidRemove, questioningAdd, questioningRemove, criticizeAdd, criticizeRemove, reasoningAdd, reasoningRemove])
    }
    
    func getADeck(){
        setupCardAvailable()
        for card in allCards{
            card.setupEffectsFunction()
            setHumorInfluence(card: card, amount: 5)
            deck.addCard(card)
        }
        allCards.removeAll()
    }
    
    func setHumorInfluence(card: Card, amount: Int){
        card.humorInfluence = amount
    }
    
    //### Create one card of each effect
    func getNoEffectCard() -> Card {
        let card = Card(name: "No name", effects: [], cost: 1, cardType: .empty, humanType: .enemy, humorInfluence: 0)
        return card
    }
    
    func getAgreeIncreaseCard(amount: Int) -> Card{
        let newCard = getNoEffectCard()
        newCard.effects.append(contentsOf: [.addAgree])
        newCard.amount = amount
        return newCard
    }
    
    func getAgreeDecreaseCard(amount: Int) -> Card{
        let newCard = getNoEffectCard()
        newCard.effects.append(contentsOf: [.removeAgree])
        newCard.amount = amount
        return newCard
    }
    
    func getAvoidIncreaseCard(amount: Int) -> Card{
        let newCard = getNoEffectCard()
        newCard.effects.append(contentsOf: [.addAvoid])
        newCard.amount = amount
        return newCard
    }
    
    func getAvoidDecreaseCard(amount: Int) -> Card{
        let newCard = getNoEffectCard()
        newCard.effects.append(contentsOf: [.removeAvoid])
        newCard.amount = amount
        return newCard
    }
    func getQuestioningIncreaseCard(amount: Int) -> Card{
        let newCard = getNoEffectCard()
        newCard.effects.append(contentsOf: [.addQuestioning])
        newCard.amount = amount
        return newCard
    }
    func getQuestioningDecreaseCard(amount: Int) -> Card{
        let newCard = getNoEffectCard()
        newCard.effects.append(contentsOf: [.removeQuestioning])
        newCard.amount = amount
        return newCard
    }
    func getCriticizeIncreaseCard(amount: Int) -> Card{
        let newCard = getNoEffectCard()
        newCard.effects.append(contentsOf: [.addCriticize])
        newCard.amount = amount
        return newCard
    }
    
    func getCriticizeDecreaseCard(amount: Int) -> Card{
        let newCard = getNoEffectCard()
        newCard.effects.append(contentsOf: [.removeCriticize])
        newCard.amount = amount
        return newCard
    }
    
    func getReasoningIncreaseCard(amount: Int) -> Card{
        let newCard = getNoEffectCard()
        newCard.effects.append(contentsOf: [.addReasoning])
        newCard.amount = amount
        return newCard
    }
    func getReasoningDecreaseCard(amount: Int) -> Card{
        let newCard = getNoEffectCard()
        newCard.effects.append(contentsOf: [.removeReasoning])
        newCard.amount = amount
        return newCard
    }
    
    
    
//    var cards = [
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
//        Card(name: "Card SelfDamage1", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .avoid, selfDamage: -5, selfDamageType: .questioning, humanType: .enemy, humorInfluence: -6),
//        Card(name: "Card SelfDamage2", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .avoid, selfDamage: -5, selfDamageType: .questioning, humanType: .enemy, humorInfluence: -8),
//        Card(name: "Card SelfDamage3", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .agree, selfDamage: -5, selfDamageType: .questioning, humanType: .enemy, humorInfluence: -10),
//        Card(name: "Card SelfDamage4", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .agree, selfDamage: -5, selfDamageType: .questioning, humanType: .enemy, humorInfluence: -12),
//        Card(name: "Card SelfDamage5", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .agree, selfDamage: -5, selfDamageType: .questioning, humanType: .enemy, humorInfluence: -14),
        
        
        //Deal damage to reason and take empathy (Player card)
//        Card(name: "Card SelfDamage1", effect: .dealAndSufferDamage, cost: 1, cardType: .blue, damage: -5, damageType: .agree, selfDamage: -3, selfDamageType: .avoid, humanType: .player, humorInfluence: 2),
//        Card(name: "Card SelfDamage2", effect: .dealAndSufferDamage, cost: 1, cardType: .green, damage: -5, damageType: .agree, selfDamage: -3, selfDamageType: .avoid, humanType: .player, humorInfluence: -5),
//        Card(name: "Card SelfDamage3", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .agree, selfDamage: -3, selfDamageType: .avoid, humanType: .player, humorInfluence: 2),
//        Card(name: "Card SelfDamage4", effect: .dealAndSufferDamage, cost: 1, cardType: .green, damage: -5, damageType: .questioning, selfDamage: -3, selfDamageType: .avoid, humanType: .player, humorInfluence: -5),
//        Card(name: "Card SelfDamage5", effect: .dealAndSufferDamage, cost: 1, cardType: .blue, damage: -5, damageType: .questioning, selfDamage: -3, selfDamageType: .avoid, humanType: .player, humorInfluence: 4),
//        Card(name: "Card SelfDamage6", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .questioning, selfDamage: -3, selfDamageType: .avoid, humanType: .player, humorInfluence: 2),
//        Card(name: "Card SelfDamage7", effect: .dealAndSufferDamage, cost: 1, cardType: .blue, damage: -5, damageType: .questioning, selfDamage: -3, selfDamageType: .avoid, humanType: .player, humorInfluence: 2),
//        Card(name: "Card SelfDamage8", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .questioning, selfDamage: -3, selfDamageType: .avoid, humanType: .player, humorInfluence: 2),
//        Card(name: "Card SelfDamage9", effect: .dealAndSufferDamage, cost: 1, cardType: .green, damage: -5, damageType: .questioning, selfDamage: -3, selfDamageType: .avoid, humanType: .player, humorInfluence: -5),
//        Card(name: "Card SelfDamage10", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .questioning, selfDamage: -3, selfDamageType: .avoid, humanType: .player, humorInfluence: 2),
//        Card(name: "Card SelfDamage10", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player),
//        Card(name: "Card SelfDamage10", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player),
//        Card(name: "Card SelfDamage10", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player),
//        Card(name: "Card SelfDamage10", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player),
//        Card(name: "Card SelfDamage10", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player),
//        Card(name: "Card SelfDamage10", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player),
//        Card(name: "Card SelfDamage10", effect: .dealAndSufferDamage, cost: 1, cardType: .red, damage: -5, damageType: .reason, selfDamage: -3, selfDamageType: .empathy, humanType: .player)
//    ]
    
//    func enemyCards() -> [Card]{
//        var enemyCards : [Card] = [Card]()
//        for card in cards{
//            if card.humanType != TargetType.player{
//                enemyCards.append(card)
//            }
//        }
//        return enemyCards
//    }
//
//    func playerCards() -> [Card]{
//        var playerCards : [Card] = [Card]()
//        for card in cards{
//            if card.humanType != TargetType.enemy{
//                playerCards.append(card)
//            }
//        }
//        return playerCards
//    }
}

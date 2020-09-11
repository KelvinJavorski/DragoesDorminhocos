//
//  Player.swift
//  Dragon Dreamers
//
//  Created by Kaz Born on 05/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Enemy: Person {
    static let shared = Enemy()

    init () {
        super.init()
        print(">>> Init Enemy...")
        self.setInitialDeck()
        print("added cards to deck")
        print("Deck: \(deck.cards.count)")
        self.setOwner()
        self.setInitialAtributes()
        print("-------")
    }
    
    func setInitialDeck(){
        cardsPool.cards.shuffle()
        for card in cardsPool.cards {
            if card.effect == EffectType.addCard {
                deck.cards.append(card)
                break
            }
            break
        }
        
        for card in cardsPool.cards {
            if card.effect == EffectType.dealDamage {
                deck.cards.append(card)
                break
            }
            break
        }
        
        for card in cardsPool.cards {
            if card.effect == EffectType.dealAndSufferDamage {
                deck.cards.append(card)
                break
            }
            break
        }
        
        for card in cardsPool.cards {
            if card.effect == EffectType.heal {
                deck.cards.append(card)
                break
            }
            break
        }
    }
    
    func setHand(){
        let cards = getAllCardByEmotion(emotion: self.emotion)
        if !cards.isEmpty{
            self.hand.addCards(cards)
        }
    }
    
    func getAllCardByEmotion(emotion: BattleEmotion)->[Card]{
        var cards = [Card]()
        for card in deck.cards{
            if card.emotion == emotion{
                cards.append(card)
            }
        }
        return cards
    }
    
    func setInitialAtributes(){
        currentLife = 10
        maxLife = 10
        
        currentEmpathy = 0
        maxEmpathy = 10
        
        }
    
    
}

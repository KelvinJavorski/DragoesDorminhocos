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
    func setInitialAtributes(){
        currentLife = 10
        maxLife = 10
        
        currentEmpathy = 0
        maxEmpathy = 10
        
        }
    
    func changeDeckOfCard (_ from: Deck, _ to: Deck, _ index: Int) {
        let card = from.getCard(index)
        from.removeCard(atIndex: index)
        to.addCard(card)
    }
    
    func drawCards (amount : Int) {
        if deck.cards.count >= amount {
            for _ in 0 ..< amount {
                changeDeckOfCard(deck, hand, 0)
            }
        } else if deck.cards.count > 0 {
            for _ in 0 ..< deck.cards.count {
                changeDeckOfCard(deck, hand, 0)
            }
        }
    }
    
    func playCard (index : Int) {
        let card = hand.cards[index]
        changeDeckOfCard(hand, ongoing, index)
        card.playCard()
    }
    
    
}

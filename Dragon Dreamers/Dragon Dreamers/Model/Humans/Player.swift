//
//  Player.swift
//  Dragon Dreamers
//
//  Created by Kaz Born on 05/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Player: Person {
    static let shared = Player()
    var banished : Deck = Deck(name: "Banished")
    var manaManager: ManaManager = ManaManager()
    
    init () {
        super.init()
        print(">>> Init Player...")
        for i in 0 ..< cardsPool.cards.count - 1 {
            deck.cards.append(cardsPool.cards[i])
        }
        print("added cards to deck")
        print("Deck: \(deck.cards.count)")
        self.setOwner()
        self.setInitialAtributes()
        print("-------")
    }
    
    func setInitialAtributes(){
        currentLife = 10
        maxLife = 10
        
        currentEmpathy = 0
        maxEmpathy = 10
        
        currentUnderstanding = 0
        maxUnderstanding = 10
    }

    
//    func changeDeckOfCard (_ from: Deck, _ to: Deck, _ index: Int) {
//        let card = from.getCard(index)
//        from.removeCard(atIndex: index)
//        to.addCard(card)
//    }
//
//    func getNewDeckFromDiscart () { // Not in use
//        discard.shuffle()
//        while discard.cards.count > 0 {
//            changeDeckOfCard(discard, deck, 0)
//        }
//    }
//
//    func getCardFromDiscard (_ index: Int) {
//        changeDeckOfCard(discard, deck, index)
//    }
//
//    func drawCards (amount : Int) {
//        if deck.cards.count >= amount {
//            for _ in 0 ..< amount {
//                changeDeckOfCard(deck, hand, 0)
//            }
//        } else if deck.cards.count > 0 {
//            for _ in 0 ..< deck.cards.count {
//                changeDeckOfCard(deck, hand, 0)
//            }
//        }
//    }
//
//    func discardHand () {
//        while hand.cards.count > 0 {
//            changeDeckOfCard(hand, discard, 0)
//        }
//    }
//
//    func playCard (index : Int) {
//        let card = hand.cards[index]
//        changeDeckOfCard(hand, ongoing, index)
//        card.playCard()
//    }
    
}

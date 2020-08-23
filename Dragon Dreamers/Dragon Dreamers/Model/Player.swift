//
//  Player.swift
//  Dragon Dreamers
//
//  Created by Kaz Born on 05/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Player {
    static let shared = Player()
    
    
    var cardsPool : CardsPool = CardsPool()
    var deck     : Deck = Deck(name: "Deck")
    var hand     : Deck = Deck(name: "Hand")
    var discard  : Deck = Deck(name: "Discard")
    var banished : Deck = Deck(name: "Banished")
    var ongoing  : Deck = Deck(name: "Ongoing")
    var manaManager: ManaManager = ManaManager()
    
    init () {
        for _ in 0 ..< 53 {
            deck.cards.append(Card())
        }
        print("added cards to deck")
        print("Deck: \(deck.cards.count)")
    }
    
    
    
    func changeDeckOfCard (_ from: Deck, _ to: Deck, _ index: Int) {
        let card = from.getCard(index)
        from.removeCard(atIndex: index)
        to.addCard(card)
    }
    
    func getNewDeckFromDiscart () { // Not in use
        discard.shuffle()
        while discard.cards.count > 0 {
            changeDeckOfCard(discard, deck, 0)
        }
    }
    
    func getCardFromDiscard (_ index: Int) {
        changeDeckOfCard(discard, deck, index)
    }
    
    func drawCards (ammount : Int) {
        if deck.cards.count >= ammount {
            for _ in 0 ..< ammount {
                changeDeckOfCard(deck, hand, 0)
            }
        } else if deck.cards.count > 0 {
            for _ in 0 ..< deck.cards.count {
                changeDeckOfCard(deck, hand, 0)
            }
        }
    }
    
    func discardHand () {
        while hand.cards.count > 0 {
            changeDeckOfCard(hand, discard, 0)
        }
    }
    
    func playCard (index : Int) {
        let card = hand.cards[index]
        changeDeckOfCard(hand, ongoing, index)
        card.playCard()
    }
    
    
}

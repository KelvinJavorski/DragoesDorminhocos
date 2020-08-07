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
    
    
    
    var deck     : Deck = Deck()
    var hand     : Deck = Deck()
    var discard  : Deck = Deck()
    var banished : Deck = Deck()
    var ongoing  : Deck = Deck()
    
    init () {
        for _ in 0 ..< 53 {
            deck.cards.append(Card(cost: 0))
        }
        print("added cards to deck")
        print("Deck: \(deck.cards.count)")
    }
    
    
    func getNewDeckFromDiscart () {
        discard.shuffle()
        while discard.cards.count > 0 {
            let card = discard.cards[0]
            discard.cards.remove(at: 0)
            hand.cards.append(card)
        }
    }
    
    func drawCards (ammount : Int) {
        if deck.cards.count >= ammount {
            for _ in 0 ..< ammount {
                hand.cards.append(deck.cards[0])
                deck.cards.remove(at: 0)
            }
        } else if deck.cards.count > 0 {
            for _ in 0 ..< deck.cards.count {
                hand.cards.append(deck.cards[0])
                deck.cards.remove(at: 0)
            }
        }
    }
    
    func discardHand () {
        while hand.cards.count > 0 {
            discard.cards.append(hand.cards[0])
            hand.cards.remove(at: 0)
        }
    }
    
    func playCard (index : Int) {
        let card = hand.cards[index]
        hand.cards.remove(at: index)
        ongoing.cards.append(card)
        card.playCard()
    }
    
    
}

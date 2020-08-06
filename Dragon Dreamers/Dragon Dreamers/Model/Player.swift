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
    var discart  : Deck = Deck()
    var banished : Deck = Deck()
    var ongoing  : Deck = Deck()
    
    init () {
        for _ in 0 ..< 50 {
            deck.cards.append(Card(cost: 0))
        }
        print("added cards to deck")
        print("Deck: \(deck.cards.count)")
    }
    
    
    func getNewDeckFromDiscart () { }
    
    func drawCards (ammount : Int) {
        for _ in 0 ..< ammount {
            hand.cards.append(deck.cards[0])
            deck.cards.remove(at: 0)
        }
    }
    
    func discartHand () { }
    
    func playCard (card : Card) {
        ongoing.cards.append(card)
    }
    
    
}

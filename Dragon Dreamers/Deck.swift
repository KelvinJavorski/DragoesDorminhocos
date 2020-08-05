//
//  Deck.swift
//  Dragon Dreamers
//
//  Created by Kaz Born on 05/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Deck {
    internal init(type: DeckType? = nil, cards: [Card]? = nil) {
        self.type = type
        self.cards = cards
    }
    
    var type        : DeckType!
    var cards       : [Card]!
    
    func shuffle(){}
    
    func addCard(card: Card){}
    
    func removeCard(card: Card){}
}

//
//  Deck.swift
//  Dragon Dreamers
//
//  Created by Kaz Born on 05/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Deck {
    internal init(type: DeckType? = nil, cards: [Card] = []) {
        self.type = type
        self.cards = cards
    }    
    
    var type        : DeckType!
    var cards       : [Card] = []
    
    func shuffle(){
        cards.shuffle()
    }
    
    func getCard (_ card: Card) -> Card {
        return Card(cost: 0) // REDO
    }
    
    func getCard (_ index: Int) -> Card {
        return cards[index]
    }
    
    func addCard(_ card: Card){
        cards.append(card)
    }
    
    func removeCard(atIndex i: Int){
        cards.remove(at: i)
    }
    
    func removeAllCards() {
        for _ in 0 ..< cards.count {
            removeCard(atIndex: 0)
        }
    }
}

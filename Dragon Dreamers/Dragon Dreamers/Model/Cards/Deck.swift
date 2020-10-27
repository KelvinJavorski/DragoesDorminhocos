//
//  Deck.swift
//  Dragon Dreamers
//
//  Created by Kaz Born on 05/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Deck {
    internal init(name: String = "nil", type: DeckType? = nil, cards: [Card] = []) {
        self.name = name
        self.type = type
        self.cards = cards
    }    
    
    var name        : String!
    var type        : DeckType!
    var cards       : [Card] = []
    
    func shuffle(){
        cards.shuffle()
    }
    
    func getCard (_ card: Card) -> Card {
        return Card() // REDO
    }
    
    func getCard (_ index: Int) -> Card {
        return cards[index]
    }
    
    func addCard(_ card: Card){
        cards.append(card)
    }
    
    func addCards(_ cards: [Card]){
        for card in cards{
            self.cards.append(card)
        }
    }
    
    func removeCard(atIndex i: Int){
        cards.remove(at: i)
    }
    
    func removeCard(Card card: Card){
        for i in 0..<cards.count {
            if cards[i].id == card.id{
                cards.remove(at: i)
                return
            }
        }
    }
    
    func removeCard(id: Int, completion: @escaping () -> () = { }) {
        for i in 0 ..< cards.count {
            if cards[i].id == id {
                cards.remove(at: i)
                completion()
                return
            }
        }
    }
    
    func printAllCardsIDs () {
        print(">> Cards on \(self.name) deck:")
        for card in cards {
            print("Card ID: \(card.id)")
        }
        print("-----")
    }
    
    func removeAllCards() {
        for _ in 0 ..< cards.count {
            removeCard(atIndex: 0)
        }
    }
    
    func isEmpty () -> Bool {
        if cards.count > 0 {
            return false
        }
        return true
    }
    
    func getRandomCardIndex () -> Int {
        let count = cards.count
        return Int.random(in: 0..<count)
    }
}

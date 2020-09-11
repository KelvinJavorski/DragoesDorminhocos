//
//  Person.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 05/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Person{
    internal init(currentLife: Int? = nil, maxLife: Int? = nil, currentEmpathy: Int? = nil, maxEmpathy: Int? = nil, currentReason: Int? = nil, maxReason: Int? = nil, currentUnderstanding: Int? = nil, maxUnderstanding: Int? = nil, actionPoints: Int? = nil, emotion: BattleEmotion? = nil) {
        self.currentLife = currentLife
        self.maxLife = maxLife
        self.currentEmpathy = currentEmpathy
        self.maxEmpathy = maxEmpathy
        self.currentReason = currentReason
        self.maxReason = maxReason
        self.currentUnderstanding = currentUnderstanding
        self.maxUnderstanding = maxUnderstanding
        self.actionPoints = actionPoints
        self.emotion = emotion
    }
    
    func loseLife(value: Int){
        self.currentLife -= value
    }
    
    func loseEmpathy(value: Int){
        self.currentEmpathy -= value
    }
    
    func resetAllStats(){
        self.currentLife = self.maxLife
        self.currentEmpathy = self.maxEmpathy
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
    
    func discardHand () {
        while hand.cards.count > 0 {
            changeDeckOfCard(hand, discard, 0)
        }
    }
    
    func playCard (index : Int) {
        changeDeckOfCard(hand, ongoing, index)
    }
    
    func setOwner(){
        for card in deck.cards{
            card.owner = self
        }
    }
    
    func setOpponent(person: Person){
        self.opponent = person
    }
    
    var cardsPool : CardsPool = CardsPool()
    var deck     : Deck = Deck(name: "Deck")
    var hand     : Deck = Deck(name: "Hand")
    var ongoing  : Deck = Deck(name: "Ongoing")
    var discard : Deck = Deck(name: "Discard")

    var opponent: Person!
    var currentLife: Int!
    var maxLife: Int!
    
    var currentEmpathy: Int!
    var maxEmpathy: Int!
    
    var currentReason: Int!
    var maxReason: Int!
    
    var currentUnderstanding: Int!
    var maxUnderstanding: Int!
    
    var actionPoints: Int!
    var maxActionPoints: Int!
    var emotion: BattleEmotion!
    
    
}

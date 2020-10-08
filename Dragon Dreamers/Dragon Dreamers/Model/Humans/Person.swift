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
        self.currentAgree = currentLife
        self.maxAgree = maxLife
        self.currentAvoid = currentEmpathy
        self.maxAvoid = maxEmpathy
        self.currentQuestioning = currentReason
        self.maxQuestioning = maxReason
        self.currentCriticize = currentUnderstanding
        self.maxCriticize = maxUnderstanding
        self.actionPoints = actionPoints
        self.emotion = emotion
    }
    
    func loseLife(value: Int){
        self.currentAgree -= value
    }
    
    func loseEmpathy(value: Int){
        self.currentAvoid -= value
    }
    
    func resetAllStats(){
        self.currentAgree = self.maxAgree
        self.currentAvoid = self.maxAvoid
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
    
    func isAtributeFinished(atribute: EnergyType) -> Bool{
        if atribute == .avoid{
            if self.currentAvoid >= self.maxAvoid{
                return true
            }
        }else if atribute == .agree{
            if self.currentAgree <= self.minAgree{
                return true
            }
        }else if atribute == .questioning{
            if self.currentQuestioning >= self.maxQuestioning{
                return true
            }
        }
        return false
    }
    
    func createPermanentEffect(status: BattleStatus){
        currentStatus.append(status)
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
    var currentAgree: Int!
    var maxAgree: Int!
    var minAgree: Int!
    
    var currentAvoid: Int!
    var maxAvoid: Int!
    
    var currentQuestioning: Int!
    var maxQuestioning: Int!
    
    var currentCriticize: Int!
    var maxCriticize: Int!
    
    var currentReasoning: Int!
    var maxReasoning: Int!
    
    var currentStatus: [BattleStatus] = [BattleStatus]()

    var actionPoints: Int!
    var maxActionPoints: Int!
    var emotion: BattleEmotion!
    
    
}

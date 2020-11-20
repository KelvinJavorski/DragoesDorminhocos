//
//  Person.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 05/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Person{
    internal init(currentAgree: Int? = nil, maxAgree: Int? = nil, currentAvoid: Int? = nil, maxAvoid: Int? = nil, currentQuestioning: Int? = nil, maxQuestioning: Int? = nil, currentCriticize: Int? = nil, maxCriticize: Int? = nil, actionPoints: Int? = nil, emotion: BattleEmotion? = nil, amountEffect: Int? = nil) {
        self.currentAgree = currentAgree
        self.maxAgree = maxAgree
        self.currentAvoid = currentAvoid
        self.maxAvoid = maxAvoid
        self.currentQuestioning = currentQuestioning
        self.maxQuestioning = maxQuestioning
        self.currentCriticize = currentCriticize
        self.maxCriticize = maxCriticize
        self.emotion = emotion
        self.amountInTurnEffect = amountEffect
    }
    
    func loseAgree(value: Int){
        self.currentAgree -= value
    }
    
    func loseAvoid(value: Int){
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
    
    func discardCardById(cardId:Int){
        self.hand.removeCard(atIndex: cardId)
    }
    
    func playCard (index : Int) {
        changeDeckOfCard(hand, ongoing, index)
    }
    
    func setOwner(){
        for card in deck.cards{
            card.owner = self
        }
    }
    
    func createPermanentEffect(status: BattleStatus){
        currentStatus.append(status)
    }
    
    func setOpponent(person: Person){
        self.opponent = person
    }
    
    var cardsPool : CardsPool = CardsPool()
    var deck     : Deck = Deck(name: "Deck")
    var lastHand : Deck = Deck(name: "LastHand")
    var hand     : Deck = Deck(name: "Hand")
    var ongoing  : Deck = Deck(name: "Ongoing")
    var discard : Deck = Deck(name: "Discard")
    var banished : Deck = Deck(name: "Banished")
    
    var opponent: Person!
    var cardEffectBlocked: Bool = false
    //var sun = Way()
    
    var currentAgree: Int!
    var maxAgree: Int!
    var minAgree: Int!
    
    var currentAvoid: Int!
    var maxAvoid: Int!
    
    var currentQuestioning: Int!
    var maxQuestioning: Int!
    
    var currentCriticize: Int!
    var maxCriticize: Int!
    
    var currentTokens: Int!
    var maxReasoning: Int!
    
    var tokens : [Token] = []
    var status: [Status] = []
    
    var currentAfterDrawStatus: [Status] = []
    var currentStatus: [BattleStatus] = []
    var currentTurnStatus: [BattleTurnStatus] = []
    var amountInTurnEffect: Int?
    
    var emotion: BattleEmotion!
    
    
}

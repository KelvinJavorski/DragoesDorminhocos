//
//  Player.swift
//  Dragon Dreamers
//
//  Created by Kaz Born on 05/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Enemy: Person {
    //static let shared = Enemy()
    var name: String!
    var discussions: [Discussion]!
    var discussionInUse: Discussion

    init (name: String, discussions: [Discussion]) {
        
        self.name = name
        self.discussions = discussions
        self.discussionInUse = discussions[0]
        
        super.init()
        
        self.setInitialDeck()
        self.setOwner()
        self.setInitialAtributes()
    }
    
    func setInitialDeck(){
//        cardsPool.cards.shuffle()
        cardsPool.getEnemyDeck()
        self.deck.addCards(cardsPool.deck.cards)
    }
    
    func getName () -> String{
        return self.name
    }
    
    func setHand(){
        self.hand.removeAllCards()
        let cards = getAllCardByEmotion(emotion: self.emotion)
        if !cards.isEmpty{
            self.hand.addCards(cards)
        }
    }
    
    func getAllCardByEmotion(emotion: BattleEmotion)->[Card]{
        var cards = [Card]()
        for card in deck.cards{
            if card.emotion == emotion{
                cards.append(card)
            }
        }
        return cards
    }
    
    func playTurn(){
        let card = playOneCard()
        if cardEffectBlocked{
            cardEffectBlocked = false
            return
        }
        card.applyEffects()
    }
    
    func playOneCard() -> Card{
        let randomNumber = Int.random(in: 0 ..< hand.cards.count)
        return hand.getCard(randomNumber)
    }
    
    func reaction(){
        switch self.emotion {
        case .agree:
            print("VOCÊ TÁ MALUCÃO?")
        default:
            print("eae bichao")
        }
    }
    
    func updateHumor() {
        self.emotion = self.discussionInUse.getHumor()
    }
    
    func setInitialAtributes(){
        currentAgree = 0
        maxAgree = 50
        minAgree = 0
        
        currentQuestioning = 0
        maxQuestioning = 50
        
        emotion = self.discussions[0].humor
    }
    
    func setDiscussionInUse(chapterIndex: Int) {
        if chapterIndex == -1 {
            self.discussionInUse = self.discussions[0]
        }
        else {
            self.discussionInUse = self.discussions[chapterIndex]
        }
    }
}

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
    var discussion: Discussion!

    init (name: String, discussion: Discussion) {
        super.init()
        print(">>> Init Enemy...")
        print("added cards to deck")
        print("Deck: \(deck.cards.count)")
        self.setInitialDeck()
        self.setOwner()
        print("-------")
        
        self.name = name
        self.discussion = discussion
        self.setInitialAtributes()
    }
    
    func setInitialDeck(){
//        cardsPool.cards.shuffle()
        cardsPool.getADeck()
        self.deck.addCards(cardsPool.deck.cards)
    }
    
    func getName () -> String{
        return self.name
    }
    
    func setHand(){
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
        setHand()
        let card = playOneCard()
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
        self.emotion = self.discussion.getHumor()
    }
    
    func setInitialAtributes(){
        currentAgree = 0
        maxAgree = 50
        minAgree = 0
        
        currentQuestioning = 0
        maxQuestioning = 50
        
        emotion = self.discussion.humor
        }
}

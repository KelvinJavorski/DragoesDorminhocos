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
    
    func spendActionPoints(value: Int){
        self.actionPoints -= value
    }
    
    func getActionPoints(value: Int){
        self.actionPoints += value
    }
    
    func resetAllStats(){
        self.currentLife = self.maxLife
        self.currentEmpathy = self.maxEmpathy
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

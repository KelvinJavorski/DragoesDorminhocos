//
//  Player.swift
//  Dragon Dreamers
//
//  Created by Kaz Born on 05/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Player: Person {
    static let shared = Player()
    var banished : Deck = Deck(name: "Banished")
    var manaManager: ManaManager = ManaManager()
    
    init () {
        super.init()
        print(">>> Init Player...")
        cardsPool.getADeck()
        deck.addCards(cardsPool.deck.cards)
        print("added cards to deck")
        print("Deck: \(deck.cards.count)")
        self.setOwner()
        self.setInitialAtributes()
        print("-------")
    }
    
    func setInitialAtributes(){
        currentAgree = 0
        maxAgree = 50
        minAgree = 0
        
        currentAvoid = 0
        maxAvoid = 50
        
        currentQuestioning = 0
        maxQuestioning = 50
        
        currentCriticize = 0
        maxCriticize = 50
        
        currentReasoning = 0
        maxReasoning = 15
    }
}

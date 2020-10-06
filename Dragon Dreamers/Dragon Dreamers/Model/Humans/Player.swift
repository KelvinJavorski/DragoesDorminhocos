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
        deck.addCards(cardsPool.playerCards())
        print("added cards to deck")
        print("Deck: \(deck.cards.count)")
        self.setOwner()
        self.setInitialAtributes()
        print("-------")
    }
    
    func setInitialAtributes(){
        currentLife = 0
        maxLife = 50
        minLife = 0
        
        currentEmpathy = 0
        maxEmpathy = 50
        
        currentUnderstanding = 0
        maxUnderstanding = 50
    }
}

//
//  Card.swift
//  Dragon Dreamers
//
//  Created by Kaz Born on 05/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit


class Card {
    var effects : [Action] = []
    var cost : Int = 0
    var node : SKNode!
    var type : CardType!
    
    init (cost : Int = 0, effects : [Action] = []) {
        self.effects = effects
        self.cost = cost
    }
    
    
    func playCard () {
        
        
        // Loops through actions and applies their effects
        for action in effects {
            action.runEffect()
        }
        
    }
    
}

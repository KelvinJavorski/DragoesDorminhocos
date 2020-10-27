//
//  Status.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 26/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Status{
    var name: String!
    var duration: Int!
    var target: Person!
    var effect: EffectProtocol!
    
    init(name: String, duration: Int, target: Person, effect: EffectProtocol) {
        self.name = name
        self.duration = duration
        self.target = target
        self.effect = effect
    }
    
    func increaseDuration(amount: Int){
        duration += amount
    }
    
    func decreaseDuration(amount: Int){
        duration += amount
    }
    
    func useEffect(){
        effect.applyEffects(card: Card())
    }
}

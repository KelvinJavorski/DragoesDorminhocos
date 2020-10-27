//
//  ValueChangeEffects.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 08/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class AgreeIncrease: EffectProtocol{
    func applyEffects(card: Card) {
        let person = Player.shared
        person.oceano.current += Int(Double(card.amount) * card.multiplier)
    }
}

class AgreeDecrease: EffectProtocol{
    func applyEffects(card: Card) {
        let person = Player.shared
        person.oceano.current -= Int(Double(card.amount) * card.multiplier)
    }
}

class AvoidIncrease: EffectProtocol{
    func applyEffects(card: Card) {
        let person = Player.shared
        person.areia.current += Int(Double(card.amount) * card.multiplier)
    }
}

class AvoidDecrease: EffectProtocol{
    func applyEffects(card: Card) {
        let person = Player.shared
        person.areia.current -= Int(Double(card.amount) * card.multiplier)
    }
}

class QuestioningIncrease: EffectProtocol{
    func applyEffects(card: Card) {
        let person = Player.shared
        person.brisa.current += Int(Double(card.amount) * card.multiplier)
    }
}

class QuestioningDecrease: EffectProtocol{
    func applyEffects(card: Card) {
        let person = Player.shared
        person.brisa.current -= Int(Double(card.amount) * card.multiplier)
    }
}

class CriticizeIncrease: EffectProtocol{
    func applyEffects(card: Card) {
        let person = Player.shared
        person.sol.current += Int(Double(card.amount) * card.multiplier)
    }
}

class CriticizeDecrease: EffectProtocol{
    func applyEffects(card: Card) {
        let person = Player.shared
        person.sol.current -= Int(Double(card.amount) * card.multiplier)
    }
}

class ReasoningIncrease: EffectProtocol{
    var person: Person!
    
    func applyEffects(card: Card) {
        self.person = Player.shared
        self.person.currentTokens += Int(Double(card.amount) * card.multiplier)
    }
}

class ReasoningDecrease: EffectProtocol{
    var person: Person!
    
    func applyEffects(card: Card) {
        self.person = Player.shared
        self.person.currentTokens -= Int(Double(card.amount) * card.multiplier)
    }
}


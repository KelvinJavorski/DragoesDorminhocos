//
//  ValueChangeEffects.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 08/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class AgreeIncrease: EffectProtocol{
    var person: Person!
    
    func applyEffects(card: Card) {
        self.person = Player.shared
        self.person.currentAgree += card.amount * Int(card.multiplier)
    }
}

class AgreeDecrease: EffectProtocol{
    var person: Person!
    
    func applyEffects(card: Card) {
        self.person = Player.shared
        self.person.currentAgree -= card.amount * Int(card.multiplier)
    }
}

class AvoidIncrease: EffectProtocol{
    var person: Person!
    
    func applyEffects(card: Card) {
        self.person = Player.shared
        self.person.currentAvoid += card.amount * Int(card.multiplier)
    }
}

class AvoidDecrease: EffectProtocol{
    var person: Person!
    
    func applyEffects(card: Card) {
        self.person = Player.shared
        self.person.currentAvoid -= card.amount * Int(card.multiplier)
    }
}

class QuestioningIncrease: EffectProtocol{
    var person: Person!
    
    func applyEffects(card: Card) {
        self.person = Player.shared
        self.person.currentQuestioning += card.amount * Int(card.multiplier)
    }
}

class QuestioningDecrease: EffectProtocol{
    var person: Person!
    
    func applyEffects(card: Card) {
        self.person = Player.shared
        self.person.currentQuestioning -= card.amount * Int(card.multiplier)
    }
}

class CriticizeIncrease: EffectProtocol{
    var person: Person!
    
    func applyEffects(card: Card) {
        self.person = Player.shared
        self.person.currentCriticize += card.amount * Int(card.multiplier)
    }
}

class CriticizeDecrease: EffectProtocol{
    var person: Person!
    
    func applyEffects(card: Card) {
        self.person = Player.shared
        self.person.currentCriticize -= Int(Double(card.amount) * card.multiplier)
    }
}

class ReasoningIncrease: EffectProtocol{
    var person: Person!
    
    func applyEffects(card: Card) {
        self.person = Player.shared
        self.person.currentReasoning += card.amount * Int(card.multiplier)
    }
}

class ReasoningDecrease: EffectProtocol{
    var person: Person!
    
    func applyEffects(card: Card) {
        self.person = Player.shared
        self.person.currentReasoning -= card.amount * Int(card.multiplier)
    }
}


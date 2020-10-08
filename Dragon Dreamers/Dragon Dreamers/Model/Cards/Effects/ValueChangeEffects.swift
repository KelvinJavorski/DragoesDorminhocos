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
        self.person.currentAgree += card.amount
    }
}

class AgreeDecrease: EffectProtocol{
    var person: Person!
    
    func applyEffects(card: Card) {
        self.person = Player.shared
        self.person.currentAgree -= card.amount
    }
}

class AvoidIncrease: EffectProtocol{
    var person: Person!
    
    func applyEffects(card: Card) {
        self.person = Player.shared
        self.person.currentAvoid += card.amount
    }
}

class AvoidDecrease: EffectProtocol{
    var person: Person!
    
    func applyEffects(card: Card) {
        self.person = Player.shared
        self.person.currentAvoid -= card.amount
    }
}

class QuestioningIncrease: EffectProtocol{
    var person: Person!
    
    func applyEffects(card: Card) {
        self.person = Player.shared
        self.person.currentQuestioning += card.amount
    }
}

class QuestioningDecrease: EffectProtocol{
    var person: Person!
    
    func applyEffects(card: Card) {
        self.person = Player.shared
        self.person.currentQuestioning -= card.amount
    }
}

class CriticizeIncrease: EffectProtocol{
    var person: Person!
    
    func applyEffects(card: Card) {
        self.person = Player.shared
        self.person.currentCriticize += card.amount
    }
}

class CriticizeDecrease: EffectProtocol{
    var person: Person!
    
    func applyEffects(card: Card) {
        self.person = Player.shared
        self.person.currentCriticize -= card.amount
    }
}

class ReasoningIncrease: EffectProtocol{
    var person: Person!
    
    func applyEffects(card: Card) {
        self.person = Player.shared
        self.person.currentReasoning += card.amount
    }
}

class ReasoningDecrease: EffectProtocol{
    var person: Person!
    
    func applyEffects(card: Card) {
        self.person = Player.shared
        self.person.currentReasoning -= card.amount
    }
}


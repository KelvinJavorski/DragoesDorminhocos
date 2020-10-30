//
//  Card.swift
//  Dragon Dreamers
//
//  Created by Kaz Born on 05/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit


class Card : EmptyCard, NSCopying{
    var effectsFunction: [EffectProtocol]! = []
    
    init(){}
    
    //Default card
    init(name: String, effects: [EffectType], cost: Int, cardType: CardType, humanType: TargetType, humorInfluence: Int){
        super.init(name: name, effects: effects, cost: cost, type: cardType, humanType: humanType, humorInfluence: humorInfluence)
    }
    
    //Create a List with every FUNCTION EFFECT this card will apply.
    func setupEffectsFunction(){
        let effects = Effect.shared.getEffectByIdsEffect(enumEffect: self.effectsEnum)
        effectsFunction.append(contentsOf: effects)
    }
    
    func applyEffects(){
        setupEffectsFunction()
        for effect in effectsFunction{
            effect.applyEffects(card: self)
        }
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let card = Card(name: name, effects: effectsEnum, cost: cost, cardType: type, humanType: humanType, humorInfluence: humorInfluence)
        return card
    }
    
    // Return the type of mana the card uses
    func switchCardTypeToManaType () -> ManaType {
        switch self.type {
        case .blue:
            return .blue
        case .green:
            return .green
        case .red:
            return .red
        case .yellow:
            return .yellow
        default:
            return .colorless
        }
    }
    
    func getCardTypeColor() -> SKColor{
        if type == CardType.red{
            return UIColor(hexString: "#FF0000")
        }
        else if type == CardType.blue{
            return UIColor(hexString: "#5F5DC1")
        }
        else if type == CardType.green{
            return UIColor(hexString: "#ACC15D")
        }
        else{
            return UIColor(hexString: "#CD9D5B")
        }
    }
    
}

//
//  Card.swift
//  Dragon Dreamers
//
//  Created by Kaz Born on 05/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit


class Card : EmptyCard{
    var damage : Int!
    var damageType: EnergyType!
    var idEffect: Int!
    var selfDamage: Int!
    var selfDamageType: EnergyType!
    var heal : Int!
    var healType: EnergyType!
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
//        for effect in self.effects{
//            effectsFunction.append(Effect.shared.allEffects[effect.rawValue])
//        }
    }
    
    func applyEffects(){
        for effect in effectsFunction{
            effect.applyEffects(card: self)
        }
    }
    
    // Return the type of mana the card uses
    func switchCardTypeToManaType () -> ManaType {
        switch self.type {
        case .blue:
            return .b
        case .green:
            return .g
        case .red:
            return .r
        case .yellow:
            return .y
        default:
            return .b
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

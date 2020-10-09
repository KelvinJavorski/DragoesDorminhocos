//
//  Effect.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 07/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit

class Effect{
    static let shared = Effect()
    var allEffects: [EffectProtocol] = []
    
    func getEffectByIdsEffect(enumEffect : [EffectType]) -> [EffectProtocol]{
        var effects : [EffectProtocol] = []
        for i in 0..<enumEffect.count{
            effects.append(allEffects[(enumEffect[i]).rawValue])
        }
        return effects
    }
    
    func setupEffects(){
        let agreeIncreaseEffect = AgreeIncrease()
        allEffects.append(agreeIncreaseEffect)
        
        let agreeDecreaseEffect = AgreeDecrease()
        allEffects.append(agreeDecreaseEffect)
        
        let avoidIncreaseEffect = AvoidIncrease()
        allEffects.append(avoidIncreaseEffect)
        
        let avoidDecreaseEffect = AvoidDecrease()
        allEffects.append(avoidDecreaseEffect)
        
        let questioningIncreaseEffect = QuestioningIncrease()
        allEffects.append(questioningIncreaseEffect)
        
        let questioningDecreaseEffect = QuestioningDecrease()
        allEffects.append(questioningDecreaseEffect)
        
        let criticizeIncreaseEffect = CriticizeIncrease()
        allEffects.append(criticizeIncreaseEffect)
        
        let criticizeDecreaseEffect = CriticizeDecrease()
        allEffects.append(criticizeDecreaseEffect)
        
        let reasoningIncreaseEffect = ReasoningIncrease()
        allEffects.append(reasoningIncreaseEffect)
        
        let reasoningDecreaseEffect = ReasoningDecrease()
        allEffects.append(reasoningDecreaseEffect)
    }
}

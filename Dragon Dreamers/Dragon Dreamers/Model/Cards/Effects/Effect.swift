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
    var allTurnEffects: [EffectProtocol] = []
    var allBuffEffects: [EffectProtocol] = []
    
    func getEffectByIdsEffect(enumEffect : [EffectType]) -> [EffectProtocol]{
        var effects : [EffectProtocol] = []
        for i in 0..<enumEffect.count{
            effects.append(allEffects[(enumEffect[i]).rawValue])
        }
        return effects
    }
    
    func getTurnEffectByIds(enumEffect : [BattleTurnStatus]) -> [EffectProtocol]{
        var turnEffects : [EffectProtocol] = []
        for i in 0..<enumEffect.count{
            turnEffects.append(allTurnEffects[(enumEffect[i]).rawValue])
        }
        return turnEffects
    }
    
    func getBuffEffectByIds(enumEffect : [BattleStatus]) -> [EffectProtocol]{
        var buffs : [EffectProtocol] = []
        for i in 0..<enumEffect.count{
            buffs.append(allBuffEffects[(enumEffect[i]).rawValue])
        }
        return buffs
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
        
        let drawCardEffect = DrawCard()
        allEffects.append(drawCardEffect)
        
        let discardCardEffect = DiscardCard()
        allEffects.append(discardCardEffect)
        
        let banCardEffect = BanCard()
        allEffects.append(banCardEffect)
        
        let sendCardToDiscardEffect = SendCardToDiscard()
        allEffects.append(sendCardToDiscardEffect)
        
        let addLastPlayedCardToDeck = AddLastPlayedCardToDeck()
        allEffects.append(addLastPlayedCardToDeck)
        
        let addplayBlueTwice = AddPlayBlueCardTwiceStatus()
        allEffects.append(addplayBlueTwice)
        
        let addplayGreenTwice = AddPlayGreenCardTwiceStatus()
        allEffects.append(addplayGreenTwice)
        
        let addplayRedTwice = AddPlayRedCardTwiceStatus()
        allEffects.append(addplayRedTwice)
        
        let addplayYellowTwice = AddPlayYellowCardTwiceStatus()
        allEffects.append(addplayYellowTwice)
        
        let addReasoning = AddReasoningStatus(value: 3)
        allEffects.append(addReasoning)
        
        let addVulnerable = AddVulnerableStatus()
        allEffects.append(addVulnerable)
    }
    
    func setupBuffEffects(){
        let applyVulnerability = ApplyVulnerability()
        allBuffEffects.append(applyVulnerability)
    }
    
    func setupTurnEffects(){
        let reasoning = ApplyReasoning()
        allTurnEffects.append(reasoning)
    }
}

//
//  EmptyCard.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 10/09/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit

class EmptyCard{
    init(name: String? = nil, effects: [EffectType]? = nil, cost: Int = 0, type: CardType? = nil, humanType: TargetType? = nil, humorInfluence: Int = 0) {
        self.name = name
        self.id = EmptyCard.nextID
        EmptyCard.nextID += 1
        self.effectsEnum = effects
        self.cost = cost
        self.type = type
        self.setRandomEmotion()
        self.humanType = humanType
        self.humorInfluence = humorInfluence
    }
    
    static var nextID : Int = 0
    
    var owner: Person!
    var name: String!
    var id : Int = 0
    var effectsEnum : [EffectType]!
    var cost : Int = 0
    var node : SKNode!
    var type : CardType!
    var humanType: TargetType!
    var emotion: BattleEmotion!
    var humorInfluence: Int!
    
    var amount: Int!
    var multiplier: Double = 1.0
    var cardTargetId: Int!
    
    func setRandomEmotion(){
//        self.emotion = BattleEmotion.random()
        self.emotion = .agree
    }
}

//
//  EffectType.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 21/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

enum EffectType : Int, CaseIterable{
    case addAgree = 0
    case removeAgree = 1
    case addAvoid = 2
    case removeAvoid = 3
    case addQuestioning = 4
    case removeQuestioning = 5
    case addCriticize = 6
    case removeCriticize = 7
    case addReasoning = 8
    case removeReasoning = 9
    case drawCard = 10
    case discardCard = 11
    case banCard = 12
    case sendCardToDiscard = 13
    case addLastPlayedCardToDeck = 14
    case setBlueTwice = 15
    case setGreenTwice = 16
    case setRedTwice = 17
    case setYellowTwice = 18
    case setReasoningStatus = 19
    case setVulnerableStatus = 20
//    case addCard = 0
//    case dealDamage = 1
//    case dealAndSufferDamage = 2
//    case heal = 3
//    case permanent = 4
//    case addReasoning = 5
//    case addVulnerability = 6
    
}

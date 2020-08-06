//
//  Person.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 05/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Person{
    internal init(currentLife: Int? = nil, maxLife: Int? = nil, currentOpinion: Int? = nil, maxOpinion: Int? = nil, actionPoints: Int? = nil, emotion: BattleEmotion? = nil) {
        self.currentLife = currentLife
        self.maxLife = maxLife
        self.currentOpinion = currentOpinion
        self.maxOpinion = maxOpinion
        self.actionPoints = actionPoints
        self.emotion = emotion
    }
    
    func loseLife(value: Int){
        self.currentLife -= value
    }
    
    func loseOpinion(value: Int){
        self.currentOpinion -= value
    }
    
    func spendActionPoints(value: Int){
        self.actionPoints -= value
    }
    
    func getActionPoints(value: Int){
        self.actionPoints += value
    }
    
    func resetAllStats(){
        self.currentLife = self.maxLife
        self.currentOpinion = self.maxOpinion
    }
    
    var currentLife: Int!
    var maxLife: Int!
    var currentOpinion: Int!
    var maxOpinion: Int!
    var actionPoints: Int!
    var maxActionPoints: Int!
    var emotion: BattleEmotion!
    
}

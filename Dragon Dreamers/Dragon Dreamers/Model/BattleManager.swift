//
//  BattleManager.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 05/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class BattleManager{
    var player: Player!
    var enemy: Enemy!
    var scene: GameScene!
    //var enemy: Enemy
    var battleState: BattleState = .playerTurn
    var turnEffects: [EffectProtocol] = []
    var buffEffects: [EffectProtocol] = []
    var cardsPlayed: [Card] = []
    
    func setup(){
        Effect.shared.setupEffects()
        Effect.shared.setupBuffEffects()
        Effect.shared.setupTurnEffects()
    }
    func setEnemy(enemy: Enemy) {
        self.enemy = enemy
    }
    
    func startBattle(){
        player = Player.shared
        player.setOpponent(person: enemy.self)
        enemy.setOpponent(person: player.self)
        enemy.setHand()
    }
    
    func endBattle(){
        if player.isAtributeFinished(atribute: .agree){
            sendToOutcome()
        }
        else if player.isAtributeFinished(atribute: .avoid){
            sendToOutcome()
        }
        else if enemy.isAtributeFinished(atribute: .agree){
            sendToOutcome()
        }
        else if enemy.isAtributeFinished(atribute: .questioning){
            sendToOutcome()
        }
    }
    func sendToOutcome(){
         print("Acabou a batalha")
 //        scene.navigation.performSegue(withIdentifier: "toOutcome", sender: self)
     }
    
    func initTurn(){
        enemy.setHand()
        setTurnEffects()
        applyTurnEffects()
    }
    
    func playerTurn(){
        
    }
    
    func playCard(card: Card){
//        let person = card.owner.opponent!
        applyBuffEffects(card: card)
        card.applyEffects()
    }
    
    func setBuffEffects(){
        self.buffEffects.removeAll()
        let buffsEnum = player.currentStatus!
        self.buffEffects = Effect.shared.getBuffEffectByIds(enumEffect: buffsEnum)
    }
    
    func setTurnEffects(){
        self.turnEffects.removeAll()
        let effectsEnum = player.currentTurnStatus!
        self.turnEffects =  Effect.shared.getTurnEffectByIds(enumEffect: effectsEnum)
    }
    
    func applyBuffEffects(card: Card){
        for buff in buffEffects{
            buff.applyEffects(card: card)
        }
    }
    
    func applyTurnEffects(){
        for effect in turnEffects{
            effect.applyEffects(card: Card())
        }
    }
    
    func endPlayerTurn(){
        enemyTurn()
    }
    
    func enemyTurn(completion: @escaping () -> () = { }) {
        enemy.playTurn()
//        self.storeCard(card: enemy.playOneCard())
        completion()
    }
    
    func endEnemyTurn(){
        endBattle()
    }
    
    func storeCard(card : Card){
        cardsPlayed.append(card)
    }
}

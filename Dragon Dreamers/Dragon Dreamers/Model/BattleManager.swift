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
    var afterDrawStatus: [Status] = []
    var cardsPlayed: [Card] = []
//    var currentTurnStatus: [BattleTurnStatus] = []
//    var currentBuffStatus: [BattleStatus] = []
    
    // MARK: Setup
    func setup(){
        Effect.shared.setupEffects()
    }
    
    func setEnemy(enemy: Enemy) {
        self.enemy = enemy
    }
    
    //MARK: Turns
    func startBattle(){
        player = Player.shared
        player.setOpponent(person: enemy.self)
        enemy.setOpponent(person: player.self)
        enemy.setHand()
        player.scene = scene
    }
    
    func endBattle(){
    }
    
    func initPlayerTurn(){
        enemy.setHand()
        applyPlayerTurnEffects()
        applyEnemyTurnEffects()
        player.lastHand.cards = player.hand.cards
    }
    
    func endPlayerTurn(){
    }
    
    func initEnemyTurn(completion: @escaping () -> () = { }) {
        enemy.playTurn()
//        self.storeCard(card: enemy.playOneCard())
        completion()
    }
    
    func endEnemyTurn(){
        endBattle()
    }
    
    //MARK: Effects
    
    func setAfterDrawEffects(){
        afterDrawStatus.removeAll()
        afterDrawStatus.append(contentsOf: player.currentAfterDrawStatus)
        afterDrawStatus.append(contentsOf: enemy.currentAfterDrawStatus)
    }
    
    func applyAfterDrawEffects(){
        setAfterDrawEffects()
        for status in afterDrawStatus{
            status.effect.applyEffects(card: Card())
        }
    }
    
    func applyPlayerTurnEffects(){
        for (i, status) in player.status.enumerated(){
            status.effect.applyEffects(card: Card())
            status.decreaseDuration(amount: 1)
            if status.duration == 0{
                player.status.remove(at: i)
            }
        }
    }
    
    func applyEnemyTurnEffects(){
        for (i, status) in enemy.status.enumerated(){
            status.effect.applyEffects(card: Card())
            status.decreaseDuration(amount: 1)
            if status.duration == 0{
                enemy.status.remove(at: i)
            }
        }
    }
    
    //MARK: Others
    
    func sendToOutcome(){
         print("Acabou a batalha")
 //        scene.navigation.performSegue(withIdentifier: "toOutcome", sender: self)
    }
    
    func playCard(card: Card){
//        let person = card.owner.opponent!
        card.applyEffects()
        printPlayerInfos()
    }
    
    func printPlayerInfos(){
        for token in player.tokens{
            print("Way: \(token.way) - Amount: \(token.amount) - Name: \(token.name)")
        }
        for way in player.ways{
            print("Way: \(way.name) - Blocked: \(way.blocked)")
        }
    }

    func storeCard(card : Card){
        cardsPlayed.append(card)
    }
}

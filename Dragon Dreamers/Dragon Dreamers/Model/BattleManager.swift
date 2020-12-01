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
    var battleState: BattleState = .playerTurn
    var turnEffects: [EffectProtocol] = []
    var buffEffects: [EffectProtocol] = []
    var afterDrawStatus: [Status] = []
    var cardsPlayed: [Card] = []
    
    // MARK: Setup
    func setup(){
        Effect.shared.setupEffects()
        Effect.shared.setupEnemyEffects()
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
        player.resetWay()
        player.setOwner()
        player.setOpponent(person: enemy)
        enemy.setOwner()
        enemy.setOpponent(person: player)
    }
    
    func endBattle(){
        if Player.shared.sol.endFlag == true {
            Player.shared.resetDecks()
            enemy.resetDecks()
            self.scene.navigation.endBattle(way: .sol)
        }
        if Player.shared.oceano.endFlag == true {
            Player.shared.resetDecks()
            enemy.resetDecks()
            self.scene.navigation.endBattle(way: .oceano)
        }
        if Player.shared.brisa.endFlag == true {
            Player.shared.resetDecks()
            enemy.resetDecks()
            self.scene.navigation.endBattle(way: .brisa)
        }
        if Player.shared.areia.endFlag == true {
            Player.shared.resetDecks()
            enemy.resetDecks()
            self.scene.navigation.endBattle(way: .areia)
        }
 
        Player.shared.sol.setResetEngFlag()
        Player.shared.oceano.setResetEngFlag()
        Player.shared.brisa.setResetEngFlag()
        Player.shared.areia.setResetEngFlag()
        
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
//        endBattle()
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
        for status in player.status{
            status.effect.applyEffects(card: Card())
            status.decreaseDuration(amount: 1)
        }
        player.status.removeAll { $0.duration == 0 }
    }
    
    func applyEnemyTurnEffects(){
        for status in enemy.status{
            status.effect.applyEffects(card: Card())
            status.decreaseDuration(amount: 1)
        }
        enemy.status.removeAll { $0.duration == 0 }
    }
    
    //MARK: Others
    
    func sendToOutcome(){
         print("Acabou a batalha")
 //        scene.navigation.performSegue(withIdentifier: "toOutcome", sender: self)
    }
    
    func playCard(card: Card){
//        let person = card.owner.opponent!
        if !card.owner.cardEffectBlocked{
            card.applyEffects()
        }
        //AQUI SETA A FLAG DO WAY
        if Player.shared.sol.current >= 10 {
            Player.shared.sol.setEndFlagTrue()
        }
        if Player.shared.oceano.current >= 10 {
            Player.shared.oceano.setEndFlagTrue()
        }
        if Player.shared.brisa.current >= 10 {
            Player.shared.brisa.setEndFlagTrue()
        }
        if Player.shared.areia.current >= 10 {
            Player.shared.areia.setEndFlagTrue()
        }
        
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

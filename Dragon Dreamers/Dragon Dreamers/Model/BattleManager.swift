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
    var cardsPlayed: [Card] = []
    
    func setEnemy(enemy: Enemy) {
        self.enemy = enemy
    }
    
    func startBattle(){
        player = Player.shared
        //enemy = Enemy.shared
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
    }
    
    func endTurn(){
        enemyTurn()
        endBattle()
    }
    
    func enemyTurn(completion: @escaping () -> () = { }) {
        enemy.playTurn()
//        self.storeCard(card: enemy.playOneCard())
        completion()
    }
    
    func showCurrentInformations(){
        if let playerLife = player.currentAgree{
            print("Player life \(playerLife)")
        }
        if let enemyLife = enemy.currentAgree{
            print("Enemy life \(enemyLife)")
        }
    }
    
    func storeCard(card : Card){
        cardsPlayed.append(card)
    }
}

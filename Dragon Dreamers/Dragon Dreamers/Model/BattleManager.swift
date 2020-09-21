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
    }
    
    func endBattle(){
        if player.isAtributeFinished(atribute: .life){
            sendToOutcome()
        }
        else if player.isAtributeFinished(atribute: .empathy){
            sendToOutcome()
        }
        else if enemy.isAtributeFinished(atribute: .life){
            sendToOutcome()
        }
        else if enemy.isAtributeFinished(atribute: .reason){
            sendToOutcome()
        }
    }
    
    func sendToOutcome(){
        print("Acabou a batalha")
        scene.navigation.performSegue(withIdentifier: "toOutcome", sender: self)
    }
    
    func initTurn(){
        enemy.setHand()
    }
    
    func endTurn(){
        for card in cardsPlayed.reversed(){
            card.playCard()
//            print("\(card.name!) played by \(card.owner)")
//            showCurrentInformations()
//            print("---")
        }
        cardsPlayed.removeAll()
        endBattle()
    }
    
    func enemyTurn() {
        enemy.playTurn()
        self.storeCard(card: enemy.playOneCard())
    }
    
    func showCurrentInformations(){
        if let playerLife = player.currentLife{
            print("Player life \(playerLife)")
        }
        if let enemyLife = enemy.currentLife{
            print("Enemy life \(enemyLife)")
        }
    }
    
    func storeCard(card : Card){
        cardsPlayed.append(card)
    }
}

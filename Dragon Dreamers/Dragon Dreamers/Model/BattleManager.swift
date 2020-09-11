//
//  BattleManager.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 05/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class BattleManager{
    var player: Player!
    var enemy: Enemy!
    //var enemy: Enemy
    var battleState: BattleState = .playerTurn
    var cardsPlayed: [Card] = []
    
    func startBattle(){
        player = Player.shared
        enemy = Enemy.shared
        player.setOpponent(person: enemy.self)
        enemy.setOpponent(person: player.self)
    }
    
    func endBattle(){
        
    }
    
    func initTurn(){
        enemy.setHand()
    }
    
    func endTurn(){
        for card in cardsPlayed.reversed(){
            card.playCard()
            print("\(card.name!) played by \(card.owner)")
            showCurrentInformations()
            print("---")
        }
    }
    
    func enemyTurn(completion: @escaping () -> () ) {
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

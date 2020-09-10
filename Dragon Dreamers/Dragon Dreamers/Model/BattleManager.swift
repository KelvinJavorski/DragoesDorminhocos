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
    
    func initPlayerTurn(){
        
    }
    
    func endTurn(){
        for card in cardsPlayed{
            card.playCard()
        }
    }
    
    func enemyTurn(){
        switch enemy.emotion {
        case .aggro:
            print("VOCÊ TÁ MALUCÃO?")
        default:
            print("eae bichao")
        }
    }
    
    func storeCard(card : Card){
        cardsPlayed.append(card)
    }
}

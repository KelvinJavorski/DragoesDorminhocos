//
//  Mana.swift
//  Dragon Dreamers
//
//  Created by Kevin Ribeiro on 19/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit

enum ManaType : String, CaseIterable{
    case blue
    case red
    case yellow
    case green
    case colorless
    
    static func random<G: RandomNumberGenerator>(using generator: inout G) -> ManaType {
        return ManaType.allCases.randomElement(using: &generator)!
    }
    
    static func random() -> ManaType {
        var g = SystemRandomNumberGenerator()
        return ManaType.random(using: &g)
    }

}

class Mana {
    init(id: String, type: ManaType){
        self.isAvaliable = false
        self.isInPool = false
        self.id = id
        self.type = type

    }
    
    var type: ManaType
    var isAvaliable: Bool
    var node: SKNode?
    var isInPool: Bool
    var id: String
    
    func setAvaliableStatus(status: Bool) {
        self.isAvaliable = status
    }
    
    func setId(id: String){
        self.id = id
    }
    
    func setType(type: ManaType){
        self.type = type
    }
    
    func getAvaliableStatus() -> Bool{
        return self.isAvaliable
    }
    
    func getId() -> String{
        return self.id
    }
    
    func getType() -> ManaType{
        return self.type
    }
    
    func insertInPool(){
        self.isInPool = true
    }
    
    func dropFromPool(){
        self.isInPool = false
    }
    
    func getColor(){
        
    }
    func updateNodeFromType () -> SKSpriteNode{
        switch self.type {
            case ManaType.blue: return SKSpriteNode(fileNamed: "blue")!
            case ManaType.red: return SKSpriteNode(fileNamed: "red")!
            case ManaType.yellow: return SKSpriteNode(fileNamed: "yellow")!
            case ManaType.green: return SKSpriteNode(fileNamed: "green")!
            case ManaType.colorless: return SKSpriteNode(fileNamed: "colorless")!
                
        }
    }
    
    
    
}

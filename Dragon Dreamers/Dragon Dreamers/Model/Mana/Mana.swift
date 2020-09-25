//
//  Mana.swift
//  Dragon Dreamers
//
//  Created by Kevin Ribeiro on 19/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit

enum ManaType{
    case b
    case r
    case y
    case g
    
    case br
    case by
    case bg
    
    case ry
    case rg
    
    case yg
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
            case ManaType.b: return SKSpriteNode(fileNamed: "b")!
            case ManaType.r: return SKSpriteNode(fileNamed: "r")!
            case ManaType.y: return SKSpriteNode(fileNamed: "y")!
            case ManaType.g: return SKSpriteNode(fileNamed: "g")!
            
            case ManaType.br: return SKSpriteNode(fileNamed: "br")!
            case ManaType.by: return SKSpriteNode(fileNamed: "by")!
            case ManaType.bg: return SKSpriteNode(fileNamed: "bg")!
            
            case ManaType.ry: return SKSpriteNode(fileNamed: "ry")!
            case ManaType.rg: return SKSpriteNode(fileNamed: "rg")!
            
            case ManaType.yg: return SKSpriteNode(fileNamed: "yg")!
                
        }
    }
    
    
    
}

//
//  Way.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 26/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit

class Way{
    
    init(name: String){
        self.name = name
        initialValues()
    }
    
    var name: String!
    var current: Int!
    var maxValue: Int!
    var blocked: Bool = false
    
    func initialValues(){
        
    }
    
    func increaseAmount(amount: Int){
        if !blocked{
            current += amount
        }
    }
    
    func decreaseAmount(amount: Int){
        if !blocked{
            current += amount
        }
    }
    
    func changeBlockStatus(){
        blocked = !blocked
    }
}

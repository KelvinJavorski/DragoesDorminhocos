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
    
    public var name: String!
    public var current: Int!
    public var maxValue: Int!
    public var endFlag: Bool = false
    public var blocked: Bool = false
    
    private func initialValues(){
        self.current = 0
        self.maxValue = 10
    }
    
    public func increaseAmount(amount: Int){
        if !blocked{
            current += amount
        }
    }
    
    public func decreaseAmount(amount: Int){
        if !blocked{
            current -= amount
        }
    }
    
    public func changeBlockStatus(_ bool: Bool){
        blocked = bool
    }
    
    public func setEndFlagTrue() {
        self.endFlag = true
    }
    
    public func setResetEngFlag() {
        self.endFlag = false
    }
}

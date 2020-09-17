//
//  DataTemp.swift
//  Dragon Dreamers
//
//  Created by Kevin Ribeiro on 17/09/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class DataTemp {
    static let shared = DataTemp()
    
    var chosenEnemy: Enemy!

    init () {
    
    }
    
    func setChosenEnemy (enemy: Enemy) {
        chosenEnemy = enemy
    }
}


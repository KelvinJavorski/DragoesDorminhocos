//
//  DataSave.swift
//  Dragon Dreamers
//
//  Created by Kevin Ribeiro on 10/09/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class DataSave {
    static let shared = DataSave()
    
    var enemys: [Enemy] = [Enemy(name: "Vó Matilda",discussion: Discussion())]

    init () {
    
    }
}

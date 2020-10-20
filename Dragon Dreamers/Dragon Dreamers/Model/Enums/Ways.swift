//
//  Ways.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 20/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
enum Ways: Int, CaseIterable {
    case sol = 0
    case areia = 1
    case brisa = 2
    case oceano = 3
    
    static func random<G: RandomNumberGenerator>(using generator: inout G) -> Ways {
        return Ways.allCases.randomElement(using: &generator)!
    }
    
    static func random() -> Ways {
        var g = SystemRandomNumberGenerator()
        return Ways.random(using: &g)
    }
}

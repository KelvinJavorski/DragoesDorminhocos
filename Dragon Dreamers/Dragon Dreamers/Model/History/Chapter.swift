//
//  Chapter.swift
//  Dragon Dreamers
//
//  Created by Kevin Ribeiro on 20/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Chapter {
    
    var isConsumed: Bool = false
    var speechs: [Speech]
    
    init(speechs: [Speech]) {
        self.speechs = speechs
    }
    
    func consumeChapter() {
        
    }
    
}

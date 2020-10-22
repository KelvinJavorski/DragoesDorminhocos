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
    static var next_id: Int = 0
    let id: Int
    
    init(speechs: [Speech]) {
        self.speechs = speechs
        
        self.id = Speech.next_id
        Speech.next_id += 1
    }
    
    func consumeChapter() {
        
    }
    
    func setIsConsumed(isConsumed: Bool) {
        self.isConsumed = isConsumed
    }
    
}

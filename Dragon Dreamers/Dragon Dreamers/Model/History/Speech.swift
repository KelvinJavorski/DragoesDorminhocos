//
//  Speech.swift
//  Dragon Dreamers
//
//  Created by Kevin Ribeiro on 20/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Speech {
    
    var isDecision: Bool
    var isConsumed: Bool
    var text: String
    var decisionText: [String?]
    static var next_id: Int = 0
    let id: Int
    
    init(text: String) {
        self.isDecision = false
        self.text = text
        self.isConsumed = false
        decisionText = [""]
        
        self.id = Speech.next_id
        Speech.next_id += 1
    }
    
    init(text: String, decisionText: [String]) {
        self.isDecision = true
        self.text = text
        self.isConsumed = false
        self.decisionText = decisionText
        
        self.id = Speech.next_id
        Speech.next_id += 1
    }
    
    func setIsConsumed(isConsumed: Bool) {
        self.isConsumed = isConsumed
    }
    
}

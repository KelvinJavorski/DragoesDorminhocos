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
    var isConsumed: Bool = false
    var text: String
    var decisionText: [String?]
    
    init(text: String) {
        self.isDecision = false
        self.text = text
        decisionText = [""]
    }
    
    init(text: String, decisionText: [String]) {
        self.isDecision = true
        self.text = text
        self.decisionText = decisionText
    }
    
    func setIsConsumed(isConsumed: Bool) {
        self.isConsumed = isConsumed
    }
    
}

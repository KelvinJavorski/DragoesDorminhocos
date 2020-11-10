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
    var posDecisionText: [String?]
    var posBattle: [String?]
    static var next_id: Int = 0
    let id: Int
    
    init(text: String) {
        self.isDecision = false
        self.text = text
        self.isConsumed = false
        self.decisionText = [""]
        self.posDecisionText = [""]
        self.posBattle = [""]
        
        self.id = Speech.next_id
        Speech.next_id += 1
    }
    
    init(text: String, decisionText: [String], posDecisionText: [String]) {
        self.isDecision = true
        self.text = text
        self.isConsumed = false
        self.decisionText = decisionText
        self.posDecisionText = posDecisionText
        self.posBattle = [""]
        
        self.id = Speech.next_id
        Speech.next_id += 1
    }
    
    init(posBattle: [String]) {
        self.isDecision = false
        self.text = ""
        self.isConsumed = false
        self.decisionText = [""]
        self.posDecisionText = [""]
        self.posBattle = posBattle
        
        self.id = Speech.next_id
        Speech.next_id += 1
    }
    
    func setIsConsumed(isConsumed: Bool) {
        self.isConsumed = isConsumed
    }
    
}

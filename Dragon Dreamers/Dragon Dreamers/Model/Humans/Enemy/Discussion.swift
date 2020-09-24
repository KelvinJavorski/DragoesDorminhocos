//
//  Discussion.swift
//  Dragon Dreamers
//
//  Created by Kevin Ribeiro on 10/09/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

enum PhraseType{
    
    case agree
    case avoid
    case questioning
    case criticize
}

class Discussion {
    
    var agree: [Phrase]
    var avoid: [Phrase]
    var questioning: [Phrase]
    var criticize: [Phrase]
    var humor: BattleEmotion
    
    init(agree: [String], avoid: [String], questioning: [String], criticize: [String], humor: BattleEmotion) {
        
        self.agree = []
        for aux in 0..<agree.count {
            self.agree[aux] = Phrase(text: agree[aux], isAvaliable: true)
        }
        
        self.avoid = []
        for aux in 0..<avoid.count {
            self.avoid[aux] = Phrase(text: avoid[aux], isAvaliable: true)
        }
        
        self.questioning = []
        for aux in 0..<questioning.count {
            self.questioning[aux] = Phrase(text: questioning[aux], isAvaliable: true)
        }
        
        self.criticize = []
        for aux in 0..<criticize.count {
            self.criticize[aux] = Phrase(text: criticize[aux], isAvaliable: true)
        }
        
        self.humor = humor
    }
    
    func setHumor (humor: BattleEmotion) {
        self.humor = humor
    }
    
    func useNextPhraseAvaliableText (type: PhraseType) -> String? {
        
        switch type {
            
        case .agree:
            
            for phrase in self.agree {
                if phrase.isAvaliable {
                    phrase.setAvaliable(isAvaliable: false)
                    return phrase.text
                }
            }
            
        case .avoid:
                
            for phrase in self.avoid {
                if phrase.isAvaliable {
                    phrase.setAvaliable(isAvaliable: false)
                    return phrase.text
                }
            }
            
        case .questioning:
                
            for phrase in self.questioning {
                if phrase.isAvaliable {
                    phrase.setAvaliable(isAvaliable: false)
                    return phrase.text
                }
            }
            
        case .criticize:
                
            for phrase in self.criticize {
                if phrase.isAvaliable {
                    phrase.setAvaliable(isAvaliable: false)
                    return phrase.text
                }
            }
        }
        
        return nil
    }
    
    func usePhraseText (type: PhraseType, index: Int) -> String? {
        switch type {
            
        case .agree:
            
            if self.agree[index].isAvaliable {
                self.agree[index].setAvaliable(isAvaliable: false)
                return self.agree[index].text
            }
            
        case .avoid:
        
            if self.avoid[index].isAvaliable {
                self.avoid[index].setAvaliable(isAvaliable: false)
                return self.avoid[index].text
            }
            
        case .questioning:
        
            if self.questioning[index].isAvaliable {
                self.questioning[index].setAvaliable(isAvaliable: false)
                return self.questioning[index].text
            }
            
        case .criticize:
        
            if self.criticize[index].isAvaliable {
                self.criticize[index].setAvaliable(isAvaliable: false)
                return self.criticize[index].text
            }
        }
        return nil
    }
    
    func resetAllPhrasesToAvaliable () {
        self.resetPhrasesToAvaliable(type: .agree)
        self.resetPhrasesToAvaliable(type: .avoid)
        self.resetPhrasesToAvaliable(type: .questioning)
        self.resetPhrasesToAvaliable(type: .criticize)
    }
    
    func resetPhrasesToAvaliable (type: PhraseType) {
        switch type {
                
            case .agree:
                
                for phrase in self.agree {
                    phrase.setAvaliable(isAvaliable: true)
                }
                
            case .avoid:
            
                for phrase in self.avoid {
                    phrase.setAvaliable(isAvaliable: true)
                }
                
            case .questioning:
            
                for phrase in self.questioning {
                    phrase.setAvaliable(isAvaliable: true)
                }
                
            case .criticize:
            
                for phrase in self.criticize {
                    phrase.setAvaliable(isAvaliable: true)
                }
        }
    }
}
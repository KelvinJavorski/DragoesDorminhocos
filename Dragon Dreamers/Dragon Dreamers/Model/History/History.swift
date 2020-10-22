//
//  History.swift
//  Dragon Dreamers
//
//  Created by Kevin Ribeiro on 20/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class History {
    
    static var chapters = [Chapter(speechs: [Speech(text: "1balão1"),
                                      Speech(text: "1balão2", decisionText: ["1","2","3","4","5"])]),
                    Chapter(speechs: [Speech(text: "2balão1"),
                                      Speech(text: "2balão2", decisionText: ["1","2","3","4","5"])]),
                    Chapter(speechs: [Speech(text: "3balão1"),
                                      Speech(text: "3balão2", decisionText: ["1","2","3","4","5"])]),
                    Chapter(speechs: [Speech(text: "4balão1"),
                                      Speech(text: "4balão2", decisionText: ["1","2","3","4","5"])])]
    
    init() {
        
    }
    
    func getAvaliableChapter() -> Chapter? {
        for chapter in History.chapters {
            if chapter.isConsumed == false {
                return chapter
            }
        }
        return nil
    }
    
    func getAvaliableSpeech() -> Speech?{
        
        let auxChapter = self.getAvaliableChapter()
        
        if auxChapter == nil {
            return nil
        }
        else {
            for speech in auxChapter!.speechs {
                if speech.isConsumed == false {
                    return speech
                }
            }
        }
        return nil
    }
    
    func consumeSpeech() -> Speech?{
        let auxSpeech = self.getAvaliableSpeech()
        if auxSpeech == nil {
            return nil
        }
        else{
            auxSpeech?.setIsConsumed(isConsumed: true)
            
            return auxSpeech
        }
    
    }
    
    func resetAllChapters() {
        for chapter in History.chapters {
            chapter.setIsConsumed(isConsumed: false)
            for speech in chapter.speechs {
                speech.setIsConsumed(isConsumed: false)
            }
        }
    }
    
    func resetAvaliableChapter() -> Bool{
        let auxChapter = self.getAvaliableChapter()
        
        if auxChapter == nil {
            return false
        }
        
        auxChapter!.setIsConsumed(isConsumed: false)
        
        for speech in auxChapter!.speechs {
            speech.setIsConsumed(isConsumed: false)
        }
        
        return true
    }
    
    func consumeChapter() -> Chapter?{
        
        let auxChapter = self.getAvaliableChapter()
        
        if auxChapter == nil {
            return nil
        }
        
        auxChapter!.setIsConsumed(isConsumed: true)
        
        for speech in auxChapter!.speechs {
            speech.setIsConsumed(isConsumed: true)
        }
        
        return auxChapter!
        
    }
    
}

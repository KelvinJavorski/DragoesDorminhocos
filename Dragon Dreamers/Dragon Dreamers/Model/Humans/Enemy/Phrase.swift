//
//  phrase.swift
//  Dragon Dreamers
//
//  Created by Kevin Ribeiro on 23/09/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Phrase {
    
    var text: String
    var isAvaliable: Bool
    
    init(text: String, isAvaliable: Bool) {
        self.text = text
        self.isAvaliable = isAvaliable
    }
    
    func setAvaliable (isAvaliable: Bool) {
        self.isAvaliable = isAvaliable
    }
}

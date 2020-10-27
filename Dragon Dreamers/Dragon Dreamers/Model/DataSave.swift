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

    var gameCampaign = GameCampaign()
    var actualChapterIndex: Int = 0

    init () {
    
    }
    
    func setActualChapter(chapterIndex: Int){
        self.actualChapterIndex = chapterIndex
    }
}

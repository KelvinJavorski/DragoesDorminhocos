//
//  StoryViewController.swift
//  Dragon Dreamers
//
//  Created by Kevin Ribeiro on 19/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//
enum ViewType {
    case speechAndChoice
    case onlySpeech
}


extension UIButton {
    func setTitleWithoutAnimation(title: String?) {
        UIView.setAnimationsEnabled(false)

        setTitle(title, for: [])

        layoutIfNeeded()
        UIView.setAnimationsEnabled(true)
    }
}

import UIKit

class StoryViewController: UIViewController {
    
    @IBOutlet weak var baloonButton: UIButton!
    
    @IBOutlet weak var perfilImageView: UIImageView!
    
    @IBOutlet weak var nameImageView: UIImageView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var baloonImageView: UIImageView!
    
    @IBOutlet weak var backgroudImageView: UIImageView!
    
    @IBOutlet weak var choice1ButtonOutlet: UIButton!
    
    @IBOutlet weak var choice2ButtonOutlet: UIButton!
    
    @IBOutlet weak var choice3ButtonOutlet: UIButton!
    
    @IBOutlet weak var choice4ButtonOutlet: UIButton!
    
    @IBOutlet weak var choice5ButtonOutlet: UIButton!
    
    var history: History = DataSave.shared.gameCampaign.history
    var chapter: Chapter? = DataSave.shared.gameCampaign.history.chapters[DataSave.shared.actualChapterIndex]
    var speech: Speech?
    var speechId: Int?
    var chapterid: Int?
    var viewType: ViewType = ViewType.onlySpeech
    var decisions: [ManaType] = []
    //var tempDecisions: [ManaType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if chapter == nil {
            DataSave.shared.gameCampaign.history.resetAllChapters()
            
            chapter = DataSave.shared.gameCampaign.history.consumeChapter()
        }
        
        chapterid = chapter!.id
        
        speech = chapter!.speechs[0]
        speechId = speech!.id
        
        self.setup()
        
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        self.setupOrUpdateView()
        
        self.setupPerfilImageView()
        self.setupNameImageView()
        self.setupTextLabel()
        self.setupBaloonImageView()
        self.setupBackgroudImageView()
    
    }
    
    func update() {
        self.setupOrUpdateView()
        
        self.updatePerfilImageView()
        self.updateNameImageView()
        self.updateTextLabel()
        self.updateBaloonImageView()
        self.updateBackgroudImageView()
            
    }
    
    func nextSpeech() {
        
        let pastSpeech = self.speech
        
        var speechlag = false
        
        for auxSpeech in self.chapter!.speechs {
            if auxSpeech.id == (self.speechId! + 1) && !speechlag{
                speechlag = true
                self.speech!.setIsConsumed(isConsumed: true)
                self.speech = auxSpeech
                self.speechId = auxSpeech.id
                
            }
        }
        
        if self.speech != nil {
            if pastSpeech!.id == self.speech!.id {
                self.endChapter()
            }
        }
        else {
            self.endChapter()
        }
        
        self.update()
    }
    
    func endChapter() {
        
        var chapterFlag = false
        let pastChapter = self.chapter
        
        for auxChapter in self.history.chapters {
            if auxChapter.id == (self.chapterid! + 1) && !chapterFlag{
                chapterFlag = true
                self.chapter!.setIsConsumed(isConsumed: true)
                self.chapter = auxChapter
                self.chapterid = auxChapter.id
                
            }
        }
        
        if pastChapter!.id != 0 {
            self.adjustMana()
            performSegue(withIdentifier: "StoryToBattleSegue", sender: nil)
            //self.tempDecisions = []
            return
        }
        
        if self.chapter != nil && pastChapter!.id != 0{
            if pastChapter!.id == self.chapter!.id {
                //ULTIMA BATALHA
                if self.chapterid != 1 {
                    self.adjustMana()
                }
                performSegue(withIdentifier: "StoryToBattleSegue", sender: nil)
                //self.tempDecisions = []
                return
            }
        }
        else if pastChapter!.id != 0{
            //ULTIMA BATALHA
            if self.chapterid != 1 {
                self.adjustMana()
            }
            performSegue(withIdentifier: "StoryToBattleSegue", sender: nil)
            //self.tempDecisions = []
            return
        }
        
        if self.chapterid != 1 {
            self.adjustMana()
        }
        //self.tempDecisions = []
        self.speech = self.chapter!.speechs[0]
        self.speechId = self.speech!.id
        self.update()
    }
    
    func setupOrUpdateView() {
        if self.speech!.isDecision {
            self.viewType = ViewType.speechAndChoice
            
            self.baloonButton.isHidden = true
            
            self.setupChoice1Button()
            self.setupChoice2Button()
            self.setupChoice3Button()
            self.setupChoice4Button()
            self.setupChoice5Button()
            
            self.choice1ButtonOutlet.isHidden = false
            self.choice2ButtonOutlet.isHidden = false
            self.choice3ButtonOutlet.isHidden = false
            self.choice4ButtonOutlet.isHidden = false
            
            if self.chapterid == 0 {
                self.choice5ButtonOutlet.isHidden = false
            }
            else {
                self.choice5ButtonOutlet.isHidden = true
            }
        }
        else {
            self.viewType = ViewType.onlySpeech
            
            self.baloonButton.isHidden = false
            
            self.choice1ButtonOutlet.isHidden = true
            self.choice2ButtonOutlet.isHidden = true
            self.choice3ButtonOutlet.isHidden = true
            self.choice4ButtonOutlet.isHidden = true
            self.choice5ButtonOutlet.isHidden = true
            
        }
    }
    
    func adjustMana() {
        //var manas = Player.shared.manaManager.manaPool
        
//        for mana in 0..<Player.shared.manaManager.manaPool.count{
//            self.decisions[mana] = Player.shared.manaManager.manaPool[mana].type
//        }\
        
        var manaAux = [0,0,0,0]
        var fillPoolAux: [ManaType] = [.colorless]
        
        for decision in self.decisions {
            switch decision {
            case .blue:
                manaAux[0] += 1
            case .yellow:
                manaAux[1] += 1
            case .green:
                manaAux[2] += 1
            case .red:
                manaAux[3] += 1
            default:
                break
            }
        }
        
        if manaAux[0] >= manaAux[1] && manaAux[0] >= manaAux[2] && manaAux[0] >= manaAux[3] {
            fillPoolAux.append(contentsOf: [.blue, .blue])
            Player.shared.manaManager.fillPool(manas: fillPoolAux)
            return
        }
        if manaAux[1] >= manaAux[0] && manaAux[1] >= manaAux[2] && manaAux[1] >= manaAux[3] {
            fillPoolAux.append(contentsOf: [.yellow, .yellow])
            Player.shared.manaManager.fillPool(manas: fillPoolAux)
            return
        }
        if manaAux[2] >= manaAux[0] && manaAux[2] >= manaAux[1] && manaAux[2] >= manaAux[3] {
            fillPoolAux.append(contentsOf: [.green, .green])
            Player.shared.manaManager.fillPool(manas: fillPoolAux)
            return
        }
        if manaAux[3] >= manaAux[0] && manaAux[3] >= manaAux[1] && manaAux[3] >= manaAux[2] {
            fillPoolAux.append(contentsOf: [.red, .red])
            Player.shared.manaManager.fillPool(manas: fillPoolAux)
            return
        }

        //manas.append(contentsOf: self.tempDecisions)
        
    }
    
    @IBAction func baloonButton(_ sender: UIButton) {
        self.nextSpeech()
    }
    
    @IBAction func choice1Button(_ sender: UIButton) {
        //self.tempDecisions.append(.blue)
        if self.chapterid != 1 {
            self.decisions.append(.blue)
        }
        self.nextSpeech()
    }
    
    @IBAction func choice2Button(_ sender: UIButton) {
        //self.tempDecisions.append(.yellow)
        if self.chapterid != 1 {
            self.decisions.append(.yellow)
        }
        self.nextSpeech()
    }
    
    @IBAction func choice3Button(_ sender: UIButton) {
        //self.tempDecisions.append(.green)
        if self.chapterid != 1 {
            self.decisions.append(.green)
        }
        self.nextSpeech()
    }
    
    @IBAction func choice4Button(_ sender: UIButton) {
        //self.tempDecisions.append(.red)
        if self.chapterid != 1 {
            self.decisions.append(.red)
        }
        self.nextSpeech()
    }
    
    @IBAction func choice5Button(_ sender: UIButton) {
        self.nextSpeech()
    }
    
    func setupChoice1Button() {
        self.choice1ButtonOutlet.setTitleWithoutAnimation(title: self.speech!.decisionText[0])
        
        self.choice1ButtonOutlet.titleLabel!.numberOfLines = 0
        self.choice1ButtonOutlet.titleLabel!.adjustsFontSizeToFitWidth = true
        self.choice1ButtonOutlet.titleLabel!.minimumScaleFactor = 0.7
        
        self.choice1ButtonOutlet.titleLabel!.font = self.choice2ButtonOutlet.titleLabel!.font.withSize(self.choice2ButtonOutlet.titleLabel!.font.pointSize * 0.85)
        
        self.choice1ButtonOutlet.titleLabel!.widthAnchor.constraint(equalToConstant: self.choice1ButtonOutlet.frame.width*CGFloat(0.85)).isActive = true
        
    }
    
    func setupChoice2Button() {
        self.choice2ButtonOutlet.setTitleWithoutAnimation(title: self.speech!.decisionText[1])
        
        self.choice2ButtonOutlet.titleLabel!.numberOfLines = 0
        self.choice2ButtonOutlet.titleLabel!.adjustsFontSizeToFitWidth = true
        self.choice2ButtonOutlet.titleLabel!.minimumScaleFactor = 0.7
        
        self.choice2ButtonOutlet.titleLabel!.font = self.choice2ButtonOutlet.titleLabel!.font.withSize(self.choice2ButtonOutlet.titleLabel!.font.pointSize * 0.85)
        
        self.choice2ButtonOutlet.titleLabel!.widthAnchor.constraint(equalToConstant: self.choice2ButtonOutlet.frame.width*CGFloat(0.85)).isActive = true
    }
    
    func setupChoice3Button() {
        self.choice3ButtonOutlet.setTitleWithoutAnimation(title: self.speech!.decisionText[2])
        
        self.choice3ButtonOutlet.titleLabel!.numberOfLines = 0
        self.choice3ButtonOutlet.titleLabel!.adjustsFontSizeToFitWidth = false
        self.choice3ButtonOutlet.titleLabel!.minimumScaleFactor = 0.7
        
        self.choice3ButtonOutlet.titleLabel!.font = self.choice3ButtonOutlet.titleLabel!.font.withSize(self.choice3ButtonOutlet.titleLabel!.font.pointSize * 0.85)
        
        self.choice3ButtonOutlet.titleLabel!.widthAnchor.constraint(equalToConstant: self.choice3ButtonOutlet.frame.width*CGFloat(0.85)).isActive = true
        
        
    }
    
    func setupChoice4Button() {
        self.choice4ButtonOutlet.setTitleWithoutAnimation(title: self.speech!.decisionText[3])
        
        self.choice4ButtonOutlet.titleLabel!.numberOfLines = 0
        self.choice4ButtonOutlet.titleLabel!.adjustsFontSizeToFitWidth = true
        self.choice4ButtonOutlet.titleLabel!.minimumScaleFactor = 0.7
        
        self.choice4ButtonOutlet.titleLabel!.font = self.choice4ButtonOutlet.titleLabel!.font.withSize(self.choice4ButtonOutlet.titleLabel!.font.pointSize * 0.85)
        
        self.choice4ButtonOutlet.titleLabel!.widthAnchor.constraint(equalToConstant: self.choice4ButtonOutlet.frame.width*CGFloat(0.85)).isActive = true
    }
    
    func setupChoice5Button() {
        

        self.choice5ButtonOutlet.setTitleWithoutAnimation(title: self.speech!.decisionText[4])
        
        self.choice5ButtonOutlet.titleLabel!.numberOfLines = 0
        self.choice5ButtonOutlet.titleLabel!.adjustsFontSizeToFitWidth = true
        self.choice5ButtonOutlet.titleLabel!.minimumScaleFactor = 0.7
        
        self.choice5ButtonOutlet.titleLabel!.font = self.choice5ButtonOutlet.titleLabel!.font.withSize(self.choice5ButtonOutlet.titleLabel!.font.pointSize * 0.85)
        
        self.choice5ButtonOutlet.titleLabel!.widthAnchor.constraint(equalToConstant: self.choice5ButtonOutlet.frame.width*CGFloat(0.85)).isActive = true
        
    }
    
    func setupTextLabel() {
        self.textLabel.text = self.speech!.text
    }
    
    func setupPerfilImageView() {
        
    }
    
    func setupNameImageView() {
        
    }
    
    func setupBaloonImageView() {
        
    }
    
    func setupBackgroudImageView() {
        
    }
    
    func updateTextLabel() {
        self.textLabel.text = self.speech!.text
    }
    
    func updatePerfilImageView() {
        
    }
    
    func updateNameImageView() {
        
    }
    
    func updateBaloonImageView() {
        
    }
    
    func updateBackgroudImageView() {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

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
    var posDecisionTextFlag: Bool = false
    var decisions: [ManaType] = []
    var isSet = false
    var endBattleType: Ways?
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
        isSet = true
        self.setupPerfilImageView()
        self.setupNameImageView()
        self.setupTextLabel()
        self.setupBaloonImageView()
        self.setupBackgroudImageView()
        self.setupNameImageView()
        self.setupPerfilImageView()
        
    }
    
    func update() {
        self.setupOrUpdateView()
        
        self.updatePerfilImageView()
        self.updateNameImageView()
        self.updateTextLabel()
        self.updateBaloonImageView()
        self.updateBackgroudImageView()
        self.updateNameImageView()
        self.updatePerfilImageView()
        
        DataSave.shared.gameCampaign.enemys.first!.setDiscussionInUse(chapterIndex: (self.chapterid!))
        DataSave.shared.setActualChapter(chapterIndex: self.chapterid!)
            
    }
    
    func nextSpeech() {
        
        AudioManager.shared.play(soundEffect: .next)
        
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
        
        // AUDIO MODULE - Colocar condição de qual chapter é e tocar o proximo loop
        if self.chapterid! > 1 {
            AudioManager.shared.stopLoop()
        }
        
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
            
            if self.speech!.isEnemySpeech {
                self.choice1ButtonOutlet.isHidden = false
                self.choice2ButtonOutlet.isHidden = true
                self.choice3ButtonOutlet.isHidden = false
                self.choice4ButtonOutlet.isHidden = true
            }
            else {
                self.choice1ButtonOutlet.isHidden = false
                self.choice2ButtonOutlet.isHidden = false
                self.choice3ButtonOutlet.isHidden = false
                self.choice4ButtonOutlet.isHidden = false
            }
            
            self.choice5ButtonOutlet.isHidden = true
            
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
            DataSave.shared.gameCampaign.enemys.first!.discussionInUse.setHumorPoints(humorPoints: 25)
            return
        }
        if manaAux[1] >= manaAux[0] && manaAux[1] >= manaAux[2] && manaAux[1] >= manaAux[3] {
            fillPoolAux.append(contentsOf: [.yellow, .yellow])
            Player.shared.manaManager.fillPool(manas: fillPoolAux)
            DataSave.shared.gameCampaign.enemys.first!.discussionInUse.setHumorPoints(humorPoints: 75)
            return
        }
        if manaAux[2] >= manaAux[0] && manaAux[2] >= manaAux[1] && manaAux[2] >= manaAux[3] {
            fillPoolAux.append(contentsOf: [.green, .green])
            Player.shared.manaManager.fillPool(manas: fillPoolAux)
            DataSave.shared.gameCampaign.enemys.first!.discussionInUse.setHumorPoints(humorPoints: 125)
            return
        }
        if manaAux[3] >= manaAux[0] && manaAux[3] >= manaAux[1] && manaAux[3] >= manaAux[2] {
            fillPoolAux.append(contentsOf: [.red, .red])
            Player.shared.manaManager.fillPool(manas: fillPoolAux)
            DataSave.shared.gameCampaign.enemys.first!.discussionInUse.setHumorPoints(humorPoints: 175)
            return
        }

        //manas.append(contentsOf: self.tempDecisions)
        
    }
    
    @IBAction func baloonButton(_ sender: UIButton) {
        self.posDecisionTextFlag = false
        self.nextSpeech()
    }
    
    @IBAction func choice1Button(_ sender: UIButton) {
        //self.tempDecisions.append(.blue)
        
        if self.posDecisionTextFlag == false {
            
            AudioManager.shared.play(soundEffect: .selected)
            
            if self.chapterid != 0 {
                self.decisions.append(.blue)
                self.speech!.isDecision = false
                self.speech!.text = self.speech!.posDecisionText[0]!
                self.posDecisionTextFlag = true
            }
            else {
                self.posDecisionTextFlag = false
                self.speech!.isDecision = true
                self.nextSpeech()
            }

            self.update()
        }
        else {
            
            self.posDecisionTextFlag = false
            self.speech!.isDecision = true
            self.nextSpeech()
        }
        
    }
    
    @IBAction func choice2Button(_ sender: UIButton) {
        //self.tempDecisions.append(.yellow)
        
        if self.posDecisionTextFlag == false {
            
            AudioManager.shared.play(soundEffect: .selected)
            
            if self.chapterid != 0 {
                self.decisions.append(.yellow)
            }
            
            self.speech!.isDecision = false
            self.speech!.text = self.speech!.posDecisionText[1]!
            self.posDecisionTextFlag = true
            self.update()
        }
        else {
            
            self.posDecisionTextFlag = false
            self.speech!.isDecision = true
            self.nextSpeech()
        }
        
    }
    
    @IBAction func choice3Button(_ sender: UIButton) {
        //self.tempDecisions.append(.green)
        
        if self.posDecisionTextFlag == false {
            
            AudioManager.shared.play(soundEffect: .selected)
            
            if self.chapterid != 0 {
                self.decisions.append(.green)
                self.speech!.isDecision = false
                self.speech!.text = self.speech!.posDecisionText[2]!
                self.posDecisionTextFlag = true
            }
            else {
                self.posDecisionTextFlag = false
                self.speech!.isDecision = true
                self.endChapter()
            }
        
            self.update()
        }
        else {
            
            self.posDecisionTextFlag = false
            self.speech!.isDecision = true
            self.nextSpeech()
        }
        
    }
    
    @IBAction func choice4Button(_ sender: UIButton) {
        //self.tempDecisions.append(.red)
        
        if self.posDecisionTextFlag == false {
            
            AudioManager.shared.play(soundEffect: .selected)
            
            if self.chapterid != 0 {
                self.decisions.append(.red)
            }
            
            self.speech!.isDecision = false
            self.speech!.text = self.speech!.posDecisionText[3]!
            self.posDecisionTextFlag = true
            self.update()
        }
        else {
            
            self.posDecisionTextFlag = false
            self.speech!.isDecision = true
            self.nextSpeech()
        }
    
    }
    
    @IBAction func choice5Button(_ sender: UIButton) {
        
        AudioManager.shared.play(soundEffect: .selected)
        self.nextSpeech()
    }
    
    func setupChoice1Button() {
        self.choice1ButtonOutlet.setTitleWithoutAnimation(title: self.speech!.decisionText[0])
        
        self.choice1ButtonOutlet.titleLabel!.numberOfLines = 0
        self.choice1ButtonOutlet.titleLabel!.adjustsFontSizeToFitWidth = true
        self.choice1ButtonOutlet.titleLabel!.minimumScaleFactor = 0.7
        
        if !isSet{
            self.choice1ButtonOutlet.titleLabel!.font = self.choice1ButtonOutlet.titleLabel!.font.withSize(self.choice1ButtonOutlet.titleLabel!.font.pointSize * 0.85)
        }
        
        self.choice1ButtonOutlet.titleLabel!.widthAnchor.constraint(equalToConstant: self.choice1ButtonOutlet.frame.width*CGFloat(0.85)).isActive = true
        
        self.choice1ButtonOutlet.titleLabel!.textAlignment = .center
        
    }
    
    func setupChoice2Button() {
        self.choice2ButtonOutlet.setTitleWithoutAnimation(title: self.speech!.decisionText[1])
        
        self.choice2ButtonOutlet.titleLabel!.numberOfLines = 0
        self.choice2ButtonOutlet.titleLabel!.adjustsFontSizeToFitWidth = true
        self.choice2ButtonOutlet.titleLabel!.minimumScaleFactor = 0.7
        
        if !isSet{
            self.choice2ButtonOutlet.titleLabel!.font = self.choice2ButtonOutlet.titleLabel!.font.withSize(self.choice2ButtonOutlet.titleLabel!.font.pointSize * 0.85)
        }
        
        self.choice2ButtonOutlet.titleLabel!.widthAnchor.constraint(equalToConstant: self.choice2ButtonOutlet.frame.width*CGFloat(0.85)).isActive = true
        
        self.choice2ButtonOutlet.titleLabel!.textAlignment = .center
    }
    
    func setupChoice3Button() {
        self.choice3ButtonOutlet.setTitleWithoutAnimation(title: self.speech!.decisionText[2])
        
        self.choice3ButtonOutlet.titleLabel!.numberOfLines = 0
        self.choice3ButtonOutlet.titleLabel!.adjustsFontSizeToFitWidth = false
        self.choice3ButtonOutlet.titleLabel!.minimumScaleFactor = 0.7
        
        if !isSet{
            self.choice3ButtonOutlet.titleLabel!.font = self.choice3ButtonOutlet.titleLabel!.font.withSize(self.choice3ButtonOutlet.titleLabel!.font.pointSize * 0.85)
        }
        
        self.choice3ButtonOutlet.titleLabel!.widthAnchor.constraint(equalToConstant: self.choice3ButtonOutlet.frame.width*CGFloat(0.85)).isActive = true
        
        self.choice3ButtonOutlet.titleLabel!.textAlignment = .center
        
    }
    
    func setupChoice4Button() {
        self.choice4ButtonOutlet.setTitleWithoutAnimation(title: self.speech!.decisionText[3])
        
        self.choice4ButtonOutlet.titleLabel!.numberOfLines = 0
        self.choice4ButtonOutlet.titleLabel!.adjustsFontSizeToFitWidth = true
        self.choice4ButtonOutlet.titleLabel!.minimumScaleFactor = 0.7
        
        if !isSet{
            self.choice4ButtonOutlet.titleLabel!.font = self.choice4ButtonOutlet.titleLabel!.font.withSize(self.choice4ButtonOutlet.titleLabel!.font.pointSize * 0.85)
        }
        
        self.choice4ButtonOutlet.titleLabel!.widthAnchor.constraint(equalToConstant: self.choice4ButtonOutlet.frame.width*CGFloat(0.85)).isActive = true
        
        self.choice4ButtonOutlet.titleLabel!.textAlignment = .center
    }
    
    func setupChoice5Button() {
        
        if 4 < self.speech!.decisionText.count {
            self.choice5ButtonOutlet.setTitleWithoutAnimation(title: self.speech!.decisionText[4])
        }
        else {
            self.choice5ButtonOutlet.setTitleWithoutAnimation(title: "")
        }
        
        self.choice5ButtonOutlet.titleLabel!.numberOfLines = 0
        self.choice5ButtonOutlet.titleLabel!.adjustsFontSizeToFitWidth = true
        self.choice5ButtonOutlet.titleLabel!.minimumScaleFactor = 0.7
        
        if !isSet{
            self.choice5ButtonOutlet.titleLabel!.font = self.choice5ButtonOutlet.titleLabel!.font.withSize(self.choice5ButtonOutlet.titleLabel!.font.pointSize * 0.85)
        }
    
        self.choice5ButtonOutlet.titleLabel!.widthAnchor.constraint(equalToConstant: self.choice5ButtonOutlet.frame.width*CGFloat(0.85)).isActive = true
        
        self.choice5ButtonOutlet.titleLabel!.textAlignment = .center
        
    }
    
    func setupTextLabel() {
        if self.speech!.isPosBattle {
            
            switch endBattleType {
                case .sol: self.textLabel.text = self.speech!.posBattle[3]
                case .areia: self.textLabel.text = self.speech!.posBattle[1]
                case .brisa: self.textLabel.text = self.speech!.posBattle[2]
                case .oceano: self.textLabel.text = self.speech!.posBattle[0]
                default: self.textLabel.text = self.speech!.text
            }
            
        }
        else {
            self.textLabel.text = self.speech!.text
        }
        
        self.textLabel.numberOfLines = 0
        self.textLabel.adjustsFontSizeToFitWidth = true
        self.textLabel.minimumScaleFactor = 0.7
        
        self.textLabel.font = self.textLabel.font.withSize(self.textLabel.font.pointSize * 0.85)
        
        self.textLabel.widthAnchor.constraint(equalToConstant: self.baloonButton.frame.width*CGFloat(0.85)).isActive = true
    }
    
    func setupPerfilImageView() {
        if self.speech!.isEnemySpeech {
            self.perfilImageView.isHidden = false
        }
        else {
            self.perfilImageView.isHidden = true
        }
    }
    
    func setupNameImageView() {
        if self.speech!.isEnemySpeech {
            self.nameImageView.isHidden = false
        }
        else {
            self.nameImageView.isHidden = true
        }
    }
    
    func setupBaloonImageView() {
        
    }
    
    func setupBackgroudImageView() {
        
    }
    
    func updateTextLabel() {
        if self.speech!.isPosBattle {
            
            switch endBattleType {
                case .sol: self.textLabel.text = self.speech!.posBattle[3]
                case .areia: self.textLabel.text = self.speech!.posBattle[1]
                case .brisa: self.textLabel.text = self.speech!.posBattle[2]
                case .oceano: self.textLabel.text = self.speech!.posBattle[0]
                default: self.textLabel.text = self.speech!.text
            }
            
        }
        else {
            self.textLabel.text = self.speech!.text
        }
        
    }
    
    func updatePerfilImageView() {
        if self.speech!.isEnemySpeech {
            self.perfilImageView.isHidden = false
        }
        else {
            self.perfilImageView.isHidden = true
        }
    }
    
    func updateNameImageView() {
        if self.speech!.isEnemySpeech {
            self.nameImageView.isHidden = false
        }
        else {
            self.nameImageView.isHidden = true
        }
    }
    
    func updateBaloonImageView() {
        
    }
    
    func updateBackgroudImageView() {
        
    }
    
    func setEndBattleType(way: Ways) {
        self.endBattleType = way
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

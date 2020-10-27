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
            performSegue(withIdentifier: "StoryToBattleSegue", sender: nil)
            return
        }
        
        if self.chapter != nil && pastChapter!.id != 0{
            if pastChapter!.id == self.chapter!.id {
                //ULTIMA BATALHA
                
                performSegue(withIdentifier: "StoryToBattleSegue", sender: nil)
                return
            }
        }
        else if pastChapter!.id != 0{
            //ULTIMA BATALHA
            
            performSegue(withIdentifier: "StoryToBattleSegue", sender: nil)
            return
        }
        
        
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
            self.choice5ButtonOutlet.isHidden = false
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
    
    @IBAction func baloonButton(_ sender: UIButton) {
        self.nextSpeech()
    }
    
    @IBAction func choice1Button(_ sender: UIButton) {
        self.nextSpeech()
    }
    
    @IBAction func choice2Button(_ sender: UIButton) {
        self.nextSpeech()
    }
    
    @IBAction func choice3Button(_ sender: UIButton) {
        self.nextSpeech()
    }
    
    @IBAction func choice4Button(_ sender: UIButton) {
        self.nextSpeech()
    }
    
    @IBAction func choice5Button(_ sender: UIButton) {
        self.nextSpeech()
    }
    
    func setupChoice1Button() {
        self.choice1ButtonOutlet.setTitleWithoutAnimation(title: self.speech!.decisionText[0])
    }
    
    func setupChoice2Button() {
        self.choice2ButtonOutlet.setTitleWithoutAnimation(title: self.speech!.decisionText[1])
    }
    
    func setupChoice3Button() {
        self.choice3ButtonOutlet.setTitleWithoutAnimation(title: self.speech!.decisionText[2])
    }
    
    func setupChoice4Button() {
        self.choice4ButtonOutlet.setTitleWithoutAnimation(title: self.speech!.decisionText[3])
    }
    
    func setupChoice5Button() {
        self.choice5ButtonOutlet.setTitleWithoutAnimation(title: self.speech!.decisionText[4])
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

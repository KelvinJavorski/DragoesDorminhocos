//
//  StoryViewController.swift
//  Dragon Dreamers
//
//  Created by Kevin Ribeiro on 19/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//
enum ViewType{
    case speechAndChoice
    case onlySpeech
}

import UIKit

class StoryViewController: UIViewController {
    
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
    
    
    var chapter: Chapter? = DataSave.shared.gameCampaign.history.consumeChapter()
    var speech: Speech?
    var speechId: Int?
    var viewType: ViewType = ViewType.onlySpeech
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if chapter == nil {
            DataSave.shared.gameCampaign.history.resetAllChapters()
            
            chapter = DataSave.shared.gameCampaign.history.consumeChapter()
        }
        
        speech = chapter!.speechs[0]
        speechId = speech!.id
        
        
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        self.setupPerfilImageView()
        self.setupNameImageView()
        self.setupTextLabel()
        self.setupBaloonImageView()
        self.setupBackgroudImageView()
    
    }
    
    func update() {
        self.nextSpeech()
        
        self.updatePerfilImageView()
        self.updateNameImageView()
        self.updateTextLabel()
        self.updateBaloonImageView()
        self.updateBackgroudImageView()
            
    }
    
    func nextSpeech() {
        let pastSpeech = self.speech
        for auxSpeech in self.chapter!.speechs {
            if auxSpeech.id == (self.speechId! + 1) {
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
    }
    
    func endChapter() {
        
    }
    
    func setupOrUpdateView() {
        if self.speech!.isDecision {
            self.viewType = ViewType.speechAndChoice
            
            self.choice1ButtonOutlet.isHidden = false
            self.choice2ButtonOutlet.isHidden = false
            self.choice3ButtonOutlet.isHidden = false
            self.choice4ButtonOutlet.isHidden = false
            self.choice5ButtonOutlet.isHidden = false
            
            self.setupChoice1Button()
            self.setupChoice2Button()
            self.setupChoice3Button()
            self.setupChoice4Button()
            self.setupChoice5Button()
                
        }
        else {
            self.viewType = ViewType.onlySpeech
            
            self.choice1ButtonOutlet.isHidden = true
            self.choice2ButtonOutlet.isHidden = true
            self.choice3ButtonOutlet.isHidden = true
            self.choice4ButtonOutlet.isHidden = true
            self.choice5ButtonOutlet.isHidden = true
            
        }
    }
    
    @IBAction func choice1Button(_ sender: UIButton) {
        
    }
    
    @IBAction func choice2Button(_ sender: UIButton) {
        
    }
    
    @IBAction func choice3Button(_ sender: UIButton) {
        
    }
    
    @IBAction func choice4Button(_ sender: UIButton) {
        
    }
    
    @IBAction func choice5Button(_ sender: UIButton) {
        
    }
    
    func setupChoice1Button() {
        self.choice1ButtonOutlet.setTitle(self.speech!.decisionText[0], for: .normal)
    }
    
    func setupChoice2Button() {
        self.choice2ButtonOutlet.setTitle(self.speech!.decisionText[1], for: .normal)
    }
    
    func setupChoice3Button() {
        self.choice3ButtonOutlet.setTitle(self.speech!.decisionText[2], for: .normal)
    }
    
    func setupChoice4Button() {
        self.choice4ButtonOutlet.setTitle(self.speech!.decisionText[3], for: .normal)
    }
    
    func setupChoice5Button() {
        self.choice5ButtonOutlet.setTitle(self.speech!.decisionText[4], for: .normal)
    }
    
    func setupPerfilImageView() {
        
    }
    
    func setupNameImageView() {
        
    }
    
    func setupTextLabel() {
        
    }
    
    func setupBaloonImageView() {
        
    }
    
    func setupBackgroudImageView() {
        
    }
    
    func updatePerfilImageView() {
        
    }
    
    func updateNameImageView() {
        
    }
    
    func updateTextLabel() {
        
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

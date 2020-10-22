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
    
    @IBOutlet weak var choice1Button: UIButton!
    
    @IBOutlet weak var choice2Button: UIButton!
    
    @IBOutlet weak var choice3Button: UIButton!
    
    @IBOutlet weak var choice4Button: UIButton!
    
    @IBOutlet weak var choice5Button: UIButton!
    
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
    
    func setupOrUpdateView() {
        if self.speech!.isDecision {
            self.viewType = ViewType.speechAndChoice
            
            
        }
        else {
            self.viewType = ViewType.onlySpeech
            
            
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
        
    }
    
    func setupChoice2Button() {
        
    }
    
    func setupChoice3Button() {
        
    }
    
    func setupChoice4Button() {
        
    }
    
    func setupChoice5Button() {
        
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

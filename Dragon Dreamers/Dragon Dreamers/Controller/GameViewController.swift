//
//  GameViewController.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 04/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
protocol CardDelegate {
    func changeValue(value: Bool)
}

class GameViewController: UIViewController, CardDelegate {
    
    func changeValue(value: Bool) {
        playWasClicked = value
    }
    
    @IBOutlet weak var skView: SKView!
    @IBOutlet weak var talkingView: UIView!
    @IBOutlet weak var speechButton: UIButton!
    @IBOutlet weak var modalBackView: UIView!
    @IBOutlet weak var speechText: UILabel!
    @IBOutlet weak var endMyTurnButton: UIView!
    
    var prevVC: StoryViewController!
    
    var playWasClicked : Bool = false
    
    var scene : GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.prevVC.dismiss(animated: false, completion: nil)
        
        endMyTurnButton.self.layer.cornerRadius = 15
        
        if let scene = SKScene(fileNamed: "GameScene") as? GameScene {
            self.scene = scene
            self.scene.initScene()
            self.scene.scaleMode = .aspectFill
            
            self.scene.modalBackView = modalBackView 
            self.scene.talkingView = talkingView
            self.scene.speechButton = speechButton
            self.scene.speechText = speechText
            self.scene.endMyTurnButton = endMyTurnButton
            self.scene.navigation = self
            skView.presentScene(self.scene)
        }
        setButton()
    }
    
    func setButton(){
        scene.showDialogBox()
        self.speechText.numberOfLines = 0
        self.speechText.adjustsFontSizeToFitWidth = true
        self.speechText.minimumScaleFactor = 0.4
        self.modalBackView.alpha = 0.20
        self.modalBackView.backgroundColor = .black
    }
    
    func endBattle(way: Ways) {
        self.scene.removeFromParent()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard?.instantiateViewController(withIdentifier: "StoryViewController") as! StoryViewController
        vc.setEndBattleType(way: way)
        present(vc, animated: false, completion: nil)
    }
    
    func showCard(card: Card){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard?.instantiateViewController(withIdentifier: "CardViewController") as! CardViewController
        vc.card = card
        vc.delegate = self
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func nextTurnClicked(_ sender: UIButton) {
        if scene.nextTurnAvailable{
            scene.nextTurn()
        }
    }
    
    @IBAction func speechClicked(_ sender: Any) {
        self.scene.isPaused = false
        self.talkingView.isHidden = true
        self.speechButton.isHidden = true
        self.modalBackView.isHidden = true
        self.endMyTurnButton.isHidden = false
    }
    
    func sendToOutcome () {
        if let vc = self.storyboard?.instantiateViewController(identifier: "Outcome") as? OutcomeViewController {
            vc.inputInfo(text: "This is the battle's outcome")
            //self.show(vc, sender: self)
            vc.inputInfo(text: "This is the outcome screen")
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

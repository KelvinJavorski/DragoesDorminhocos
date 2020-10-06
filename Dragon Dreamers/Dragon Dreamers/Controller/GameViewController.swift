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

class GameViewController: UIViewController {

    
    @IBOutlet weak var skView: SKView!
    @IBOutlet weak var talkingView: UIView!
    @IBOutlet weak var speechButton: UIButton!
    @IBOutlet weak var modalBackView: UIView!
    @IBOutlet weak var speechText: UILabel!
    @IBOutlet weak var endMyTurnButton: UIView!
    
    var scene : GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
    
    func setButton(){
        scene.showDialogBox()
        self.speechText.numberOfLines = 0
        self.speechText.adjustsFontSizeToFitWidth = true
        self.speechText.minimumScaleFactor = 0.4
        self.modalBackView.alpha = 0.15
        self.modalBackView.backgroundColor = .black
    }
    
    @IBAction func nextTurnClicked(_ sender: UIButton) {
        scene.nextTurn()
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

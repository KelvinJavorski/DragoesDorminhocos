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
    @IBOutlet weak var talkView: UIView!
    @IBOutlet weak var speechButton: UIButton!
    
    var scene : GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scene = SKScene(fileNamed: "GameScene") as? GameScene {
            self.scene = scene
            self.scene.initScene()
            self.scene.scaleMode = .aspectFill
            
            self.scene.talkView = talkView
            self.scene.speechButton = speechButton
            self.scene.navigation = self
            skView.presentScene(self.scene)
        }
//        self.scene.navigation = self
        
        /*
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
        */
    }
    
    
    @IBAction func nextTurnClicked(_ sender: UIButton) {
        scene.nextTurn()
    }
    
    @IBAction func speechClicked(_ sender: Any) {
        self.scene.isPaused = false
        self.talkView.isHidden = true
        self.speechButton.isHidden = true
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

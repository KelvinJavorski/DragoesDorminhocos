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
    
    var scene : GameScene!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scene = SKScene(fileNamed: "GameScene") as? GameScene {
            self.scene = scene
            self.scene.initScene()
            self.scene.scaleMode = .aspectFill
            
            skView.presentScene(self.scene)
        }
        
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
    
    
    @IBAction func deckButton(_ sender: UIButton) {
        print("clicked deck")
        if Player.shared.hand.cards.count > 0 {
            scene.discardHand()
        }
        scene.drawCards()
    }
   
    
    
    
    
    
    @IBAction func discardAllCards(_ sender: UIButton) {
        print("Discarting all ongoing")
        if Player.shared.ongoing.cards.count > 0 {
            scene.discardOngoing()
        }
    }
    
    @IBAction func getCardsFromDiscard(_ sender: UIButton) {
        print("getting cards from discart pile")
        
        scene.getCardsFromDiscard()
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

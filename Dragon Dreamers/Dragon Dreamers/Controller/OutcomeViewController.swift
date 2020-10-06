//
//  OutcomeViewController.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 16/09/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class OutcomeViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var nextView: UIView!
    
    @IBOutlet weak var textContent: UIView!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var imageContent: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageText: UILabel!
    
    @IBOutlet weak var combatTitle: UILabel!
    
    var text : String = "placeholder"
    
    func refreshInterface () {
        textLabel.text = text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.layer.cornerRadius = 30
        nextView.layer.cornerRadius = 15
    }
    
    func inputInfo (text: String) {
        self.text = text
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

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
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var combatTitle: UILabel!
    
    var image : UIImage?
    var text  : String   = "placeholder"
    
    func refreshInterface () {
        placeInfo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.layer.cornerRadius = 30
        nextView.layer.cornerRadius = 15
        
        refreshInterface()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        refreshInterface()
    }
    
    func inputInfo (text: String, image: UIImage? = nil) {
        self.text  = text
        self.image = image
    }
    
    func placeInfo () {
        if image != nil {
            let imageView = UIImageView(image: image)
            stackView.addSubview(imageView)
        }
        let label = UILabel()
        label.text = self.text
        stackView.addSubview(label)
        
        stackView.distribution = .fillEqually
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

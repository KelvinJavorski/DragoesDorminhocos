//
//  MenuViewController.swift
//  Dragon Dreamers
//
//  Created by Kevin Ribeiro on 10/09/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    
    
    
    var daysAvailable : [String]!
    
    func refreshInterface () {
        
        
        
        print("Refreshed Interface")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("View Did Load")
        refreshInterface()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshInterface()
    }
    
    @IBAction func StartGame(_ sender: UIButton) {
        // START NEW GAME
        
        print("Start Game")
    }

}

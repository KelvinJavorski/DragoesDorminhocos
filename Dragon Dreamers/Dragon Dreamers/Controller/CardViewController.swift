//
//  CardViewController.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 05/11/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    var card: Card!
    @IBOutlet weak var cardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCardImage()
        // Do any additional setup after loading the view.
    }
    

    func setCardImage(){
        
    }

    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

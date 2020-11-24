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
    var scene: GameScene!
    var delegate: CardDelegate!
    
    @IBOutlet weak var cardImage: UIImageView!
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var effectDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCardImage()
        effectDescription.text = card.effectDescription
        // Do any additional setup after loading the view.
    }
    

    func setCardImage(){
        switch card.type {
        case .blue:
            cardImage.image = UIImage(named: "carta_base_oceano")
            return
        case .green:
            cardImage.image = UIImage(named: "card_base_brisa")
            return
        case .red:
            cardImage.image = UIImage(named: "card_base_sol")
            return
        case .yellow:
            cardImage.image = UIImage(named: "card_base_areia")
            return
        default:
            return
        }
    }

    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func playButton(_ sender: Any) {
        if let delegate = self.delegate{
            delegate.changeValue(value: true)
        }
        self.dismiss(animated: true) {}
    }
}

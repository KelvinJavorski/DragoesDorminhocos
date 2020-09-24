//
//  DynamicCollectionView.swift
//  Dragon Dreamers
//
//  Created by Kaz Born on 22/09/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import UIKit

class DayCollectionViewCell : UICollectionViewCell {
    
    var day : String = "Day 0"
    var index : Int = 0
    var delegate : DayCollectionViewCellDelegate!
    
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBAction func clickedDay (_ sender: UIButton) {
        if delegate != nil {
            self.delegate?.hasClickedOnDay(self, cellTappedFor: self.index)
        }
    }
    
    func configureCell (_ index: Int) {
        self.index = index
        
        // Pegar o dia correto
        
        // Colocar o dia certo na label
        
        let number = index + 1
        
        self.day = "Day \(number)"
        dayLabel.text = self.day
        
    }
}

protocol DayCollectionViewCellDelegate {
    func hasClickedOnDay (_ dayCollectionViewCell: DayCollectionViewCell, cellTappedFor index: Int)
}

class NewGameCollectionViewCell : UICollectionViewCell {
    
    var delegate : NewGameCollectionViewCellDelegate!
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func clickedDay (_ sender: UIButton) {
        if delegate != nil {
            self.delegate?.hasClicked(self)
        }
    }
    
    func configureCell () {
        
        label.text = "New Game"
    }
}

protocol NewGameCollectionViewCellDelegate {
    func hasClicked (_ newGameCollectionViewCell: NewGameCollectionViewCell)
}

class DynamicMenuCollectionViewFlowLayout: UICollectionViewFlowLayout {
    var tempCellAttributesArray = [UICollectionViewLayoutAttributes]()
    let leftEdgeInset: CGFloat = 10
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
            
        let availableHeight = collectionView.bounds.inset(by: collectionView.layoutMargins).height
        let availableWidth  = collectionView.bounds.inset(by: collectionView.layoutMargins).width
        
        let aspectRatio = CGFloat(1 / 1)
        
        let cellHeight = (availableHeight).rounded(.down)
        let cellWidth = cellHeight * aspectRatio
        
        self.itemSize = CGSize(width: cellHeight, height: cellWidth)
            
        self.scrollDirection = .horizontal
            
        let leftInset = availableWidth * 0.7
        
        self.sectionInset = UIEdgeInsets(top: 10.0, left: leftInset, bottom: 10.0, right: 10.0)
        self.sectionInsetReference = .fromSafeArea
    }
}


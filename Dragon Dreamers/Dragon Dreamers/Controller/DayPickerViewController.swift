//
//  DayPickerViewController.swift
//  Dragon Dreamers
//
//  Created by Kaz Born on 23/09/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import UIKit

class DayPickerViewController : UIViewController, UICollectionViewDataSource {
    
    var daysAvailable : [String]!
    
    @IBOutlet weak var daysCollectionView: UICollectionView!
    
    func refreshInterface () {
        
        daysAvailable = ["Day 0", "Day 1", "Day 2", "Day 3"]
        
        daysCollectionView.reloadData()
        
        print("Refreshed Interface")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        daysCollectionView.dataSource = self
        
        print("View Did Load")
        refreshInterface()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshInterface()
    }
    
    func startGameFor (_ day: Int) {
        // Start Game on day
        
        print("Start Game for")
        
        // INPUT GAME START
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if daysAvailable.count == 0 {
            return 1
        }
        return daysAvailable.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if daysAvailable.count > 0 {
            // Make cell with day
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DayCell", for: indexPath) as! DayCollectionViewCell
            
            cell.configureCell(indexPath.row)
            
            print("Configured Day Cell")
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewGameCell", for: indexPath) as! NewGameCollectionViewCell
            
            cell.configureCell()
            
            print("Configured New Game Cell")
            
            return cell
        }
    }
    
    
    
    
    
}

extension DayPickerViewController : DayCollectionViewCellDelegate {
    func hasClickedOnDay(_ dayCollectionViewCell: DayCollectionViewCell, cellTappedFor index: Int) {
        self.startGameFor(index)
    }
}

extension DayPickerViewController : NewGameCollectionViewCellDelegate {
    func hasClicked(_ newGameCollectionViewCell: NewGameCollectionViewCell) {
        self.startGameFor(0)
    }
}

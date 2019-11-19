//
//  HomeCell.swift
//  KeyboardStoryboadApp
//
//  Created by mac pro on 8/22/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    

    @IBOutlet weak var homeCellcon: UIImageView!
    @IBOutlet weak var homeCellTitle: UILabel!
    
    var homeCellItem: HomeGridModel!
    
    func setUpHomeCell(homeCell: HomeGridModel){
        
        homeCellItem = homeCell
        
        
        homeCellcon.image = homeCellItem.cellImage
        homeCellTitle.text = homeCellItem.title
        
    
    }
    
    
    
}

//
//  ZIPITCollectionCell.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/7/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import UIKit

class TilesCollectionCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        ZIPITCellSetup()
        
        
        contentView.addSubview(purpleView)

        purpleView.backgroundColor = Theme.PrimaryPurple
        purpleView.layer.cornerRadius = 5
        
        title.textColor = UIColor.white
        title.numberOfLines = 0
        title.textAlignment = .center
        
        purpleView.addSubview(title)
        
        title.centerYAnchor.constraint(equalTo: purpleView.centerYAnchor).isActive = true
        title.centerXAnchor.constraint(equalTo: purpleView.centerXAnchor).isActive = true
        title.leftAnchor.constraint(equalTo: purpleView.leftAnchor, constant: 3).isActive = true
        title.rightAnchor.constraint(equalTo: purpleView.rightAnchor, constant: -3).isActive = true
        
        
        purpleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        purpleView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        purpleView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5).isActive = true
        purpleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5      ).isActive = true
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    var title = Controls().theLabel(title: "", fontSize: 18)
    var purpleView = Controls().theView()
    
    
    
    func ZIPITCellSetup(){
        
       
        
    }
    
}

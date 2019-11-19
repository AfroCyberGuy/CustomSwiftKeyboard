//
//  ZIPITCollectionCell.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/7/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import UIKit

class ZIPITCollectionCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        ZIPITCellSetup()
        
        
        contentView.addSubview(img)

        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.layer.cornerRadius = 3
        
        
        img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        img.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        img.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5).isActive = true
        img.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    var img = Controls().theImageView(imageName: "zuva")
    
    
    func ZIPITCellSetup(){
        
       
    }
    
}

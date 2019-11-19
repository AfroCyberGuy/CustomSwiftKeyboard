//
//  RTGSCollectionCell.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/8/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit

class RTGSCollectionCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        RTGSCellSetup()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    let img = Controls().theImageView(imageName: "zuva")
    
    
    func RTGSCellSetup(){
        
        contentView.addSubview(img)
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.layer.cornerRadius = 3
        
        
        img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        img.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        img.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5).isActive = true
        img.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        
    }
    
    
    
}

//
//  BillPaymentsCollectionCell.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/2/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import UIKit


class BillPaymentsCollectionCell: UICollectionViewCell {
    var billCellItem: BillersListModel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        commonInit()
//        testCellSetup(biller: billCellItem)
        
       
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
//        testCellSetup()
        
//         testCellSetup(biller: billCellItem)
    }

    
    
//    func setupViews(billCellobj: BillersListModel){
//
//        billCellItem = billCellobj
//
//       billerCellImage.image = UIImage(named: billCellItem.billImage!)
//
//
//        self.contentView.addSubview(billerCellImage)
//        billerCellImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
//        billerCellImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
//        billerCellImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
//        billerCellImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
//
//    }
//
    func testCellSetup(biller: BillersListModel){
        
        self.billCellItem = biller
        
        theLbl.textColor = UIColor.white
    
        img.image = UIImage(named: biller.billImage!)
        contentView.addSubview(img)
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.layer.cornerRadius = 3


        img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        img.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        img.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5).isActive = true
        img.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        
    }
    
    
     let theLbl =  Controls().theLabel(title: "Test", fontSize: 16)
     let img = Controls().theImageView(imageName: "zuva")
 
}

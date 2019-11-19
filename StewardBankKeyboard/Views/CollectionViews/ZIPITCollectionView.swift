//
//  ZIPITCollectionView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/7/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit


protocol ZIPITCellDelegate {
    
    func didTapBank(bankName: String)
    
}


class ZIPITCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
    let cellId = "zipitCell"
    
    var delegate: ZIPITCellDelegate?
    
    var bankArrayList = [BankListModel]()
    
    lazy var collectionView:   UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 50)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        //If you set it false, you have to add constraints.
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(ZIPITCollectionCell.self, forCellWithReuseIdentifier: cellId)
        cv.backgroundColor = Theme.WhitePrimary
        
        return cv
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
       
    }
    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    required init?(banksArray: [BankListModel]) {
        self.init()
        self.bankArrayList = banksArray
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print("COLLECTION VIEW BANKS ARRAY COUNT\(KeyboardViewController().createBankArray().count)")
        
//        return KeyboardViewController().createBankArray().count
        
        return bankArrayList.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ZIPITCollectionCell
        
//        let rowData = KeyboardViewController().createBankArray()[indexPath.row]
        
        let rowData = bankArrayList[indexPath.row]
        
        cell.backgroundColor = Theme.WhitePrimary
        print("ROW DATA \(rowData)")                                                               
        cell.img.image = UIImage(named:  BankValidater().bankImageDisplay(bankName: rowData.bankName!))
        
        
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let rowData = KeyboardViewController().createBankArray()[indexPath.row]
        
      
        delegate?.didTapBank(bankName: rowData.bankName!)
        
        print(rowData.bankName!)
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.collectionView.frame.width / 4, height: 50)
    }
    
    
}


//
//  BillCollectionView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/3/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit

protocol BillCellDelegate {
    
    func didTapBiller(billerName: String, billerCode: String)
    
}

class BillCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "billPaymentsCell"
    
    var delegate: BillCellDelegate?
    
    
    lazy var collectionView : UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 100, height: 50)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //If you set it false, you have to add constraints.
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(BillPaymentsCollectionCell.self, forCellWithReuseIdentifier: cellId)
        cv.backgroundColor = .white
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .red
        
        addSubview(collectionView)
        
        //Add constraint
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print("COLLECTION VIEW ARRAY COUNT\(KeyboardViewController().createArray().count)")
        
        return KeyboardViewController().createArray().count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BillPaymentsCollectionCell
       
        let rowData = KeyboardViewController().createArray()[indexPath.row]
         print("ROW DATA \(rowData)")
        cell.backgroundColor = Theme.WhitePrimary
        cell.img.image = UIImage(named: rowData.billImage!)
        
        
//      cell.theLbl.text = "Testing layouts"
        
//        cell.setupViews(billCellobj: rowData)
//        collectionView.reloadData()
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let rowData = KeyboardViewController().createArray()[indexPath.row]
        
        delegate?.didTapBiller(billerName: rowData.billerName!, billerCode: rowData.billerCode!)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.size.width/4, height: 50)
    }   
}

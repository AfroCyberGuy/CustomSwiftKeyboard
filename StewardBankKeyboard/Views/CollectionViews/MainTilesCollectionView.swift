//
//  MainTilesCollectionView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/15/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit


protocol MainTileCellDelegate {
    
    func didTaptile(tileName: String)
    
}


class MainTilesCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    let cellId = "tileCell"
    
    var delegate: MainTileCellDelegate?
    
    var tileArray = [KeyboardTileModel]()
    
    lazy var collectionView: UICollectionView = {
        let numberOfColumns: CGFloat = 3
        let itemSizeWidth = self.frame.width/3
        let itemSizeHeight = self.frame.height/2
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
//        layout.sectionInset = UIEdgeInsetsMake(1, 0, 1, 0)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.itemSize = CGSize(width: itemSizeWidth, height: itemSizeHeight)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        //If you set it false, you have to add constraints.
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(TilesCollectionCell.self, forCellWithReuseIdentifier: cellId)
        cv.backgroundColor = Theme.LighterGray
        
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
    
    
    required init?(tilesArray: [KeyboardTileModel]) {
        self.init()
        self.tileArray = tilesArray
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       
        
        return tileArray.count
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TilesCollectionCell
        
        
        let rowData = tileArray[indexPath.row]
    
        
        cell.backgroundColor = UIColor.clear
        cell.title.text = rowData.tileTitle!
        
        return cell
    }
    
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let rowData = tileArray[indexPath.row]
        
        
        delegate?.didTaptile(tileName: rowData.tileTitle!)
        
        print(rowData.tileTitle!)
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 120, height: self.collectionView.frame.height / 2)
    }
    
}

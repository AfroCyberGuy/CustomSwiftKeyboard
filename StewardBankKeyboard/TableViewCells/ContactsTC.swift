//
//  ContactsTC.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 11/27/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import UIKit

class ContactsTC: UITableViewCell {
    
   
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let contactNameLabel = Controls().theLabel(title: "", fontSize: 22)
    let contactPhoneLabel = Controls().theLabel(title: "", fontSize: 18)
    
    func setupViews(){
        
        addSubview(contactNameLabel)
        addSubview(contactPhoneLabel)
        
        contactNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        contactNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        contactNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 8).isActive = true
        
        contactPhoneLabel.topAnchor.constraint(equalTo: contactNameLabel.bottomAnchor, constant: 10).isActive = true
        contactPhoneLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        contactPhoneLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 8).isActive = true
    }

}

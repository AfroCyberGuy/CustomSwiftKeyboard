//
//  ContactsTableViews.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 11/27/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit


protocol ContactCellDelegate{
    
    func didTapContact(contactPhonenumber: String)
}

class ContactsTableView: UIView, UITableViewDataSource, UITableViewDelegate {
   
    
    var delegate: ContactCellDelegate?
    
    let cellId = "contactsCell"
    
    var contactArrayList = [Contacts]()
    
    lazy var contactTableView: UITableView = {
       
        let tv = UITableView()
        
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.separatorInset = .zero
        tv.backgroundColor = UIColor.white
        tv.register(ContactsTC.self, forCellReuseIdentifier: cellId)

        return tv
    }()
    
    override init(frame: CGRect) {
       super.init(frame: frame)
        
        addSubview(contactTableView)
        
        contactTableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        contactTableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        contactTableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        contactTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init?(contactsArray: [Contacts]) {
        self.init()
        
        self.contactArrayList  = contactsArray
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
     return 80
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return contactArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rowData = contactArrayList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ContactsTC
        
        cell.selectionStyle = .none
        
        
        cell.contactNameLabel.text = rowData.name
        cell.contactPhoneLabel.text = rowData.phoneNumber
        

        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let rowData = contactArrayList[indexPath.row]
        
        delegate?.didTapContact(contactPhonenumber: rowData.phoneNumber.components(separatedBy: .whitespacesAndNewlines).joined())
        
        
    }
    
}


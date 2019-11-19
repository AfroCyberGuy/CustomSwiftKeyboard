//
//  ContactsView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 11/27/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit
import Contacts

extension KeyboardViewController{
    
    
    func makeContactsMainView(){
        
        
        view.addSubview(contactsView)
        contactsView.layer.cornerRadius = 0
        contactsView.backgroundColor = Theme.WhitePrimary
        contactsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        contactsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        contactsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        contactsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        makeContactsTopView()
        makeTableViewContainerView()
        
        let contactsArray = createContactsArray()
        print("CONTACTS COUNT: \(contactsArray.count)")
        let tableView: ContactsTableView = {
            
            let tv = ContactsTableView(contactsArray: contactsArray)
            
            tv?.translatesAutoresizingMaskIntoConstraints = false
            tv?.delegate = self
            
            return tv!
        }()
        
        contactsTableViewContainerView.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: contactsTableViewContainerView.topAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: contactsTableViewContainerView.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: contactsTableViewContainerView.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: contactsTableViewContainerView.bottomAnchor, constant: 0).isActive = true
    }
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE CONTACTS TOP VIEW
    //----------------------------------------------------------------
    
    func makeContactsTopView(){
        
        contactsTopContainer.backgroundColor = Theme.LighterGray
        contactsView.addSubview(contactsTopContainer)
        contactsTopContainer.topAnchor.constraint(equalTo: contactsView.topAnchor, constant: 3.0).isActive = true
        contactsTopContainer.leftAnchor.constraint(equalTo: contactsView.leftAnchor, constant: 0).isActive = true
        contactsTopContainer.rightAnchor.constraint(equalTo: contactsView.rightAnchor, constant: 0).isActive = true
        contactsTopContainer.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        makeContactsMainViewBackButton()
        makeContactsMainViewRightButton()
        makeContactsTopContainerTextField()
//        makeRTGSBankNameLabel()
//        makeRTGSBankListView()
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- CONTACTS VIEW BACK BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeContactsMainViewBackButton(){
        
        contactsLeftBtn.layer.cornerRadius = 15
        contactsTopContainer.addSubview(contactsLeftBtn)
        //        billpaymentsMainViewBackBtnPressed()
        
        
        contactsLeftBtn.addTarget(self, action: #selector(contactsLeftBtnPressed), for: .touchUpInside)
        
        contactsLeftBtn.topAnchor.constraint(equalTo: contactsTopContainer.topAnchor, constant: 10).isActive = true
        contactsLeftBtn.leftAnchor.constraint(equalTo: contactsTopContainer.leftAnchor, constant: 8).isActive = true
        contactsLeftBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        contactsLeftBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CONTACTS MAIN BACK BTN CLIICKED
    //----------------------------------------------------------------
    @objc func contactsLeftBtnPressed(){
        
        contactsView.removeFromSuperview()
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE CONTACTS RIGHT BUTTON VIEW
    //----------------------------------------------------------------
    
    func makeContactsMainViewRightButton(){

        contactsRightBtn.layer.cornerRadius = 15
        contactsTopContainer.addSubview(contactsRightBtn)
        //        billpaymentsViewRightButtonPressed()

        RTGSMainViewRightBtn.addTarget(self, action: #selector(contactsRightBtnPressed), for: .touchUpInside)

        contactsRightBtn.topAnchor.constraint(equalTo: contactsTopContainer.topAnchor, constant: 10).isActive = true
        contactsRightBtn.rightAnchor.constraint(equalTo: contactsTopContainer.rightAnchor, constant: -8).isActive = true
        contactsRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        contactsRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CONTACTS MAIN RIGHT BTN CLIICKED
    //----------------------------------------------------------------
    @objc func contactsRightBtnPressed(){
        
//        makeRTGSAmountView()
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE CONTACTS TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeContactsTopContainerTextField(){
        
        contactsTopContainer.addSubview(contactTextField)
        contactTextField.textAlignment = .center
        contactTextField.backgroundColor = UIColor.white
        contactTextField.layer.cornerRadius = 5
        contactTextField.layer.masksToBounds = true
        contactTextField.textColor = UIColor.gray
        
        contactTextField.centerYAnchor.constraint(equalTo: contactsRightBtn.centerYAnchor).isActive = true
        contactTextField.leftAnchor.constraint(equalTo: contactsLeftBtn.rightAnchor, constant: 30).isActive = true
        contactTextField.rightAnchor.constraint(equalTo: contactsRightBtn.leftAnchor, constant: -30).isActive = true
        contactTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE TABLE VIEW CONTAINER VIEW
    //----------------------------------------------------------------
    
    
    func makeTableViewContainerView(){
        
        contactsView.addSubview(contactsTableViewContainerView)
        contactsTableViewContainerView.layer.cornerRadius = 0
        contactsTableViewContainerView.backgroundColor = Theme.LighterGray
        
        contactsTableViewContainerView.topAnchor.constraint(equalTo: contactsTopContainer.bottomAnchor, constant: 0).isActive = true
        contactsTableViewContainerView.leftAnchor.constraint(equalTo: contactsView.leftAnchor, constant: 0).isActive = true
        contactsTableViewContainerView.rightAnchor.constraint(equalTo: contactsView.rightAnchor, constant: 0).isActive = true
        contactsTableViewContainerView.bottomAnchor.constraint(equalTo: contactsView.bottomAnchor, constant: 0).isActive = true
        
    }
    
    
    
    //----------------------------------------------------------------
    
   
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CREATE CONTACTS METHOD
    //----------------------------------------------------------------
    
    func createContactsArray() -> [Contacts] {
        
        
        var contacts = [Contacts]()
        let store = CNContactStore()
        
        
        store.requestAccess(for: .contacts) { (granted, err) in
            
            
            if granted {
                
                
                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
                
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                
                do{
                    
                    try store.enumerateContacts(with: request, usingBlock: { (contact, stopPointerIYouWantToStopEnumerating) in
                        
                        
                        print(contact.givenName)
                        print(contact.familyName)
                        print(contact.phoneNumbers.first?.value.stringValue ?? "")
                        
                        let contactPhone = contact.phoneNumbers.first?.value.stringValue ?? ""
                        
                        contacts.append(Contacts(name: "\(contact.givenName) \(contact.familyName)", phoneNumber: contactPhone))
                    })
                    
                    print("CONTACTS OBJECT: \(contacts)")
                    
                }catch let err {
                    
                    print("CONTACTS OBJECT: \(err)")
                }
            }else {
                
                
                print("Access Denied.....")
            }
        }
        
        
        return contacts
    }
    
    
    //----------------------------------------------------------------
    
    
}

//
//  AirtimeView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 8/29/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import UIKit
import Contacts

extension KeyboardViewController {
    
    
   
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME MAIN VIEW
    //----------------------------------------------------------------
    
    
    func makeAirTimeMainView(){
        
        
        airtimeView.backgroundColor = Theme.LighterGray
        airtimeView.layer.cornerRadius = 0
        view.addSubview(airtimeView)
        setAirtimeViewConstraints()
        makeAirTimeAccessoryView()
        makeAirTimeBackButton()
        makeAirTimeNumberField()
        makeAirTimeNumberKeyboardBtn()
        makeAirTimeRightButton()
        makeAirTimePayeeLabel()
        makeAirtimeViewOptions()
        makeOptionsViewStackView()
        makeAirtimeKeyboardView()
        
        if isPickedFromContact {
            
            airtimeNumberTextField.text = pickedContactPhonenumber
            airtimePayeeLabel.text = pickedContactNetworkProvider
            isPickedFromContact = false
            
        }
    
        
    }
    
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME ACCESSORY VIEW
    //----------------------------------------------------------------
    
    func makeAirTimeAccessoryView(){
        
        airtimeAccessoryView.backgroundColor = Theme.DarkerGray
        airtimeView.layer.cornerRadius = 0
        airtimeView.addSubview(airtimeAccessoryView)
        setAirtimeAccessoryViewConstraints()
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME BACK BUTTON VIEW
    //----------------------------------------------------------------
    
    func makeAirTimeBackButton(){
        
        airtimeBackBtn.layer.cornerRadius = 15
        airtimeAccessoryView.addSubview(airtimeBackBtn)
        setAirtimeBackButtonConstraints()
        airtimeBackButtonPressed()
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME NUMBER TEXTFIELD VIEW
    //----------------------------------------------------------------
    
    func makeAirTimeNumberField(){
        
        
        airtimeNumberTextField.layer.borderColor = Theme.PurpleTheme?.cgColor
        airtimeNumberTextField.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        airtimeNumberTextField.layer.cornerRadius = 1
        airtimeNumberTextField.text = "Type the reciepient number"
        airtimeNumberTextField.backgroundColor = Theme.WhitePrimary
        airtimeNumberTextField.layer.borderWidth = 1
        airtimeNumberTextField.textAlignment = .center
        airtimeAccessoryView.addSubview(airtimeNumberTextField)
        setAirtimeNumberTextFieldConstraints()
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME KEYBOARD BUTTON VIEW
    //----------------------------------------------------------------
    
    func makeAirTimeNumberKeyboardBtn(){
        
        airtimeChangeKeyboardBtn.backgroundColor = UIColor.clear
        airtimeAccessoryView.addSubview(airtimeChangeKeyboardBtn)
        setAirtimeKeyboardButtonConstraints()
        
        airtimeChangeKeyboardBtn.addTarget(self, action: #selector(showPhonebookContacts), for: .touchUpInside)
        
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SHOW PHONE BOOK CONTACTS
    //----------------------------------------------------------------
    
    @objc func showPhonebookContacts(){
        
        makeContactsMainView()
        airtimeView.removeFromSuperview()
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME RIGHT BUTTON VIEW
    //----------------------------------------------------------------
    
    func makeAirTimeRightButton(){
        
        airtimeRightBtn.layer.cornerRadius = 15
        airtimeAccessoryView.addSubview(airtimeRightBtn)
        setAirtimeRightButtonConstraints()
        airtimeViewRightButtonPressed()
    }
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME PAYEE LABEL VIEW
    //----------------------------------------------------------------
    
    func makeAirTimePayeeLabel(){
        
        airtimePayeeLabel.textColor = Theme.PurpleTheme
        airtimePayeeLabel.textAlignment = .center
        airtimePayeeLabel.text = ""
        airtimeView.addSubview(airtimePayeeLabel)
        setAirtimePayeeLabelConstraints()
    }
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AAIRTIME OPTIONS VIEW
    //----------------------------------------------------------------
    
    func makeAirtimeViewOptions() {
        
        airtimeViewOptionsView.layer.cornerRadius = 0
        airtimeViewOptionsView.backgroundColor = Theme.LighterGray
        airtimeView.addSubview(airtimeViewOptionsView)
        setupAirtimeOptionsViewConstraints()
    }

    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE OPTIONS STACKVIEW
    //----------------------------------------------------------------
    
    func makeOptionsViewStackView(){
        
        let hStackView = Controls().theHorizontalStackView(buttons: [airtimeEconetButton, airtimeNetoneButton, airtimeTelecelButton])
//        airtimeNetoneButton.backgroundColor = UIColor.white
        hStackView.axis = .horizontal
        hStackView.spacing = 5
        airtimeViewOptionsView.backgroundColor = Theme.WhitePrimary
        airtimeViewOptionsView.addSubview(hStackView)
        
        airtimeEconetButton.contentMode = .scaleAspectFit
        airtimeEconetButton.clipsToBounds = true
        airtimeNetoneButton.contentMode = .scaleAspectFit
        airtimeNetoneButton.clipsToBounds = true
        airtimeTelecelButton.contentMode = .scaleAspectFit
        airtimeTelecelButton.clipsToBounds = true
        
        
        
        hStackView.leftAnchor.constraint(equalTo: airtimeViewOptionsView.leftAnchor).isActive = true
        hStackView.rightAnchor.constraint(equalTo: airtimeViewOptionsView.rightAnchor).isActive = true
        hStackView.topAnchor.constraint(equalTo: airtimeViewOptionsView.topAnchor).isActive = true
        hStackView.bottomAnchor.constraint(equalTo: airtimeViewOptionsView.bottomAnchor).isActive = true
        
        
        airtimeEconetNetworkClicked()
        airtimeTelecelNetworkClicked()
        airtimeNetoneNetworkClicked()
        
    }
    
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME NETWORK OPTION CLICK EVENTS
    //----------------------------------------------------------------
    
    func airtimeEconetNetworkClicked(){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.airtimEconetNetworkPressed(_:)))
        airtimeEconetButton.isUserInteractionEnabled = true
        airtimeEconetButton.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func airtimEconetNetworkPressed(_ sender: AnyObject){
      
//        makeZIPITPaymentsZimSwitchPanView()
        
        airtimePayeeLabel.text = "Econet"
        
        KeyboardSharedPreferences().setAirtimeNetworkProvider(network: "ECONET")
    }
    
    
    func airtimeTelecelNetworkClicked(){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.airtimeTelecelNetworkPressed(_:)))
        airtimeTelecelButton.isUserInteractionEnabled = true
        airtimeTelecelButton.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    
    @objc func airtimeTelecelNetworkPressed(_ sender: AnyObject){
        
        airtimePayeeLabel.text = "Telecel"
        KeyboardSharedPreferences().setAirtimeNetworkProvider(network: "TELECEL")
    }
    
    
    func airtimeNetoneNetworkClicked(){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.airtimeNetoneNetworkPressed(_:)))
        airtimeNetoneButton.isUserInteractionEnabled = true
        airtimeNetoneButton.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func airtimeNetoneNetworkPressed(_ sender: AnyObject){
        
       airtimePayeeLabel.text = "Netone"
        KeyboardSharedPreferences().setAirtimeNetworkProvider(network: "NETONE")
    }
    
    //----------------------------------------------------------------
    
    
    
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE OPTIONS STACKVIEW
    //----------------------------------------------------------------
    
    func makeAirtimeRowOneStackView() -> UIStackView {
        
        airtimeOneButton.layer.cornerRadius = 3
        airtimeOneButton.backgroundColor = UIColor.white
        airtimeOneButton.setTitleColor(UIColor.black, for: .normal)
        airtimeTwoButton.layer.cornerRadius = 3
        airtimeTwoButton.backgroundColor = UIColor.white
        airtimeTwoButton.setTitleColor(UIColor.black, for: .normal)
        airtimeThreeButton.layer.cornerRadius = 3
        airtimeThreeButton.backgroundColor = UIColor.white
        airtimeThreeButton.setTitleColor(UIColor.black, for: .normal)
        
        
        airtimeOneButton.addTarget(self, action: #selector(airtimeOneButtonPressed), for: .touchUpInside)
        airtimeTwoButton.addTarget(self, action: #selector(airtimeTwoButtonPressed), for: .touchUpInside)
        airtimeThreeButton.addTarget(self, action: #selector(airtimeThreeButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [airtimeOneButton, airtimeTwoButton, airtimeThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 5
      
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ROW ONE BUTTON PRESSED ACTIONS
    //----------------------------------------------------------------
    
    @objc func airtimeOneButtonPressed(){
    
        
        if handleAirtimePlaceholder(text: airtimeNumberTextField.text!) {
            
            airtimeNumberTextField.text = ""
             numpadBtnPressed(button: airtimeOneButton, label: airtimeNumberTextField)
            
            
        }else {
            
             numpadBtnPressed(button: airtimeOneButton, label: airtimeNumberTextField)
        }
        
   
    
    }
    
    @objc func airtimeTwoButtonPressed(){
       
        if handleAirtimePlaceholder(text: airtimeNumberTextField.text!) {
            
            airtimeNumberTextField.text = ""
            numpadBtnPressed(button: airtimeTwoButton, label: airtimeNumberTextField)
            
        }else {
         
             numpadBtnPressed(button: airtimeTwoButton, label: airtimeNumberTextField)
        }
        
       
        
        
    }
    
    @objc func airtimeThreeButtonPressed(){
        
        
        if handleAirtimePlaceholder(text: airtimeNumberTextField.text!){
            
            airtimeNumberTextField.text = ""
            numpadBtnPressed(button: airtimeThreeButton, label: airtimeNumberTextField)
            
        }else {
            
            numpadBtnPressed(button: airtimeThreeButton, label: airtimeNumberTextField)
            
        }

    }
    
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME ROW TWO STACKVIEW
    //----------------------------------------------------------------
    
    func makeAirtimeRowTwoStackView() -> UIStackView {
        
        airtimeFourButton.layer.cornerRadius = 3
        airtimeFourButton.backgroundColor = UIColor.white
        airtimeFourButton.setTitleColor(UIColor.black, for: .normal)
        airtimeFiveButton.layer.cornerRadius = 3
        airtimeFiveButton.backgroundColor = UIColor.white
        airtimeFiveButton.setTitleColor(UIColor.black, for: .normal)
        airtimeSixButton.layer.cornerRadius = 3
        airtimeSixButton.backgroundColor = UIColor.white
        airtimeSixButton.setTitleColor(UIColor.black, for: .normal)
        
        airtimeFourButton.addTarget(self, action: #selector(airtimeFourButtonPressed), for: .touchUpInside)
        airtimeFiveButton.addTarget(self, action: #selector(airtimeFiveButtonPressed), for: .touchUpInside)
        airtimeSixButton.addTarget(self, action: #selector(airtimeSixButtonPressed), for: .touchUpInside)
        
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [airtimeFourButton, airtimeFiveButton, airtimeSixButton])
        hStackView.axis = .horizontal
         hStackView.distribution = .fillEqually
        hStackView.spacing = 5
       
        return hStackView
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ROW TWO BUTTON ACTIONS
    //----------------------------------------------------------------
    
    @objc func airtimeFourButtonPressed(){
        
        if handleAirtimePlaceholder(text: airtimeNumberTextField.text!) {
            
            airtimeNumberTextField.text = ""
            numpadBtnPressed(button: airtimeFourButton, label: airtimeNumberTextField)
            
        }else {
           
            numpadBtnPressed(button: airtimeFourButton, label: airtimeNumberTextField)
            
        }
    }
    
    
    @objc func airtimeFiveButtonPressed(){
        
        
        if handleAirtimePlaceholder(text: airtimeNumberTextField.text!){
            
            airtimeNumberTextField.text = ""
            numpadBtnPressed(button: airtimeFiveButton, label: airtimeNumberTextField)
        }else {
            
             numpadBtnPressed(button: airtimeFiveButton, label: airtimeNumberTextField)
            
        }
        
    }
    
    
    @objc func airtimeSixButtonPressed() {
        
        if handleAirtimePlaceholder(text: airtimeNumberTextField.text!) {
           
            airtimeNumberTextField.text = ""
            numpadBtnPressed(button: airtimeSixButton, label: airtimeNumberTextField)
            
            
        }else {
            
            numpadBtnPressed(button: airtimeSixButton, label: airtimeNumberTextField)
        }
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makeAirtimeRowThreeStackView() -> UIStackView {
        
        airtimeSevenButton.layer.cornerRadius = 3
        airtimeSevenButton.backgroundColor = UIColor.white
        airtimeSevenButton.setTitleColor(UIColor.black, for: .normal)
        airtimeEightButton.layer.cornerRadius = 3
        airtimeEightButton.backgroundColor = UIColor.white
        airtimeEightButton.setTitleColor(UIColor.black, for: .normal)
        airtimeNineButton.layer.cornerRadius = 3
        airtimeNineButton.backgroundColor = UIColor.white
        airtimeNineButton.setTitleColor(UIColor.black, for: .normal)
        
        airtimeSevenButton.addTarget(self, action: #selector(airtimeSevenButtonPressed), for: .touchUpInside)
        airtimeEightButton.addTarget(self, action: #selector(airtimeEightButtonPressed), for: .touchUpInside)
        airtimeNineButton.addTarget(self, action: #selector(airtimeNineButtonPressed), for: .touchUpInside)
        
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [airtimeSevenButton, airtimeEightButton, airtimeNineButton])
        hStackView.axis = .horizontal
         hStackView.distribution = .fillEqually
        hStackView.spacing = 5
       
        return hStackView
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ROW THREE BUTTON ACTIONS
    //----------------------------------------------------------------
    
    @objc func airtimeSevenButtonPressed(){
    
        if handleAirtimePlaceholder(text: airtimeNumberTextField.text!){
            
            airtimeNumberTextField.text = ""
             numpadBtnPressed(button: airtimeSevenButton, label: airtimeNumberTextField)
            
        }else {
            
        numpadBtnPressed(button: airtimeSevenButton, label: airtimeNumberTextField)
            
        }
    
    }
    
    
    @objc func airtimeEightButtonPressed(){
        
        if handleAirtimePlaceholder(text: airtimeNumberTextField.text!) {
            
            airtimeNumberTextField.text = ""
             numpadBtnPressed(button: airtimeEightButton, label: airtimeNumberTextField)
            
        }else {
            
             numpadBtnPressed(button: airtimeEightButton, label: airtimeNumberTextField)
        }
        
       
        
    }
    
    
    @objc func airtimeNineButtonPressed(){
        
        if handleAirtimePlaceholder(text: airtimeNumberTextField.text!) {
            
            airtimeNumberTextField.text = ""
            numpadBtnPressed(button: airtimeNineButton, label: airtimeNumberTextField)
            
        }else {
            
            numpadBtnPressed(button: airtimeNineButton, label: airtimeNumberTextField)
        }
        
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME ROW FOUR STACKVIEW
    //----------------------------------------------------------------
    
    func makeAirtimeRowFourStackView() -> UIStackView{
        
        airtimeDecimalButton.layer.cornerRadius = 3
        airtimeDecimalButton.backgroundColor = UIColor.white
        airtimeDecimalButton.setTitleColor(UIColor.black, for: .normal)
        airtimeZeroButton.layer.cornerRadius = 3
        airtimeZeroButton.backgroundColor = UIColor.white
        airtimeZeroButton.setTitleColor(UIColor.black, for: .normal)
        airtimeDeleteButton.layer.cornerRadius = 3
        airtimeDeleteButton.backgroundColor = UIColor.white
        airtimeDeleteButton.setTitleColor(UIColor.black, for: .normal)
        
        
        airtimeDecimalButton.addTarget(self, action: #selector(airtimeDecimalButtonPressed), for: .touchUpInside)
        airtimeZeroButton.addTarget(self, action: #selector(airtimeZeroButtonPressed), for: .touchUpInside)
        airtimeDeleteButton.addTarget(self, action: #selector(airtimeDeleteButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [airtimeDecimalButton, airtimeZeroButton, airtimeDeleteButton])
        hStackView.axis = .horizontal
         hStackView.distribution = .fillEqually
        hStackView.spacing = 5

        return hStackView
    
    }

    //----------------------------------------------------------------
    

    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ROW FOUR BUTTON ACTIONS
    //----------------------------------------------------------------
    
    @objc func airtimeDecimalButtonPressed(){
        
        
//        if handlePlaceholder(text: airtimeNumberTextField.text!) {
//
//             airtimeNumberTextField.text = ""
//             numpadBtnPressed(button: airtimeDecimalButton, label: airtimeNumberTextField)
//
//        }else {
//
//             numpadBtnPressed(button: airtimeDecimalButton, label: airtimeNumberTextField)
//
//        }
    
       
    
    
    }
    
    @objc func airtimeZeroButtonPressed(){
        
        if handleAirtimePlaceholder(text: airtimeNumberTextField.text!) {
            
            airtimeNumberTextField.text = ""
            numpadBtnPressed(button: airtimeZeroButton, label: airtimeNumberTextField)
            
        }else {
            
            numpadBtnPressed(button: airtimeZeroButton, label: airtimeNumberTextField)
        }
    }
    
    
    @objc func airtimeDeleteButtonPressed(){
        
        
        if handleAirtimePlaceholder(text: airtimeNumberTextField.text!){
            
              airtimeNumberTextField.text = ""
              numpadClearBtnPressed(button: airtimeDeleteButton, label: airtimeNumberTextField)
            
        }else {
            
              numpadClearBtnPressed(button: airtimeDeleteButton, label: airtimeNumberTextField)
        }
        
      
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME NUMBER KEYBOARD STACKVIEW
    //----------------------------------------------------------------
    
    func makeAirtimeKeyBoardParentStackView(){
        
        let pStackView = Controls().theParentStackView(buttons: [makeAirtimeRowOneStackView(), makeAirtimeRowTwoStackView(),makeAirtimeRowThreeStackView(), makeAirtimeRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 5
        airtimeKeyboardView.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: airtimeKeyboardView.leftAnchor).isActive = true
        pStackView.rightAnchor.constraint(equalTo: airtimeKeyboardView.rightAnchor).isActive = true
        pStackView.topAnchor.constraint(equalTo: airtimeKeyboardView.topAnchor).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: airtimeKeyboardView.bottomAnchor).isActive = true
        
    }
    
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME KEYBOARD VIEW
    //----------------------------------------------------------------
    
    func makeAirtimeKeyboardView(){
        
        airtimeKeyboardView.backgroundColor = Theme.DarkerGray
        airtimeKeyboardView.translatesAutoresizingMaskIntoConstraints = false
        airtimeView.addSubview(airtimeKeyboardView)
        setAirtimeKeyboardViewConstraints()
        makeAirtimeKeyBoardParentStackView()
    }
    
    //----------------------------------------------------------------
   
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET AIRTIME VIEW CONSTRAINTS
    //----------------------------------------------------------------
    
    func setAirtimeViewConstraints(){
        
        airtimeView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        airtimeView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        airtimeView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        airtimeView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET AIRTIME CONSTRAINTS
    //----------------------------------------------------------------
    
    func setAirtimeAccessoryViewConstraints(){
        
        airtimeAccessoryView.leftAnchor.constraint(equalTo: airtimeView.leftAnchor).isActive = true
        airtimeAccessoryView.rightAnchor.constraint(equalTo: airtimeView.rightAnchor).isActive = true
        airtimeAccessoryView.topAnchor.constraint(equalTo: airtimeView.topAnchor).isActive = true
        airtimeAccessoryView.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET AIRTIME BACK BUTTON CONSTRAINTS
    //----------------------------------------------------------------
    
    func setAirtimeBackButtonConstraints(){
        
        airtimeBackBtn.leftAnchor.constraint(equalTo: airtimeAccessoryView.leftAnchor, constant: 8).isActive = true
        airtimeBackBtn.topAnchor.constraint(equalTo: airtimeView.topAnchor, constant: 8).isActive = true
        airtimeBackBtn.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        airtimeBackBtn.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET AIRTIME BACK BUTTON CONSTRAINTS
    //----------------------------------------------------------------
    
    func setAirtimeNumberTextFieldConstraints(){
        
        airtimeNumberTextField.leftAnchor.constraint(equalTo: airtimeBackBtn.rightAnchor, constant: 8).isActive = true
        airtimeNumberTextField.centerYAnchor.constraint(equalTo: airtimeBackBtn.centerYAnchor).isActive = true
        airtimeNumberTextField.heightAnchor.constraint(equalToConstant: 34.0).isActive = true
        airtimeNumberTextField.widthAnchor.constraint(equalToConstant: 230.0).isActive = true
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET AIRTIME KEYBOARD BUTTON CONSTRAINTS
    //----------------------------------------------------------------
    
    func setAirtimeKeyboardButtonConstraints(){
        
        airtimeChangeKeyboardBtn.leftAnchor.constraint(equalTo: airtimeNumberTextField.rightAnchor, constant: 8).isActive = true
        airtimeChangeKeyboardBtn.centerYAnchor.constraint(equalTo: airtimeNumberTextField.centerYAnchor).isActive = true
        airtimeChangeKeyboardBtn.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        airtimeChangeKeyboardBtn.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET AIRTIME BACK BUTTON CONSTRAINTS
    //----------------------------------------------------------------
    
    func setAirtimeRightButtonConstraints(){
        
        airtimeRightBtn.rightAnchor.constraint(equalTo: airtimeAccessoryView.rightAnchor, constant: -8).isActive = true
        airtimeRightBtn.centerYAnchor.constraint(equalTo: airtimeChangeKeyboardBtn.centerYAnchor).isActive = true
        airtimeRightBtn.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        airtimeRightBtn.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET AIRTIME BACK BUTTON CONSTRAINTS
    //----------------------------------------------------------------
    
    func setAirtimePayeeLabelConstraints(){
        
        
        airtimePayeeLabel.topAnchor.constraint(equalTo: airtimeAccessoryView.bottomAnchor, constant: 3).isActive = true
        airtimePayeeLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        airtimePayeeLabel.centerXAnchor.constraint(equalTo: airtimeNumberTextField.centerXAnchor).isActive = true
      
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SETUP AIRTIME OPTIONS VIEW CONSTRAINTS
    //----------------------------------------------------------------
    
    func setupAirtimeOptionsViewConstraints(){
        
        airtimeViewOptionsView.leftAnchor.constraint(equalTo: airtimeView.leftAnchor).isActive = true
        airtimeViewOptionsView.rightAnchor.constraint(equalTo: airtimeView.rightAnchor).isActive = true
        airtimeViewOptionsView.topAnchor.constraint(equalTo: airtimePayeeLabel.bottomAnchor, constant: 8.0).isActive = true
        airtimeViewOptionsView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
    }
    
    
    //----------------------------------------------------------------
    
    func setupOptionsHorizontalView(){
        
        
        
    }

    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CLOSE AIRTIME VIEW
    //----------------------------------------------------------------
    
    func airtimeBackButtonPressed(){
        
       airtimeBackBtn.addTarget(self, action: #selector(closeAirtimeView), for: .touchUpInside)
    }
    
    @objc func closeAirtimeView(){
        
        airtimeView.removeFromSuperview()
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:- byg
    // MARK:- SHOW AIRTIME AMOUNT VIEW
    //----------------------------------------------------------------
    
    func airtimeViewRightButtonPressed(){
        
        airtimeRightBtn.addTarget(self, action: #selector(showAirtimeAmountView), for: .touchUpInside)
    }
    
    @objc func showAirtimeAmountView(){
        
        
        if airtimeNumberTextField.text?.isEmpty ?? true {
            
            showValidationView(message: "Please enter reciepient phone number")
            
        }else if airtimeNumberTextField.text == "Type the reciepient number" {
            
            showValidationView(message: "Please enter reciepient phone number")
            
        }else if airtimeNumberTextField.text!.count < 9 {
            
            showValidationView(message: "Please enter a valid reciepient phone number")
            
        }else if airtimePayeeLabel.text! == "" {
            
            
            showValidationView(message: "Please choose airtime network provider.")
            
        }else {
            
            airtimeView.removeFromSuperview()
            makeAirtimeAmountView()
            KeyboardSharedPreferences().setAirtimeRecipient(recipient: PhonenumberFormater().validatePhonenumber(phonenumber: airtimeNumberTextField.text!))
        }
        
//        makeContactsMainView()
        
       
        
    }
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET AIRTIME VIEW CONSTRAINTS
    //----------------------------------------------------------------
    
    func setAirtimeKeyboardViewConstraints(){
        
        airtimeKeyboardView.leftAnchor.constraint(equalTo: airtimeView.leftAnchor, constant: 5).isActive = true
        airtimeKeyboardView.rightAnchor.constraint(equalTo: airtimeView.rightAnchor, constant: -5).isActive = true
        airtimeKeyboardView.topAnchor.constraint(equalTo: airtimeViewOptionsView.bottomAnchor, constant: 5).isActive = true
        airtimeKeyboardView.bottomAnchor.constraint(equalTo: airtimeView.bottomAnchor, constant: -3).isActive = true

    }
    
    
    //----------------------------------------------------------------
    
    
   
        
    
   
    
    
    
    
}


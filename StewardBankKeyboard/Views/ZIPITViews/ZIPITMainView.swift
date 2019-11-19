//
//  ZIPITMainView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/1/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit



extension KeyboardViewController{

    
    func makeZIPITMainView(){
        
        view.addSubview(ZIPITMainViewView)
        ZIPITMainViewView.layer.cornerRadius = 0
        ZIPITMainViewView.backgroundColor = Theme.LighterGray
        ZIPITMainViewView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        ZIPITMainViewView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        ZIPITMainViewView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        ZIPITMainViewView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        makeZIPITMainViewTopView()
        makeZIPITKeyboardView()
        
    }
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT TOP VIEW
    //----------------------------------------------------------------
    
    func makeZIPITMainViewTopView(){
        
        ZIPITMainViewTopView.backgroundColor = Theme.LighterGray
        ZIPITMainViewView.addSubview(ZIPITMainViewTopView)
        ZIPITMainViewTopView.topAnchor.constraint(equalTo: ZIPITMainViewView.topAnchor, constant: 3.0).isActive = true
        ZIPITMainViewTopView.leftAnchor.constraint(equalTo: ZIPITMainViewView.leftAnchor, constant: 0).isActive = true
        ZIPITMainViewTopView.rightAnchor.constraint(equalTo: ZIPITMainViewView.rightAnchor, constant: 0).isActive = true
        ZIPITMainViewTopView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        makeZIPITMainViewBackButton()
        makeZIPITMainViewRightButton()
        makeZIPITTopContainerTextField()
        makeZIPITBankNameLabel()
        makeZIPITBankListView()
        
    }
    
    //----------------------------------------------------------------
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT VIEW BACK BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeZIPITMainViewBackButton(){
        
        ZIPITMainViewBackBtn.layer.cornerRadius = 15
        ZIPITMainViewTopView.addSubview(ZIPITMainViewBackBtn)
        //        billpaymentsMainViewBackBtnPressed()
        
        
        ZIPITMainViewBackBtn.addTarget(self, action: #selector(ZIPITMainViewBackBtnPressed), for: .touchUpInside)
        
        ZIPITMainViewBackBtn.topAnchor.constraint(equalTo: ZIPITMainViewTopView.topAnchor, constant: 10).isActive = true
        ZIPITMainViewBackBtn.leftAnchor.constraint(equalTo: ZIPITMainViewTopView.leftAnchor, constant: 8).isActive = true
        ZIPITMainViewBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        ZIPITMainViewBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
   
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT MAIN BACK BTN CLIICKED
    //----------------------------------------------------------------
    @objc func ZIPITMainViewBackBtnPressed(){
        
        ZIPITMainViewView.removeFromSuperview()
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT RIGHT BUTTON VIEW
    //----------------------------------------------------------------
    
    func makeZIPITMainViewRightButton(){
        
        ZIPITMainViewRightBtn.layer.cornerRadius = 15
        ZIPITMainViewTopView.addSubview(ZIPITMainViewRightBtn)
        //        billpaymentsViewRightButtonPressed()
        
        ZIPITMainViewRightBtn.addTarget(self, action: #selector(ZIPITMainViewRightBtnPressed), for: .touchUpInside)
        
       ZIPITMainViewRightBtn.topAnchor.constraint(equalTo: ZIPITMainViewTopView.topAnchor, constant: 10).isActive = true
       ZIPITMainViewRightBtn.rightAnchor.constraint(equalTo: ZIPITMainViewTopView.rightAnchor, constant: -8).isActive = true
       ZIPITMainViewRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
       ZIPITMainViewRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT MAIN RIGHT BTN CLIICKED
    //----------------------------------------------------------------
    @objc func ZIPITMainViewRightBtnPressed(){
        
        
        if ZIPITMainViewAccountTextField.text?.isEmpty ?? true {
            
            showValidationView(message: "Please enter the recipient's bank account number.")
            
        }else if ZIPITMainViewAccountTextField.text == "Type the recipient account number" {
            
             showValidationView(message: "Please enter the recipient's bank account number.")
            
        }else if ZIPITMainBankNameLabel.text == "Destination Bank" {
            
            showValidationView(message: "Please choose destination bank.")
           
        }else {
            
            KeyboardSharedPreferences().setEcocashBankDestinationAccount(destinationAccount: ZIPITMainViewAccountTextField.text!)
            KeyboardSharedPreferences().setZIPITDestinationAccount(destinationAccount: ZIPITMainViewAccountTextField.text!)
            
            
            print("DESTINATION ACCOUNT: \(KeyboardSharedPreferences().getEcocashBankDestinationAccount()!)")
            
            
            makeZIPITAmountView()
            
            
        }
        
    
    }
    
    //----------------------------------------------------------------
    
    
   
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeZIPITTopContainerTextField(){
        
        ZIPITMainViewTopView.addSubview(ZIPITMainViewAccountTextField)
        ZIPITMainViewAccountTextField.textAlignment = .center
        ZIPITMainViewAccountTextField.backgroundColor = UIColor.white
        ZIPITMainViewAccountTextField.layer.cornerRadius
            = 5
        ZIPITMainViewAccountTextField.layer.masksToBounds = true
        ZIPITMainViewAccountTextField.textColor = UIColor.gray
        
        ZIPITMainViewAccountTextField.centerYAnchor.constraint(equalTo: ZIPITMainViewRightBtn.centerYAnchor).isActive = true
        ZIPITMainViewAccountTextField.leftAnchor.constraint(equalTo: ZIPITMainViewBackBtn.rightAnchor, constant: 20).isActive = true
        ZIPITMainViewAccountTextField.rightAnchor.constraint(equalTo: ZIPITMainViewRightBtn.leftAnchor, constant: -20).isActive = true
        ZIPITMainViewAccountTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS MAIN VIEW BILLER NAME LABEL
    //----------------------------------------------------------------
    
    func makeZIPITBankNameLabel(){
        
        
       ZIPITMainViewTopView.addSubview(ZIPITMainBankNameLabel)
       ZIPITMainBankNameLabel.textAlignment = .left
       ZIPITMainBankNameLabel.layer.cornerRadius = 5
       ZIPITMainBankNameLabel.layer.masksToBounds = true
       ZIPITMainBankNameLabel.textColor = Theme.PrimaryPurple
  
        ZIPITMainBankNameLabel.topAnchor.constraint(equalTo: ZIPITMainViewAccountTextField.bottomAnchor, constant: 2).isActive = true
        ZIPITMainBankNameLabel.leftAnchor.constraint(equalTo: ZIPITMainViewAccountTextField.leftAnchor, constant: 0).isActive = true
        
        
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT MAKE BANK LIST VIEW
    //----------------------------------------------------------------
    
    func makeZIPITBankListView(){
    
       ZIPITMainViewTopView.addSubview(ZIPITBanksList)
        
       ZIPITBanksList.topAnchor.constraint(equalTo: ZIPITMainBankNameLabel.bottomAnchor, constant: 5).isActive = true
       ZIPITBanksList.leftAnchor.constraint(equalTo:   ZIPITMainViewTopView.leftAnchor, constant: 0).isActive = true
       ZIPITBanksList.rightAnchor.constraint(equalTo:  ZIPITMainViewTopView.rightAnchor, constant: 0).isActive = true
       ZIPITBanksList.bottomAnchor.constraint(equalTo: ZIPITMainViewTopView.bottomAnchor, constant: 0).isActive = true
   
    }
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT MAKE KEYBOARD VIEW
    //----------------------------------------------------------------
    
    func makeZIPITKeyboardView(){
        

        ZIPITMainViewView.addSubview(ZIPITMainViewKeyboardContainer)
        ZIPITMainViewKeyboardContainer.backgroundColor = Theme.LighterGray
        
        ZIPITMainViewKeyboardContainer.topAnchor.constraint(equalTo: ZIPITMainViewTopView.bottomAnchor, constant: 6).isActive = true
        ZIPITMainViewKeyboardContainer.leftAnchor.constraint(equalTo: ZIPITMainViewView.leftAnchor, constant: 6).isActive = true
        ZIPITMainViewKeyboardContainer.rightAnchor.constraint(equalTo: ZIPITMainViewView.rightAnchor, constant: -6).isActive = true
        ZIPITMainViewKeyboardContainer.bottomAnchor.constraint(equalTo: ZIPITMainViewView.bottomAnchor, constant: -6).isActive = true
        
        makeZIPITKeyBoardParentStackView()
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT MAIN VIEW KEYBOARD ROW ONE STACKVIEW
    //----------------------------------------------------------------
    
    func makeZIPITMainViewRowOneStackView() -> UIStackView {
        
        ZIPITViewOneButton.layer.cornerRadius = 3
        ZIPITViewOneButton.backgroundColor = UIColor.white
        ZIPITViewOneButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITViewTwoButton.layer.cornerRadius = 3
        ZIPITViewTwoButton.backgroundColor = UIColor.white
        ZIPITViewTwoButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITViewThreeButton.layer.cornerRadius = 3
        ZIPITViewThreeButton.backgroundColor = UIColor.white
        ZIPITViewThreeButton.setTitleColor(UIColor.black, for: .normal)
        
        ZIPITViewOneButton.addTarget(self, action: #selector(ZIPITViewOneButtonPressed), for: .touchUpInside)
        ZIPITViewTwoButton.addTarget(self, action: #selector(ZIPITViewTwoButtonPressed), for: .touchUpInside)
        ZIPITViewThreeButton.addTarget(self, action: #selector(ZIPITViewThreeButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [ZIPITViewOneButton, ZIPITViewTwoButton, ZIPITViewThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS MAIN ROW ONE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func ZIPITViewOneButtonPressed(){
        
        if handleTextField(label: ZIPITMainViewAccountTextField, text: "Type the recipient account number") {
            
            ZIPITMainViewAccountTextField.text = ""
            numpadBtnPressed(button: ZIPITViewOneButton, label: ZIPITMainViewAccountTextField)
        }else {
            
             numpadBtnPressed(button: ZIPITViewOneButton, label: ZIPITMainViewAccountTextField)
        }
        
       
        
    }
    
    @objc func ZIPITViewTwoButtonPressed(){
        
        
        if handleTextField(label: ZIPITMainViewAccountTextField, text: "Type the recipient account number") {
            
            ZIPITMainViewAccountTextField.text = ""
            numpadBtnPressed(button: ZIPITViewTwoButton, label: ZIPITMainViewAccountTextField)
        }else {
       
            numpadBtnPressed(button: ZIPITViewTwoButton, label: ZIPITMainViewAccountTextField)
        
            }
        
    }
    
    @objc func ZIPITViewThreeButtonPressed(){
        
        
        if handleTextField(label: ZIPITMainViewAccountTextField, text: "Type the recipient account number") {
            
            ZIPITMainViewAccountTextField.text = ""
            numpadBtnPressed(button: ZIPITViewThreeButton, label: ZIPITMainViewAccountTextField)
        }else {
        
        numpadBtnPressed(button: ZIPITViewThreeButton, label: ZIPITMainViewAccountTextField)
            
        }
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT MAIN VIEW KEYBOARD ROW TWO STACKVIEW
    //----------------------------------------------------------------
    
    func makeZIPITMainViewRowTwoStackView() -> UIStackView {
        
        ZIPITViewFourButton.layer.cornerRadius = 3
        ZIPITViewFourButton.backgroundColor = UIColor.white
        ZIPITViewFourButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITViewFiveButton.layer.cornerRadius = 3
        ZIPITViewFiveButton.backgroundColor = UIColor.white
        ZIPITViewFiveButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITViewSixButton.layer.cornerRadius = 3
        ZIPITViewSixButton.backgroundColor = UIColor.white
        ZIPITViewSixButton.setTitleColor(UIColor.black, for: .normal)
        
        ZIPITViewFourButton.addTarget(self, action: #selector(ZIPITViewFourButtonPressed), for: .touchUpInside)
        ZIPITViewFiveButton.addTarget(self, action: #selector(ZIPITViewFiveButtonPressed), for: .touchUpInside)
        ZIPITViewSixButton.addTarget(self, action: #selector(ZIPITViewSixButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [ZIPITViewFourButton, ZIPITViewFiveButton, ZIPITViewSixButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS MAIN ROW TWO BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func ZIPITViewFourButtonPressed(){
        
        if handleTextField(label: ZIPITMainViewAccountTextField, text: "Type the reciepient account number") {
            
            ZIPITMainViewAccountTextField.text = ""
            numpadBtnPressed(button: ZIPITViewFourButton, label: ZIPITMainViewAccountTextField)
        }else {
        
        numpadBtnPressed(button: ZIPITViewFourButton, label: ZIPITMainViewAccountTextField)
            
        }
        
    }
    
    @objc func ZIPITViewFiveButtonPressed(){
        
        if handleTextField(label: ZIPITMainViewAccountTextField, text: "Type the recipient account number") {
            
            ZIPITMainViewAccountTextField.text = ""
            numpadBtnPressed(button: ZIPITViewFiveButton, label: ZIPITMainViewAccountTextField)
        }else {
        
        numpadBtnPressed(button: ZIPITViewFiveButton, label: ZIPITMainViewAccountTextField)
            
        }
        
    }
    
    @objc func ZIPITViewSixButtonPressed(){
        
        if handleTextField(label: ZIPITMainViewAccountTextField, text: "Type the recipient account number") {
            
            ZIPITMainViewAccountTextField.text = ""
            numpadBtnPressed(button: ZIPITViewSixButton, label: ZIPITMainViewAccountTextField)
        }else {
        
        numpadBtnPressed(button: ZIPITViewSixButton, label: ZIPITMainViewAccountTextField)
            
        }
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT MAIN VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makeZIPITMainViewRowThreeStackView() -> UIStackView {
        
        ZIPITViewSevenButton.layer.cornerRadius = 3
        ZIPITViewSevenButton.backgroundColor = UIColor.white
        ZIPITViewSevenButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITViewEightButton.layer.cornerRadius = 3
        ZIPITViewEightButton.backgroundColor = UIColor.white
        ZIPITViewEightButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITViewNineButton.layer.cornerRadius = 3
        ZIPITViewNineButton.backgroundColor = UIColor.white
        ZIPITViewNineButton.setTitleColor(UIColor.black, for: .normal)
        
        ZIPITViewSevenButton.addTarget(self, action: #selector(ZIPITViewSevenButtonPressed), for: .touchUpInside)
        ZIPITViewEightButton.addTarget(self, action: #selector(ZIPITViewEightButtonPressed), for: .touchUpInside)
        ZIPITViewNineButton.addTarget(self, action: #selector(ZIPITViewNineButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [ZIPITViewSevenButton, ZIPITViewEightButton, ZIPITViewNineButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS MAIN ROW THREE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func ZIPITViewSevenButtonPressed(){
        
        if handleTextField(label: ZIPITMainViewAccountTextField, text: "Type the recipient account number") {
            
            ZIPITMainViewAccountTextField.text = ""
            numpadBtnPressed(button: ZIPITViewSevenButton, label: ZIPITMainViewAccountTextField)
            
        }else {
            
        numpadBtnPressed(button: ZIPITViewSevenButton, label: ZIPITMainViewAccountTextField)
            
        }
        
    }
    
    @objc func ZIPITViewEightButtonPressed(){
        
        if handleTextField(label: ZIPITMainViewAccountTextField, text: "Type the recipient account number") {
            
            ZIPITMainViewAccountTextField.text = ""
            numpadBtnPressed(button: ZIPITViewEightButton, label: ZIPITMainViewAccountTextField)
        }else {
        
        numpadBtnPressed(button: ZIPITViewEightButton, label: ZIPITMainViewAccountTextField)
            
        }
        
    }
    
    @objc func ZIPITViewNineButtonPressed(){
        
        
        if handleTextField(label: ZIPITMainViewAccountTextField, text: "Type the recipient account number") {
            
            ZIPITMainViewAccountTextField.text = ""
            numpadBtnPressed(button: ZIPITViewNineButton, label: ZIPITMainViewAccountTextField)
        }else {
        
        numpadBtnPressed(button: ZIPITViewNineButton, label: ZIPITMainViewAccountTextField)
            
        }
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT MAIN VIEW KEYBOARD ROW FOUR STACKVIEW
    //----------------------------------------------------------------
    
    func makeZIPITMainViewRowFourStackView() -> UIStackView {
        
        ZIPITViewZeroButton.layer.cornerRadius = 3
        ZIPITViewZeroButton.backgroundColor = UIColor.white
        ZIPITViewZeroButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITViewDeleteButton.layer.cornerRadius = 3
        ZIPITViewDeleteButton.backgroundColor = UIColor.white
        ZIPITViewDeleteButton.setTitleColor(UIColor.black, for: .normal)
      
        
        ZIPITViewZeroButton.addTarget(self, action: #selector(ZIPITViewZeroButtonPressed), for: .touchUpInside)
        ZIPITViewDeleteButton.addTarget(self, action: #selector(ZIPITViewDeleteButtonPressed), for: .touchUpInside)
       
        
        let hStackView = Controls().theHorizontalStackView(buttons: [ZIPITViewZeroButton, ZIPITViewDeleteButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS MAIN ROW FOUR BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func ZIPITViewZeroButtonPressed(){
        
        if handleTextField(label: ZIPITMainViewAccountTextField, text: "Type the recipient account number") {
            
            ZIPITMainViewAccountTextField.text = ""
            numpadBtnPressed(button: ZIPITViewZeroButton, label: ZIPITMainViewAccountTextField)
            
        }else {
        
        numpadBtnPressed(button: ZIPITViewZeroButton, label: ZIPITMainViewAccountTextField)
            
        }
        
    }
    
    @objc func ZIPITViewDeleteButtonPressed(){
        
        if handleTextField(label: ZIPITMainViewAccountTextField, text: "Type the recipient account number") {
            
            ZIPITMainViewAccountTextField.text = ""
            numpadBtnPressed(button: ZIPITViewDeleteButton, label: ZIPITMainViewAccountTextField)
        }else {
            
            guard let _ = ZIPITMainViewAccountTextField.text else {
                
                ZIPITMainViewAccountTextField.text = "Type the recipient account number"
                
                return
            }
        
        numpadClearBtnPressed(button: ZIPITViewDeleteButton, label: ZIPITMainViewAccountTextField)
            
            
            
//            if ZIPITMainViewAccountTextField.text!.count < 1 {
//
//                ZIPITMainViewAccountTextField.text = "Type the recipient account number"
//            }
            
        }
        
    }
    
   
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT KEYBOARD PARENT STACKVIEW
    //----------------------------------------------------------------
    
    func makeZIPITKeyBoardParentStackView(){
        
        let pStackView = Controls().theParentStackView(buttons: [makeZIPITMainViewRowOneStackView(), makeZIPITMainViewRowTwoStackView(), makeZIPITMainViewRowThreeStackView(), makeZIPITMainViewRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 6
        ZIPITMainViewKeyboardContainer.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: ZIPITMainViewKeyboardContainer.leftAnchor, constant: 3).isActive = true
        pStackView.rightAnchor.constraint(equalTo: ZIPITMainViewKeyboardContainer.rightAnchor, constant: -3).isActive = true
        pStackView.topAnchor.constraint(equalTo: ZIPITMainViewKeyboardContainer.topAnchor, constant: 3).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: ZIPITMainViewKeyboardContainer.bottomAnchor, constant: -3).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- HANDLE TEXTFIELD FUNCTION
    //----------------------------------------------------------------
    
    func handleTextField(label: UILabel, text: String) -> Bool {
        
        var status = false
    
        guard let textString = label.text else {
            
            print("clear")
        
            return status
        }
        
        if text == textString {
            
             status = true
        }
        
        return status
        
    }
    
    
    //----------------------------------------------------------------
    
}

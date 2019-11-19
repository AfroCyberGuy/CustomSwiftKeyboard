//
//  InternalTransferMainView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/8/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit

extension KeyboardViewController {
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL AMOUNT VIEW
    //----------------------------------------------------------------
    
    func makeInternalAccountView(){
        
        InternalTransferAccountView.backgroundColor = Theme.LighterGray
        InternalTransferAccountView.layer.cornerRadius = 0
        view.addSubview(InternalTransferAccountView)
        setInternalAccountViewConstraints()
        makeInternalAmountViewTopContainer()
        makeInternalAccountKeyboardViewContainer()
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL AMOUNT VIEW TOP CONTAINER
    //----------------------------------------------------------------
    
    func makeInternalAmountViewTopContainer(){
        
        InternalTransferAccountTopContainer.backgroundColor = Theme.LighterGray
        InternalTransferAccountTopContainer.layer.cornerRadius = 0
        InternalTransferAccountView.addSubview(InternalTransferAccountTopContainer)
        
        InternalTransferAccountTopContainer.topAnchor.constraint(equalTo: InternalTransferAccountView.topAnchor).isActive = true
        InternalTransferAccountTopContainer.leftAnchor.constraint(equalTo: InternalTransferAccountView.leftAnchor).isActive = true
        InternalTransferAccountTopContainer.rightAnchor.constraint(equalTo: InternalTransferAccountView.rightAnchor).isActive = true
        InternalTransferAccountTopContainer.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        makeInternalAccountTopContainerLabel()
        makeInternalAccountViewBackButton()
        makeInternalAccountViewRightButton()
        makeInternalAccountTopContainerTextField()
        
        
    }
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL ACCOUNT TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeInternalAccountTopContainerLabel(){
        
        InternalTransferAccountTopContainer.addSubview(InternalTransferAccountTopContainerLabel)
        InternalTransferAccountTopContainerLabel.textAlignment = .center
        
        InternalTransferAccountTopContainerLabel.topAnchor.constraint(equalTo: InternalTransferAccountTopContainer.topAnchor, constant: 3).isActive = true
        InternalTransferAccountTopContainerLabel.leftAnchor.constraint(equalTo: InternalTransferAccountTopContainer.leftAnchor, constant: 3).isActive = true
        InternalTransferAccountTopContainerLabel.rightAnchor.constraint(equalTo: InternalTransferAccountTopContainer.rightAnchor, constant: 3).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL ACCOUNT VIEW BACK BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeInternalAccountViewBackButton(){
        
        InternalTransferAccountBackBtn.layer.cornerRadius = 15
        InternalTransferAccountTopContainer.addSubview(InternalTransferAccountBackBtn)
        
        
        InternalTransferAccountBackBtn.addTarget(self, action: #selector(InternalTransferAccountBackBtnPressed), for: .touchUpInside)
        
        InternalTransferAccountBackBtn.topAnchor.constraint(equalTo: InternalTransferAccountTopContainerLabel.bottomAnchor, constant: 2).isActive = true
        InternalTransferAccountBackBtn.leftAnchor.constraint(equalTo: InternalTransferAccountTopContainer.leftAnchor, constant: 8).isActive = true
        InternalTransferAccountBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        InternalTransferAccountBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL ACCOUNT BACK BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func InternalTransferAccountBackBtnPressed(){
        
        InternalTransferAccountView.removeFromSuperview()
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL ACCOUNT VIEW RIGHT BUTTON VIEW
    //----------------------------------------------------------------
    
    func makeInternalAccountViewRightButton(){
        
        InternalTransferAccountRightBtn.layer.cornerRadius = 15
        InternalTransferAccountTopContainer.addSubview(InternalTransferAccountRightBtn)
        //      airtimeAmountViewRightButtonPressed()
        
        InternalTransferAccountRightBtn.addTarget(self, action: #selector(InternalTransferAccountRightBtnPressed), for: .touchUpInside)
        
        InternalTransferAccountRightBtn.topAnchor.constraint(equalTo: InternalTransferAccountTopContainerLabel.bottomAnchor, constant: 2).isActive = true
        InternalTransferAccountRightBtn.rightAnchor.constraint(equalTo: InternalTransferAccountTopContainer.rightAnchor, constant: -8).isActive = true
        InternalTransferAccountRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        InternalTransferAccountRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL ACCOUNT RIGHT BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func InternalTransferAccountRightBtnPressed(){
        
        if InternalTransferAccountTextField.text?.isEmpty ?? true {
            
            showValidationView(message: "Please enter recipient's account number.")
            
        }else{
            
            
            //        ZIPIT_AMOUNT = ZIPITAmountTextField.text!
            //
            //        print("ZIPIT_AMOUNT: \(ZIPIT_AMOUNT)")
            //
            //        makeZIPITPaymentsOptionsView()
            INTERNAL_TRANSFER_DESTINATION_ACNT = InternalTransferAccountTextField.text!
            
            makeInternalAmountView()
            
        }
        
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL ACCOUNT TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeInternalAccountTopContainerTextField(){
        
        InternalTransferAccountTopContainer.addSubview(InternalTransferAccountTextField)
        InternalTransferAccountTextField.textAlignment = .center
        InternalTransferAccountTextField.backgroundColor = UIColor.white
        InternalTransferAccountTextField.layer.cornerRadius = 5
        InternalTransferAccountTextField.layer.masksToBounds = true
        InternalTransferAccountTextField.textColor = UIColor.gray
        
        InternalTransferAccountTextField.centerYAnchor.constraint(equalTo: InternalTransferAccountBackBtn.centerYAnchor).isActive = true
        InternalTransferAccountTextField.leftAnchor.constraint(equalTo: InternalTransferAccountBackBtn.rightAnchor, constant: 30).isActive = true
        InternalTransferAccountTextField.rightAnchor.constraint(equalTo: InternalTransferAccountRightBtn.leftAnchor, constant: -30).isActive = true
        InternalTransferAccountTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL ACCOUNT VIEW KEYBOARD CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeInternalAccountKeyboardViewContainer(){
        
        InternalTransferAccountKeyboardContainer.backgroundColor = UIColor.clear
        InternalTransferAccountKeyboardContainer.layer.cornerRadius = 0
        InternalTransferAccountView.addSubview(InternalTransferAccountKeyboardContainer)
        
        InternalTransferAccountKeyboardContainer.topAnchor.constraint(equalTo: InternalTransferAccountTopContainer.bottomAnchor, constant: 5).isActive = true
        InternalTransferAccountKeyboardContainer.leftAnchor.constraint(equalTo: InternalTransferAccountView.leftAnchor, constant: 5).isActive = true
        InternalTransferAccountKeyboardContainer.rightAnchor.constraint(equalTo: InternalTransferAccountView.rightAnchor, constant: -5).isActive = true
        InternalTransferAccountKeyboardContainer.bottomAnchor.constraint(equalTo: InternalTransferAccountView.bottomAnchor, constant: -5).isActive = true
        
        makeInternalAccountKeyBoardParentStackView()
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL ACCOUNT VIEW KEYBOARD ROW ONE STACKVIEW
    //----------------------------------------------------------------
    
    func makeInternalAccountRowOneStackView() -> UIStackView {
        
        InternalTransferAccountOneButton.layer.cornerRadius = 3
        InternalTransferAccountOneButton.backgroundColor = UIColor.white
        InternalTransferAccountOneButton.setTitleColor(UIColor.black, for: .normal)
        InternalTransferAccountTwoButton.layer.cornerRadius = 3
        InternalTransferAccountTwoButton.backgroundColor = UIColor.white
        InternalTransferAccountTwoButton.setTitleColor(UIColor.black, for: .normal)
        InternalTransferAccountThreeButton.layer.cornerRadius = 3
        InternalTransferAccountThreeButton.backgroundColor = UIColor.white
        InternalTransferAccountThreeButton.setTitleColor(UIColor.black, for: .normal)
        
        InternalTransferAccountOneButton.addTarget(self, action: #selector(InternalTransferAccountOneButtonPressed), for: .touchUpInside)
        InternalTransferAccountTwoButton.addTarget(self, action: #selector(InternalTransferAccountTwoButtonPressed), for: .touchUpInside)
        InternalTransferAccountThreeButton.addTarget(self, action: #selector(InternalTransferAccountThreeButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [InternalTransferAccountOneButton, InternalTransferAccountTwoButton, InternalTransferAccountThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL ACCOUNT ROW ONE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func InternalTransferAccountOneButtonPressed(){
        
        numpadBtnPressed(button: InternalTransferAccountOneButton, label: InternalTransferAccountTextField)
        
    }
    
    @objc func InternalTransferAccountTwoButtonPressed(){
        
        numpadBtnPressed(button: InternalTransferAccountTwoButton, label: InternalTransferAccountTextField)
        
    }
    
    @objc func InternalTransferAccountThreeButtonPressed(){
        
        numpadBtnPressed(button: InternalTransferAccountThreeButton, label: InternalTransferAccountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL ACCOUNT VIEW KEYBOARD ROW TWO STACKVIEW
    //----------------------------------------------------------------
    
    func makeInternalAccountRowTwoStackView() -> UIStackView {
        
        InternalTransferAccountFourButton.layer.cornerRadius = 3
        InternalTransferAccountFourButton.backgroundColor = UIColor.white
        InternalTransferAccountFourButton.setTitleColor(UIColor.black, for: .normal)
        InternalTransferAccountFiveButton.layer.cornerRadius = 3
        InternalTransferAccountFiveButton.backgroundColor = UIColor.white
        InternalTransferAccountFiveButton.setTitleColor(UIColor.black, for: .normal)
        InternalTransferAccountSixButton.layer.cornerRadius = 3
        InternalTransferAccountSixButton.backgroundColor = UIColor.white
        InternalTransferAccountSixButton.setTitleColor(UIColor.black, for: .normal)
        
        InternalTransferAccountFourButton.addTarget(self, action: #selector(InternalTransferAccountFourButtonPressed), for: .touchUpInside)
        InternalTransferAccountFiveButton.addTarget(self, action: #selector(InternalTransferAccountFiveButtonPressed), for: .touchUpInside)
        InternalTransferAccountSixButton.addTarget(self, action: #selector(InternalTransferAccountSixButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [InternalTransferAccountFourButton, InternalTransferAccountFiveButton, InternalTransferAccountSixButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL ACCOUNT ROW TWO BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func InternalTransferAccountFourButtonPressed(){
        
        numpadBtnPressed(button: InternalTransferAccountFourButton, label: InternalTransferAccountTextField)
        
    }
    
    @objc func InternalTransferAccountFiveButtonPressed(){
        
        numpadBtnPressed(button: InternalTransferAccountFiveButton, label: InternalTransferAccountTextField)
        
    }
    
    @objc func InternalTransferAccountSixButtonPressed(){
        
        numpadBtnPressed(button: InternalTransferAccountSixButton, label: InternalTransferAccountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL ACCOUNT VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makeInternalAccountRowThreeStackView() -> UIStackView {
        
        InternalTransferAccountSevenButton.layer.cornerRadius = 3
        InternalTransferAccountSevenButton.backgroundColor = UIColor.white
        InternalTransferAccountSevenButton.setTitleColor(UIColor.black, for: .normal)
        InternalTransferAccountEightButton.layer.cornerRadius = 3
        InternalTransferAccountEightButton.backgroundColor = UIColor.white
        InternalTransferAccountEightButton.setTitleColor(UIColor.black, for: .normal)
        InternalTransferAccountNineButton.layer.cornerRadius = 3
        InternalTransferAccountNineButton.backgroundColor = UIColor.white
        InternalTransferAccountNineButton.setTitleColor(UIColor.black, for: .normal)
        
        InternalTransferAccountSevenButton.addTarget(self, action: #selector(InternalTransferAccountSevenButtonPressed), for: .touchUpInside)
        InternalTransferAccountEightButton.addTarget(self, action: #selector(InternalTransferAccountEightButtonPressed), for: .touchUpInside)
        InternalTransferAccountNineButton.addTarget(self, action: #selector(InternalTransferAccountNineButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [InternalTransferAccountSevenButton, InternalTransferAccountEightButton, InternalTransferAccountNineButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL ACCOUNT ROW THREE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func InternalTransferAccountSevenButtonPressed(){
        
        numpadBtnPressed(button: InternalTransferAccountSevenButton, label: InternalTransferAccountTextField)
        
    }
    
    @objc func InternalTransferAccountEightButtonPressed(){
        
        numpadBtnPressed(button: InternalTransferAccountEightButton, label: InternalTransferAccountTextField)
        
    }
    
    @objc func InternalTransferAccountNineButtonPressed(){
        
        numpadBtnPressed(button: InternalTransferAccountNineButton, label: InternalTransferAccountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL ACCOUNT VIEW KEYBOARD ROW FOUR STACKVIEW
    //----------------------------------------------------------------
    
    func makeInternalAccountRowFourStackView() -> UIStackView {
        
        InternalTransferAccountZeroButton.layer.cornerRadius = 3
        InternalTransferAccountZeroButton.backgroundColor = UIColor.white
        InternalTransferAccountZeroButton.setTitleColor(UIColor.black, for: .normal)
        InternalTransferAccountDecimalButton.layer.cornerRadius = 3
        InternalTransferAccountDecimalButton.backgroundColor = UIColor.white
        InternalTransferAccountDecimalButton.setTitleColor(UIColor.black, for: .normal)
        InternalTransferAccountDeleteButton.layer.cornerRadius = 3
        InternalTransferAccountDeleteButton.backgroundColor = UIColor.white
        InternalTransferAccountDeleteButton.setTitleColor(UIColor.black, for: .normal)
        
        InternalTransferAccountZeroButton.addTarget(self, action: #selector(InternalTransferAccountZeroButtonPressed), for: .touchUpInside)
        InternalTransferAccountDecimalButton.addTarget(self, action: #selector(InternalTransferAccountDecimalButtonPressed), for: .touchUpInside)
        InternalTransferAccountDeleteButton.addTarget(self, action: #selector(InternalTransferAccountDeleteButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [InternalTransferAccountZeroButton, InternalTransferAccountDecimalButton, InternalTransferAccountDeleteButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL ACCOUNT ROW FOUR BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func InternalTransferAccountZeroButtonPressed(){
        
        numpadBtnPressed(button: InternalTransferAccountZeroButton, label: InternalTransferAccountTextField)
        
    }
    
    @objc func InternalTransferAccountDecimalButtonPressed(){
        
        numpadBtnPressed(button: InternalTransferAccountDecimalButton, label: InternalTransferAccountTextField)
        
    }
    
    @objc func InternalTransferAccountDeleteButtonPressed(){
        
        numpadClearBtnPressed(button: InternalTransferAccountDeleteButton, label: InternalTransferAccountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL ACCOUNT KEYBOARD PARENT STACKVIEW
    //----------------------------------------------------------------
    
    func makeInternalAccountKeyBoardParentStackView(){
        
        let pStackView = Controls().theParentStackView(buttons: [makeInternalAccountRowOneStackView(), makeInternalAccountRowTwoStackView(), makeInternalAccountRowThreeStackView(), makeInternalAccountRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 6
        InternalTransferAccountKeyboardContainer.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: InternalTransferAccountKeyboardContainer.leftAnchor).isActive = true
        pStackView.rightAnchor.constraint(equalTo: InternalTransferAccountKeyboardContainer.rightAnchor).isActive = true
        pStackView.topAnchor.constraint(equalTo: InternalTransferAccountKeyboardContainer.topAnchor).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: InternalTransferAccountKeyboardContainer.bottomAnchor).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET UP ZIPIT AMOUNT VIEW CONSTRAINTS
    //----------------------------------------------------------------
    
    func  setInternalAccountViewConstraints(){
        
        InternalTransferAccountView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        InternalTransferAccountView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        InternalTransferAccountView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        InternalTransferAccountView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    
    
    
    
    
    
    
    
    
}

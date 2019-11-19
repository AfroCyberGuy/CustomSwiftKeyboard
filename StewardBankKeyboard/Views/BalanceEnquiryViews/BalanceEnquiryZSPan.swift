//
//  BalanceEnquiryZSPan.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/16/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit

extension KeyboardViewController {
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZIMSWITCH  MAIN PAN VIEW
    //----------------------------------------------------------------
    
    func makeBalanceEnquiryZSPanView(){
        
        balanceEnquiryZSView.backgroundColor = Theme.LighterGray
        balanceEnquiryZSView.layer.cornerRadius = 0
        view.addSubview(balanceEnquiryZSView)
        setupBalanceEnquiryZSZimSwitchPanConstraints()
        makebalanceEnquiryZSPanTopContainer()
        makeBalanceEnquiryZSZSPanKeyboardViewContainer()
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZIMSWITCH  PAN VIEW TOP CONTAINER
    //----------------------------------------------------------------
    
    func makebalanceEnquiryZSPanTopContainer(){
        
        balanceEnquiryZSTopContainer.backgroundColor = Theme.LighterGray
        balanceEnquiryZSTopContainer.layer.cornerRadius = 0
        balanceEnquiryZSView.addSubview(balanceEnquiryZSTopContainer)
        
        balanceEnquiryZSTopContainer.topAnchor.constraint(equalTo: balanceEnquiryZSView.topAnchor).isActive = true
        balanceEnquiryZSTopContainer.leftAnchor.constraint(equalTo: balanceEnquiryZSView.leftAnchor).isActive = true
        balanceEnquiryZSTopContainer.rightAnchor.constraint(equalTo: balanceEnquiryZSView.rightAnchor).isActive = true
        balanceEnquiryZSTopContainer.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        
        makebalanceEnquiryZSPanTopContainerLabel()
        makebalanceEnquiryZSPanViewBackButton()
        makeBalanceEnquiryZSPanViewRightButton()
        makeBalanceEnquiryZSPanTopContainerTextField()
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZIMSWITCH  PAN TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makebalanceEnquiryZSPanTopContainerLabel(){
        
        balanceEnquiryZSTopContainer.addSubview(balanceEnquiryZSTopContainerLabel)
        balanceEnquiryZSTopContainerLabel.textAlignment = .center
        
        balanceEnquiryZSTopContainerLabel.topAnchor.constraint(equalTo: balanceEnquiryZSTopContainer.topAnchor, constant: 3).isActive = true
        balanceEnquiryZSTopContainerLabel.leftAnchor.constraint(equalTo: balanceEnquiryZSTopContainer.leftAnchor, constant: 3).isActive = true
        balanceEnquiryZSTopContainerLabel.rightAnchor.constraint(equalTo: balanceEnquiryZSTopContainer.rightAnchor, constant: 3).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZIMSWITCH PAN BACK BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makebalanceEnquiryZSPanViewBackButton(){
        
        balanceEnquiryZSBackBtn.layer.cornerRadius = 15
        balanceEnquiryZSTopContainer.addSubview(balanceEnquiryZSBackBtn)
        
        
        balanceEnquiryZSBackBtn.addTarget(self, action: #selector(balanceEnquiryZSPanBackButtonPressed), for: .touchUpInside)
        
        balanceEnquiryZSBackBtn.topAnchor.constraint(equalTo: balanceEnquiryZSTopContainerLabel.bottomAnchor, constant: 2).isActive = true
        balanceEnquiryZSBackBtn.leftAnchor.constraint(equalTo: balanceEnquiryZSTopContainer.leftAnchor, constant: 8).isActive = true
        balanceEnquiryZSBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        balanceEnquiryZSBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BALANCE ENQUIRY ZIMSWITCH PAN BACK BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func balanceEnquiryZSPanBackButtonPressed(){
        
        balanceEnquiryZSView.removeFromSuperview()
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZIMSWITCH PAN VIEW RIGHT BUTTON VIEW
    //----------------------------------------------------------------
    
    func makeBalanceEnquiryZSPanViewRightButton(){
        
        balanceEnquiryZSRightBtn.layer.cornerRadius = 15
        balanceEnquiryZSTopContainer.addSubview(balanceEnquiryZSRightBtn)
        
        
        balanceEnquiryZSRightBtn.addTarget(self, action: #selector(balanceEnquiryZSPanRightBtnPressed), for: .touchUpInside)
        
        balanceEnquiryZSRightBtn.topAnchor.constraint(equalTo: balanceEnquiryZSTopContainerLabel.bottomAnchor, constant: 2).isActive = true
        balanceEnquiryZSRightBtn.rightAnchor.constraint(equalTo: balanceEnquiryZSTopContainer.rightAnchor, constant: -8).isActive = true
        balanceEnquiryZSRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        balanceEnquiryZSRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT PAN RIGHT BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func balanceEnquiryZSPanRightBtnPressed(){

        ZIMSWITCH_BALANCE_CARD_NUMBER = balanceEnquiryZSTextField.text!
        makebalanceEquiryZSPinView()
        
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZIMSWITCH PAN TOP CONTAINER TEXT FIELD
    //----------------------------------------------------------------
    
    func makeBalanceEnquiryZSPanTopContainerTextField(){
        
        balanceEnquiryZSTopContainer.addSubview(balanceEnquiryZSTextField)
        balanceEnquiryZSTextField.textAlignment = .center
        balanceEnquiryZSTextField.backgroundColor = UIColor.white
        balanceEnquiryZSTextField.layer.cornerRadius = 5
        balanceEnquiryZSTextField.layer.masksToBounds = true
        balanceEnquiryZSTextField.textColor = UIColor.gray
        
        balanceEnquiryZSTextField.centerYAnchor.constraint(equalTo: balanceEnquiryZSBackBtn.centerYAnchor).isActive = true
        balanceEnquiryZSTextField.leftAnchor.constraint(equalTo: balanceEnquiryZSBackBtn.rightAnchor, constant: 30).isActive = true
        balanceEnquiryZSTextField.rightAnchor.constraint(equalTo: balanceEnquiryZSRightBtn.leftAnchor, constant: -30).isActive = true
        balanceEnquiryZSTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZIMSWITCH PAN VIEW KEYBOARD CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeBalanceEnquiryZSZSPanKeyboardViewContainer(){
        
        balanceEnquiryZSKeyboardContainer.backgroundColor = UIColor.lightGray
        balanceEnquiryZSKeyboardContainer.layer.cornerRadius = 0
        balanceEnquiryZSView.addSubview(balanceEnquiryZSKeyboardContainer)
        
        balanceEnquiryZSKeyboardContainer.topAnchor.constraint(equalTo: balanceEnquiryZSTopContainer.bottomAnchor, constant: 5).isActive = true
        balanceEnquiryZSKeyboardContainer.leftAnchor.constraint(equalTo: balanceEnquiryZSView.leftAnchor, constant: 5).isActive = true
        balanceEnquiryZSKeyboardContainer.rightAnchor.constraint(equalTo: balanceEnquiryZSView.rightAnchor, constant: -5).isActive = true
        balanceEnquiryZSKeyboardContainer.bottomAnchor.constraint(equalTo: balanceEnquiryZSView.bottomAnchor, constant: -5).isActive = true
        
        makeBalancePanKeyBoardParentStackView()
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZIMSWITCH PAN VIEW KEYBOARD ROW ONE STACKVIEW
    //----------------------------------------------------------------
    
    func makeBalanceEnquiryZSPanRowOneStackView() -> UIStackView {
        
        balanceEnquiryZSOneButton.layer.cornerRadius = 3
        balanceEnquiryZSOneButton.backgroundColor = UIColor.white
        balanceEnquiryZSOneButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquiryZSTwoButton.layer.cornerRadius = 3
        balanceEnquiryZSTwoButton.backgroundColor = UIColor.white
        balanceEnquiryZSTwoButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquiryZSThreeButton.layer.cornerRadius = 3
        balanceEnquiryZSThreeButton.backgroundColor = UIColor.white
        balanceEnquiryZSThreeButton.setTitleColor(UIColor.black, for: .normal)
        
        balanceEnquiryZSOneButton.addTarget(self, action: #selector(balanceEnquiryZSOneButtonPressed), for: .touchUpInside)
        balanceEnquiryZSTwoButton.addTarget(self, action: #selector(balanceEnquiryZSTwoButtonPressed), for: .touchUpInside)
        balanceEnquiryZSThreeButton.addTarget(self, action: #selector(balanceEnquiryZSThreeButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [balanceEnquiryZSOneButton, balanceEnquiryZSTwoButton, balanceEnquiryZSThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
        
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:-  BALANCE ENQUIRY ZIMSWITCH PAN ROW ONE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func balanceEnquiryZSOneButtonPressed(){
        
        numpadBtnPressed(button: balanceEnquiryZSOneButton, label: balanceEnquiryZSTextField)
        
    }
    
    @objc func balanceEnquiryZSTwoButtonPressed(){
        
        numpadBtnPressed(button: balanceEnquiryZSTwoButton, label: balanceEnquiryZSTextField)
        
    }
    
    @objc func balanceEnquiryZSThreeButtonPressed(){
        
        numpadBtnPressed(button: balanceEnquiryZSThreeButton, label: balanceEnquiryZSTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZIMSWITCH PAN VIEW KEYBOARD ROW TWO STACKVIEW
    //----------------------------------------------------------------
    
    func makeBalanceEnquiryZSPanRowTwoStackView() -> UIStackView {
        
        balanceEnquiryZSFourButton.layer.cornerRadius = 3
        balanceEnquiryZSFourButton.backgroundColor = UIColor.white
        balanceEnquiryZSFourButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquiryZSFiveButton.layer.cornerRadius = 3
        balanceEnquiryZSFiveButton.backgroundColor = UIColor.white
        balanceEnquiryZSFiveButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquiryZSSixButton.layer.cornerRadius = 3
        balanceEnquiryZSSixButton.backgroundColor = UIColor.white
        balanceEnquiryZSSixButton.setTitleColor(UIColor.black, for: .normal)
        
        balanceEnquiryZSFourButton.addTarget(self, action: #selector(balanceEnquiryZSFourButtonPressed), for: .touchUpInside)
        balanceEnquiryZSFiveButton.addTarget(self, action: #selector(balanceEnquiryZSFiveButtonPressed), for: .touchUpInside)
        balanceEnquiryZSSixButton.addTarget(self, action: #selector(balanceEnquiryZSSixButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [balanceEnquiryZSFourButton, balanceEnquiryZSFiveButton, balanceEnquiryZSSixButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------------
    // MARK:-
    // MARK:-  BALANCE ENQUIRY ZIMSWITCH PAN ROW TWO BUTTON ACTION METHODS
    //----------------------------------------------------------------------
    
    @objc func balanceEnquiryZSFourButtonPressed(){
        
        numpadBtnPressed(button: balanceEnquiryZSFourButton, label: balanceEnquiryZSTextField)
        
    }
    
    @objc func balanceEnquiryZSFiveButtonPressed(){
        
        numpadBtnPressed(button: balanceEnquiryZSFiveButton, label: balanceEnquiryZSTextField)
        
    }
    
    @objc func balanceEnquiryZSSixButtonPressed(){
        
        numpadBtnPressed(button: balanceEnquiryZSSixButton, label: balanceEnquiryZSTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZIMSWITCH PAN VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makeBalanceEnquiryZSPanRowThreeStackView() -> UIStackView {
        
        balanceEnquiryZSSevenButton.layer.cornerRadius = 3
        balanceEnquiryZSSevenButton.backgroundColor = UIColor.white
        balanceEnquiryZSSevenButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquiryZSEightButton.layer.cornerRadius = 3
        balanceEnquiryZSEightButton.backgroundColor = UIColor.white
        balanceEnquiryZSEightButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquiryZSNineButton.layer.cornerRadius = 3
        balanceEnquiryZSNineButton.backgroundColor = UIColor.white
        balanceEnquiryZSNineButton.setTitleColor(UIColor.black, for: .normal)
        
        balanceEnquiryZSSevenButton.addTarget(self, action: #selector(balanceEnquiryZSSevenButtonPressed), for: .touchUpInside)
        balanceEnquiryZSEightButton.addTarget(self, action: #selector(balanceEnquiryZSEightButtonPressed), for: .touchUpInside)
        balanceEnquiryZSNineButton.addTarget(self, action: #selector(balanceEnquiryZSNineButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [balanceEnquiryZSSevenButton, balanceEnquiryZSEightButton, balanceEnquiryZSNineButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------------
    // MARK:-
    // MARK:-  BALANCE ENQUIRY ZIMSWITCH PAN ROW THREE BUTTON ACTION METHODS
    //----------------------------------------------------------------------
    
    @objc func balanceEnquiryZSSevenButtonPressed(){
        
        numpadBtnPressed(button: balanceEnquiryZSSevenButton, label: balanceEnquiryZSTextField)
        
    }
    
    @objc func balanceEnquiryZSEightButtonPressed(){
        
        numpadBtnPressed(button: balanceEnquiryZSEightButton, label: balanceEnquiryZSTextField)
        
    }
    
    @objc func balanceEnquiryZSNineButtonPressed(){
        
        numpadBtnPressed(button: balanceEnquiryZSNineButton, label: balanceEnquiryZSTextField)
        
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZIMSWITCH PAN VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makeBalanceEnquiryZSPanRowFourStackView() -> UIStackView {
        
        balanceEnquiryZSZeroButton.layer.cornerRadius = 3
        balanceEnquiryZSZeroButton.backgroundColor = UIColor.white
        balanceEnquiryZSZeroButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquiryZSDecimalButton.layer.cornerRadius = 3
        balanceEnquiryZSDecimalButton.backgroundColor = UIColor.white
        balanceEnquiryZSDecimalButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquiryZSDeleteButton.layer.cornerRadius = 3
        balanceEnquiryZSDeleteButton.backgroundColor = UIColor.white
        balanceEnquiryZSDeleteButton.setTitleColor(UIColor.black, for: .normal)
        
        balanceEnquiryZSZeroButton.addTarget(self, action: #selector(balanceEnquiryZSZeroButtonPressed), for: .touchUpInside)
        balanceEnquiryZSDecimalButton.addTarget(self, action: #selector(balanceEnquiryZSDecimalButtonPressed), for: .touchUpInside)
        balanceEnquiryZSDeleteButton.addTarget(self, action: #selector(balanceEnquiryZSDeleteButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [balanceEnquiryZSZeroButton, balanceEnquiryZSDecimalButton, balanceEnquiryZSDeleteButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------------
    // MARK:-
    // MARK:-  BALANCE ENQUIRY ZIMSWITCH PAN ROW FOUR BUTTON ACTION METHODS
    //----------------------------------------------------------------------
    
    @objc func balanceEnquiryZSZeroButtonPressed(){
        
        numpadBtnPressed(button: balanceEnquiryZSZeroButton, label: balanceEnquiryZSTextField)
        
    }
    
    @objc func balanceEnquiryZSDecimalButtonPressed(){
        
        numpadBtnPressed(button: balanceEnquiryZSDecimalButton, label: balanceEnquiryZSTextField)
        
    }
    
    @objc func balanceEnquiryZSDeleteButtonPressed(){
        
         numpadClearBtnPressed(button: balanceEnquiryZSDeleteButton, label: balanceEnquiryZSTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZIMSWITCH PAN KEYBOARD PARENT STACKVIEW
    //----------------------------------------------------------------
    
    func makeBalancePanKeyBoardParentStackView(){
        
        let pStackView = Controls().theParentStackView(buttons: [makeBalanceEnquiryZSPanRowOneStackView(), makeBalanceEnquiryZSPanRowTwoStackView(), makeBalanceEnquiryZSPanRowThreeStackView(), makeBalanceEnquiryZSPanRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 1
        balanceEnquiryZSView.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: balanceEnquiryZSKeyboardContainer.leftAnchor).isActive = true
        pStackView.rightAnchor.constraint(equalTo: balanceEnquiryZSKeyboardContainer.rightAnchor).isActive = true
        pStackView.topAnchor.constraint(equalTo: balanceEnquiryZSKeyboardContainer.topAnchor).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: balanceEnquiryZSKeyboardContainer.bottomAnchor).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET BALANCE ENQUIRY ZIMSWITCH PAN VIEW PAN VIEW CONSTRAINTS
    //----------------------------------------------------------------
    
    func setupBalanceEnquiryZSZimSwitchPanConstraints(){
        
        balanceEnquiryZSView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        balanceEnquiryZSView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        balanceEnquiryZSView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        balanceEnquiryZSView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    
    
}

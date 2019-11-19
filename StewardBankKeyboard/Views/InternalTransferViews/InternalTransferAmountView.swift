//
//  InternalTransferAmountView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/18/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit

extension KeyboardViewController {
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL AMOUNT VIEW
    //----------------------------------------------------------------
    
    func makeInternalAmountView(){
        
        InternalAmountView.backgroundColor = Theme.LighterGray
        InternalAmountView.layer.cornerRadius = 0
        view.addSubview(InternalAmountView)
        setInternalAmountViewConstraints()
        makeInternalTopContainer()
        makeInternalAmountKeyboardViewContainer()
      
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL AMOUNT VIEW TOP CONTAINER
    //----------------------------------------------------------------
    
    func makeInternalTopContainer(){
        
        InternalAmountTopContainer.backgroundColor = Theme.LighterGray
        InternalAmountTopContainer.layer.cornerRadius = 0
        InternalAmountView.addSubview(InternalAmountTopContainer)
        
        InternalAmountTopContainer.topAnchor.constraint(equalTo: InternalAmountView.topAnchor).isActive = true
        InternalAmountTopContainer.leftAnchor.constraint(equalTo: InternalAmountView.leftAnchor).isActive = true
        InternalAmountTopContainer.rightAnchor.constraint(equalTo: InternalAmountView.rightAnchor).isActive = true
        InternalAmountTopContainer.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        makeInternalTopContainerLabel()
        makeInternalAmountViewBackButton()
        makeInternalAmountViewRightButton()
        makeInternalAmountTopContainerTextField()

        
    }
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL AMOUNT TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeInternalTopContainerLabel(){
        
        InternalAmountTopContainer.addSubview(InternalAmountTopContainerLabel)
        InternalAmountTopContainerLabel.textAlignment = .center
        
        InternalAmountTopContainerLabel.topAnchor.constraint(equalTo: InternalAmountTopContainer.topAnchor, constant: 3).isActive = true
        InternalAmountTopContainerLabel.leftAnchor.constraint(equalTo: InternalAmountTopContainer.leftAnchor, constant: 3).isActive = true
        InternalAmountTopContainerLabel.rightAnchor.constraint(equalTo: InternalAmountTopContainer.rightAnchor, constant: 3).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL AMOUNT VIEW BACK BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeInternalAmountViewBackButton(){
        
        InternalAmountBackBtn.layer.cornerRadius = 15
        InternalAmountTopContainer.addSubview(InternalAmountBackBtn)
        
        
        InternalAmountBackBtn.addTarget(self, action: #selector(InternalAmountBackBtnPressed), for: .touchUpInside)
        
        InternalAmountBackBtn.topAnchor.constraint(equalTo: InternalAmountTopContainerLabel.bottomAnchor, constant: 2).isActive = true
        InternalAmountBackBtn.leftAnchor.constraint(equalTo: InternalAmountTopContainer.leftAnchor, constant: 8).isActive = true
        InternalAmountBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        InternalAmountBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL AMOUNT BACK BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func InternalAmountBackBtnPressed(){
        
        InternalAmountView.removeFromSuperview()
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL AMOUNT VIEW RIGHT BUTTON VIEW
    //----------------------------------------------------------------
    
    func makeInternalAmountViewRightButton(){
        
        InternalAmountRightBtn.layer.cornerRadius = 15
        InternalAmountTopContainer.addSubview(InternalAmountRightBtn)
        //      airtimeAmountViewRightButtonPressed()
        
        InternalAmountRightBtn.addTarget(self, action: #selector(InternalAmountRightBtnPressed), for: .touchUpInside)
        
        InternalAmountRightBtn.topAnchor.constraint(equalTo: InternalAmountTopContainerLabel.bottomAnchor, constant: 2).isActive = true
        InternalAmountRightBtn.rightAnchor.constraint(equalTo: InternalAmountTopContainer.rightAnchor, constant: -8).isActive = true
        InternalAmountRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        InternalAmountRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL AMOUNT RIGHT BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func InternalAmountRightBtnPressed(){
        
        if InternalAmountTextField.text?.isEmpty ?? true {
            
            showValidationView(message: "Please enter amount")
            
        }else {
            
            INTERNAL_TRANSFER_AMOUNT = InternalAmountTextField.text!
            
            makeInternalTransferPinView()
        }
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL AMOUNT TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeInternalAmountTopContainerTextField(){
        
        InternalAmountTopContainer.addSubview(InternalAmountTextField)
        InternalAmountTextField.textAlignment = .center
        InternalAmountTextField.backgroundColor = UIColor.white
        InternalAmountTextField.layer.cornerRadius = 5
        InternalAmountTextField.layer.masksToBounds = true
        InternalAmountTextField.textColor = UIColor.gray
        
        InternalAmountTextField.centerYAnchor.constraint(equalTo: InternalAmountBackBtn.centerYAnchor).isActive = true
        InternalAmountTextField.leftAnchor.constraint(equalTo: InternalAmountBackBtn.rightAnchor, constant: 30).isActive = true
        InternalAmountTextField.rightAnchor.constraint(equalTo: InternalAmountRightBtn.leftAnchor, constant: -30).isActive = true
        InternalAmountTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL AMOUNT VIEW KEYBOARD CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeInternalAmountKeyboardViewContainer(){
        
        InternalAmountKeyboardContainer.backgroundColor = UIColor.clear
        InternalAmountKeyboardContainer.layer.cornerRadius = 0
        InternalAmountView.addSubview(InternalAmountKeyboardContainer)
        
        InternalAmountKeyboardContainer.topAnchor.constraint(equalTo: InternalAmountTopContainer.bottomAnchor, constant: 5).isActive = true
        InternalAmountKeyboardContainer.leftAnchor.constraint(equalTo: InternalAmountView.leftAnchor, constant: 5).isActive = true
        InternalAmountKeyboardContainer.rightAnchor.constraint(equalTo: InternalAmountView.rightAnchor, constant: -5).isActive = true
        InternalAmountKeyboardContainer.bottomAnchor.constraint(equalTo: InternalAmountView.bottomAnchor, constant: -5).isActive = true
        
        makeInternalAmountParentStackView()
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL AMOUNT VIEW KEYBOARD ROW ONE STACKVIEW
    //----------------------------------------------------------------
    
    func makeInternalAmountRowOneStackView() -> UIStackView {
        
        InternalAmountOneButton.layer.cornerRadius = 3
        InternalAmountOneButton.backgroundColor = UIColor.white
        InternalAmountOneButton.setTitleColor(UIColor.black, for: .normal)
        InternalAmountTwoButton.layer.cornerRadius = 3
        InternalAmountTwoButton.backgroundColor = UIColor.white
        InternalAmountTwoButton.setTitleColor(UIColor.black, for: .normal)
        InternalAmountThreeButton.layer.cornerRadius = 3
        InternalAmountThreeButton.backgroundColor = UIColor.white
        InternalAmountThreeButton.setTitleColor(UIColor.black, for: .normal)
        
        InternalAmountOneButton.addTarget(self, action: #selector(InternalAmountOneButtonPressed), for: .touchUpInside)
        InternalAmountTwoButton.addTarget(self, action: #selector(InternalAmountTwoButtonPressed), for: .touchUpInside)
        InternalAmountThreeButton.addTarget(self, action: #selector(InternalAmountThreeButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [InternalAmountOneButton, InternalAmountTwoButton, InternalAmountThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL AMOUNT ROW ONE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func InternalAmountOneButtonPressed(){
        
        numpadBtnPressed(button: InternalAmountOneButton, label: InternalAmountTextField)
        
    }
    
    @objc func InternalAmountTwoButtonPressed(){
        
        numpadBtnPressed(button: InternalAmountTwoButton, label: InternalAmountTextField)
        
    }
    
    @objc func InternalAmountThreeButtonPressed(){
        
        numpadBtnPressed(button: InternalAmountThreeButton, label: InternalAmountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL AMOUNT VIEW KEYBOARD ROW TWO STACKVIEW
    //----------------------------------------------------------------
    
    func makeInternalAmountRowTwoStackView() -> UIStackView {
        
        InternalAmountFourButton.layer.cornerRadius = 3
        InternalAmountFourButton.backgroundColor = UIColor.white
        InternalAmountFourButton.setTitleColor(UIColor.black, for: .normal)
        InternalAmountFiveButton.layer.cornerRadius = 3
        InternalAmountFiveButton.backgroundColor = UIColor.white
        InternalAmountFiveButton.setTitleColor(UIColor.black, for: .normal)
        InternalAmountSixButton.layer.cornerRadius = 3
        InternalAmountSixButton.backgroundColor = UIColor.white
        InternalAmountSixButton.setTitleColor(UIColor.black, for: .normal)
        
        InternalAmountFourButton.addTarget(self, action: #selector(InternalAmountFourButtonPressed), for: .touchUpInside)
        InternalAmountFiveButton.addTarget(self, action: #selector(InternalAmountFiveButtonPressed), for: .touchUpInside)
        InternalAmountSixButton.addTarget(self, action: #selector(InternalAmountSixButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [InternalAmountFourButton, InternalAmountFiveButton, InternalAmountSixButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL AMOUNT ROW TWO BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func InternalAmountFourButtonPressed(){
        
        numpadBtnPressed(button: InternalAmountFourButton, label: InternalAmountTextField)
        
    }
    
    @objc func InternalAmountFiveButtonPressed(){
        
        numpadBtnPressed(button: InternalAmountFiveButton, label: InternalAmountTextField)
        
    }
    
    @objc func InternalAmountSixButtonPressed(){
        
        numpadBtnPressed(button: InternalAmountSixButton, label: InternalAmountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL AMOUNT VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makeInternalAmountRowThreeStackView() -> UIStackView {
        
        InternalAmountSevenButton.layer.cornerRadius = 3
        InternalAmountSevenButton.backgroundColor = UIColor.white
        InternalAmountSevenButton.setTitleColor(UIColor.black, for: .normal)
        InternalAmountEightButton.layer.cornerRadius = 3
        InternalAmountEightButton.backgroundColor = UIColor.white
        InternalAmountEightButton.setTitleColor(UIColor.black, for: .normal)
        InternalAmountNineButton.layer.cornerRadius = 3
        InternalAmountNineButton.backgroundColor = UIColor.white
        InternalAmountNineButton.setTitleColor(UIColor.black, for: .normal)
        
        InternalAmountSevenButton.addTarget(self, action: #selector(InternalAmountSevenButtonPressed), for: .touchUpInside)
        InternalAmountEightButton.addTarget(self, action: #selector(InternalAmountEightButtonPressed), for: .touchUpInside)
        InternalAmountNineButton.addTarget(self, action: #selector(InternalAmountNineButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [InternalAmountSevenButton, InternalAmountEightButton, InternalAmountNineButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL AMOUNT ROW THREE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func InternalAmountSevenButtonPressed(){
        
        numpadBtnPressed(button: InternalAmountSevenButton, label: InternalAmountTextField)
        
    }
    
    @objc func InternalAmountEightButtonPressed(){
        
        numpadBtnPressed(button: InternalAmountEightButton, label: InternalAmountTextField)
        
    }
    
    @objc func InternalAmountNineButtonPressed(){
        
        numpadBtnPressed(button: InternalAmountNineButton, label: InternalAmountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:-  MAKE INTERNAL AMOUNT VIEW KEYBOARD ROW FOUR STACKVIEW
    //----------------------------------------------------------------
    
    func makeInternalAmountRowFourStackView() -> UIStackView {
        
        InternalAmountZeroButton.layer.cornerRadius = 3
        InternalAmountZeroButton.backgroundColor = UIColor.white
        InternalAmountZeroButton.setTitleColor(UIColor.black, for: .normal)
        InternalAmountDecimalButton.layer.cornerRadius = 3
        InternalAmountDecimalButton.backgroundColor = UIColor.white
        InternalAmountDecimalButton.setTitleColor(UIColor.black, for: .normal)
        InternalAmountDeleteButton.layer.cornerRadius = 3
        InternalAmountDeleteButton.backgroundColor = UIColor.white
        InternalAmountDeleteButton.setTitleColor(UIColor.black, for: .normal)
        
        InternalAmountZeroButton.addTarget(self, action: #selector(InternalAmountZeroButtonPressed), for: .touchUpInside)
        InternalAmountDecimalButton.addTarget(self, action: #selector(InternalAmountDecimalButtonPressed), for: .touchUpInside)
        InternalAmountDeleteButton.addTarget(self, action: #selector(InternalAmountDeleteButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [InternalAmountZeroButton, InternalAmountDecimalButton, InternalAmountDeleteButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL AMOUNT ROW FOUR BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func InternalAmountZeroButtonPressed(){
        
        numpadBtnPressed(button: InternalAmountZeroButton, label: InternalAmountTextField)
        
    }
    
    @objc func InternalAmountDecimalButtonPressed(){
        
        numpadBtnPressed(button: InternalAmountDecimalButton, label: InternalAmountTextField)
        
    }
    
    @objc func InternalAmountDeleteButtonPressed(){
        
        numpadClearBtnPressed(button: InternalAmountDeleteButton, label: InternalAmountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL AMOUNT KEYBOARD PARENT STACKVIEW
    //----------------------------------------------------------------
    
    func makeInternalAmountParentStackView(){
        
        let pStackView = Controls().theParentStackView(buttons: [makeInternalAmountRowOneStackView(), makeInternalAmountRowTwoStackView(), makeInternalAmountRowThreeStackView(), makeInternalAmountRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 6
        InternalAmountKeyboardContainer.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: InternalAmountKeyboardContainer.leftAnchor).isActive = true
        pStackView.rightAnchor.constraint(equalTo: InternalAmountKeyboardContainer.rightAnchor).isActive = true
        pStackView.topAnchor.constraint(equalTo: InternalAmountKeyboardContainer.topAnchor).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: InternalAmountKeyboardContainer.bottomAnchor).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET UP INTERNAL AMOUNT VIEW CONSTRAINTS
    //----------------------------------------------------------------
    
    func  setInternalAmountViewConstraints(){
        
        InternalAmountView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        InternalAmountView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        InternalAmountView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        InternalAmountView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    
    
}

//
//  ZIPITAmountView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/7/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit

extension KeyboardViewController{
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT AMOUNT VIEW
    //----------------------------------------------------------------
    
    func makeZIPITAmountView(){
        
        ZIPITAmountView.backgroundColor = Theme.LighterGray
        ZIPITAmountView.layer.cornerRadius = 0
        view.addSubview(ZIPITAmountView)
        setZIPITAmountViewConstraints()
        makeZIPITAmountViewTopContainer()
        makeZIPITAmountKeyboardViewContainer()
//        makeZIPITAmountKeyboardViewContainer()
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT AMOUNT VIEW TOP CONTAINER
    //----------------------------------------------------------------
    
    func makeZIPITAmountViewTopContainer(){
        
        ZIPITAmountTopContainer.backgroundColor = Theme.LighterGray
        ZIPITAmountTopContainer.layer.cornerRadius = 0
        ZIPITAmountView.addSubview(ZIPITAmountTopContainer)
        
        ZIPITAmountTopContainer.topAnchor.constraint(equalTo: ZIPITAmountView.topAnchor).isActive = true
        ZIPITAmountTopContainer.leftAnchor.constraint(equalTo: ZIPITAmountView.leftAnchor).isActive = true
        ZIPITAmountTopContainer.rightAnchor.constraint(equalTo: ZIPITAmountView.rightAnchor).isActive = true
        ZIPITAmountTopContainer.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        makeZIPITTopContainerLabel()
        makeZIPITAmountViewBackButton()
        makeZIPITAmountViewRightButton()
        makeZIPITAmountTopContainerTextField()
        
        
    }
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT AMOUNT TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeZIPITTopContainerLabel(){
        
        ZIPITAmountTopContainer.addSubview(ZIPITAmountTopContainerLabel)
        ZIPITAmountTopContainerLabel.textAlignment = .center
        
        ZIPITAmountTopContainerLabel.topAnchor.constraint(equalTo: ZIPITAmountTopContainer.topAnchor, constant: 3).isActive = true
        ZIPITAmountTopContainerLabel.leftAnchor.constraint(equalTo: ZIPITAmountTopContainer.leftAnchor, constant: 3).isActive = true
        ZIPITAmountTopContainerLabel.rightAnchor.constraint(equalTo: ZIPITAmountTopContainer.rightAnchor, constant: 3).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT PAYMENT AMOUNT VIEW BACK BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeZIPITAmountViewBackButton(){
        
        ZIPITAmountBackBtn.layer.cornerRadius = 15
        ZIPITAmountTopContainer.addSubview(ZIPITAmountBackBtn)
        
        
        ZIPITAmountBackBtn.addTarget(self, action: #selector(ZIPITAmountBackBtnPressed), for: .touchUpInside)
        
        ZIPITAmountBackBtn.topAnchor.constraint(equalTo: ZIPITAmountTopContainerLabel.bottomAnchor, constant: 2).isActive = true
        ZIPITAmountBackBtn.leftAnchor.constraint(equalTo: ZIPITAmountTopContainer.leftAnchor, constant: 8).isActive = true
        ZIPITAmountBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        ZIPITAmountBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT AMOUNT BACK BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func ZIPITAmountBackBtnPressed(){
        
        ZIPITAmountView.removeFromSuperview()
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT AMOUNT VIEW RIGHT BUTTON VIEW
    //----------------------------------------------------------------
    
    func makeZIPITAmountViewRightButton(){
        
        ZIPITAmountRightBtn.layer.cornerRadius = 15
        ZIPITAmountTopContainer.addSubview(ZIPITAmountRightBtn)
        //      airtimeAmountViewRightButtonPressed()
        
        ZIPITAmountRightBtn.addTarget(self, action: #selector(ZIPITAmountRightBtnPressed), for: .touchUpInside)
        
        ZIPITAmountRightBtn.topAnchor.constraint(equalTo: ZIPITAmountTopContainerLabel.bottomAnchor, constant: 2).isActive = true
        ZIPITAmountRightBtn.rightAnchor.constraint(equalTo: ZIPITAmountTopContainer.rightAnchor, constant: -8).isActive = true
        ZIPITAmountRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        ZIPITAmountRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT AMOUNT RIGHT BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func ZIPITAmountRightBtnPressed(){
        
        
        if ZIPITAmountTextField.text?.isEmpty ?? true {
            
            showValidationView(message: "Please enter amount.")
            
        }else {
            
            ZIPIT_AMOUNT = ZIPITAmountTextField.text!
            
            KeyboardSharedPreferences().setZIPITAmount(amount: ZIPITAmountTextField.text!)
            
            print("ZIPIT_AMOUNT: \(ZIPITAmountTextField.text!)")
            
            makeZIPITPaymentsOptionsView()
            
        }
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT AMOUNT TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeZIPITAmountTopContainerTextField(){
        
        ZIPITAmountTopContainer.addSubview(ZIPITAmountTextField)
        ZIPITAmountTextField.textAlignment = .center
        ZIPITAmountTextField.backgroundColor = UIColor.white
        ZIPITAmountTextField.layer.cornerRadius = 5
        ZIPITAmountTextField.layer.masksToBounds = true
        ZIPITAmountTextField.textColor = UIColor.gray
        
        ZIPITAmountTextField.centerYAnchor.constraint(equalTo: ZIPITAmountBackBtn.centerYAnchor).isActive = true
        ZIPITAmountTextField.leftAnchor.constraint(equalTo: ZIPITAmountBackBtn.rightAnchor, constant: 30).isActive = true
        ZIPITAmountTextField.rightAnchor.constraint(equalTo: ZIPITAmountRightBtn.leftAnchor, constant: -30).isActive = true
        ZIPITAmountTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT AMOUNT VIEW KEYBOARD CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeZIPITAmountKeyboardViewContainer(){
        
        ZIPITAmountKeyboardContainer.backgroundColor = Theme.LighterGray
        ZIPITAmountKeyboardContainer.layer.cornerRadius = 0
        ZIPITAmountView.addSubview(ZIPITAmountKeyboardContainer)
        
        ZIPITAmountKeyboardContainer.topAnchor.constraint(equalTo: ZIPITAmountTopContainer.bottomAnchor, constant: 6).isActive = true
        ZIPITAmountKeyboardContainer.leftAnchor.constraint(equalTo: ZIPITAmountView.leftAnchor, constant: 6).isActive = true
        ZIPITAmountKeyboardContainer.rightAnchor.constraint(equalTo: ZIPITAmountView.rightAnchor, constant: -6).isActive = true
        ZIPITAmountKeyboardContainer.bottomAnchor.constraint(equalTo: ZIPITAmountView.bottomAnchor, constant: -6).isActive = true
        
        makeZIPITAmountKeyBoardParentStackView()
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT AMOUNT VIEW KEYBOARD ROW ONE STACKVIEW
    //----------------------------------------------------------------
    
    func makeZIPITAmountRowOneStackView() -> UIStackView {
        
        ZIPITAmountOneButton.layer.cornerRadius = 3
        ZIPITAmountOneButton.backgroundColor = UIColor.white
        ZIPITAmountOneButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITAmountTwoButton.layer.cornerRadius = 3
        ZIPITAmountTwoButton.backgroundColor = UIColor.white
        ZIPITAmountTwoButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITAmountThreeButton.layer.cornerRadius = 3
        ZIPITAmountThreeButton.backgroundColor = UIColor.white
        ZIPITAmountThreeButton.setTitleColor(UIColor.black, for: .normal)
        
        ZIPITAmountOneButton.addTarget(self, action: #selector(ZIPITAmountOneButtonPressed), for: .touchUpInside)
        ZIPITAmountTwoButton.addTarget(self, action: #selector(ZIPITAmountTwoButtonPressed), for: .touchUpInside)
        ZIPITAmountThreeButton.addTarget(self, action: #selector(ZIPITAmountThreeButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [ZIPITAmountOneButton, ZIPITAmountTwoButton, ZIPITAmountThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT AMOUNT ROW ONE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func ZIPITAmountOneButtonPressed(){
        
        numpadBtnPressed(button: ZIPITAmountOneButton, label: ZIPITAmountTextField)
        
    }
    
    @objc func ZIPITAmountTwoButtonPressed(){
        
        numpadBtnPressed(button: ZIPITAmountTwoButton, label: ZIPITAmountTextField)
        
    }
    
    @objc func ZIPITAmountThreeButtonPressed(){
        
        numpadBtnPressed(button: ZIPITAmountThreeButton, label: ZIPITAmountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT AMOUNT VIEW KEYBOARD ROW TWO STACKVIEW
    //----------------------------------------------------------------
    
    func makeZIPITAmountRowTwoStackView() -> UIStackView {
        
        ZIPITAmountFourButton.layer.cornerRadius = 3
        ZIPITAmountFourButton.backgroundColor = UIColor.white
        ZIPITAmountFourButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITAmountFiveButton.layer.cornerRadius = 3
        ZIPITAmountFiveButton.backgroundColor = UIColor.white
        ZIPITAmountFiveButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITAmountSixButton.layer.cornerRadius = 3
        ZIPITAmountSixButton.backgroundColor = UIColor.white
        ZIPITAmountSixButton.setTitleColor(UIColor.black, for: .normal)
        
        ZIPITAmountFourButton.addTarget(self, action: #selector(ZIPITAmountFourButtonPressed), for: .touchUpInside)
        ZIPITAmountFiveButton.addTarget(self, action: #selector(ZIPITAmountFiveButtonPressed), for: .touchUpInside)
        ZIPITAmountSixButton.addTarget(self, action: #selector(ZIPITAmountSixButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [ZIPITAmountFourButton, ZIPITAmountFiveButton, ZIPITAmountSixButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT AMOUNT ROW TWO BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func ZIPITAmountFourButtonPressed(){
        
        numpadBtnPressed(button: ZIPITAmountFourButton, label: ZIPITAmountTextField)
        
    }
    
    @objc func ZIPITAmountFiveButtonPressed(){
        
        numpadBtnPressed(button: ZIPITAmountFiveButton, label: ZIPITAmountTextField)
        
    }
    
    @objc func ZIPITAmountSixButtonPressed(){
        
        numpadBtnPressed(button: ZIPITAmountSixButton, label: ZIPITAmountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT AMOUNT VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makeZIPITAmountRowThreeStackView() -> UIStackView {
        
        ZIPITAmountSevenButton.layer.cornerRadius = 3
        ZIPITAmountSevenButton.backgroundColor = UIColor.white
        ZIPITAmountSevenButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITAmountEightButton.layer.cornerRadius = 3
        ZIPITAmountEightButton.backgroundColor = UIColor.white
        ZIPITAmountEightButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITAmountNineButton.layer.cornerRadius = 3
        ZIPITAmountNineButton.backgroundColor = UIColor.white
        ZIPITAmountNineButton.setTitleColor(UIColor.black, for: .normal)
        
        ZIPITAmountSevenButton.addTarget(self, action: #selector(ZIPITAmountSevenButtonPressed), for: .touchUpInside)
        ZIPITAmountEightButton.addTarget(self, action: #selector(ZIPITAmountEightButtonPressed), for: .touchUpInside)
        ZIPITAmountNineButton.addTarget(self, action: #selector(ZIPITAmountNineButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [ZIPITAmountSevenButton, ZIPITAmountEightButton, ZIPITAmountNineButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT AMOUNT ROW THREE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func ZIPITAmountSevenButtonPressed(){
        
        numpadBtnPressed(button: ZIPITAmountSevenButton, label: ZIPITAmountTextField)
        
    }
    
    @objc func ZIPITAmountEightButtonPressed(){
        
        numpadBtnPressed(button: ZIPITAmountEightButton, label: ZIPITAmountTextField)
        
    }
    
    @objc func ZIPITAmountNineButtonPressed(){
        
        numpadBtnPressed(button: ZIPITAmountNineButton, label: ZIPITAmountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT AMOUNT VIEW KEYBOARD ROW FOUR STACKVIEW
    //----------------------------------------------------------------
    
    func makeZIPITAmountRowFourStackView() -> UIStackView {
        
        ZIPITAmountZeroButton.layer.cornerRadius = 3
        ZIPITAmountZeroButton.backgroundColor = UIColor.white
        ZIPITAmountZeroButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITAmountDecimalButton.layer.cornerRadius = 3
        ZIPITAmountDecimalButton.backgroundColor = UIColor.white
        ZIPITAmountDecimalButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITAmountDeleteButton.layer.cornerRadius = 3
        ZIPITAmountDeleteButton.backgroundColor = UIColor.white
        ZIPITAmountDeleteButton.setTitleColor(UIColor.black, for: .normal)
        
        ZIPITAmountZeroButton.addTarget(self, action: #selector(ZIPITAmountZeroButtonPressed), for: .touchUpInside)
        ZIPITAmountDecimalButton.addTarget(self, action: #selector(ZIPITAmountDecimalButtonPressed), for: .touchUpInside)
        ZIPITAmountDeleteButton.addTarget(self, action: #selector(ZIPITAmountDeleteButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [ZIPITAmountZeroButton, ZIPITAmountDecimalButton, ZIPITAmountDeleteButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT AMOUNT ROW FOUR BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func ZIPITAmountZeroButtonPressed(){
        
        numpadBtnPressed(button: ZIPITAmountZeroButton, label: ZIPITAmountTextField)
        
    }
    
    @objc func ZIPITAmountDecimalButtonPressed(){
        
        numpadBtnPressed(button: ZIPITAmountDecimalButton, label: ZIPITAmountTextField)
        
    }
    
    @objc func ZIPITAmountDeleteButtonPressed(){
        
        numpadClearBtnPressed(button: ZIPITAmountDeleteButton, label: ZIPITAmountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT AMOUNT KEYBOARD PARENT STACKVIEW
    //----------------------------------------------------------------
    
    func makeZIPITAmountKeyBoardParentStackView(){
        
        let pStackView = Controls().theParentStackView(buttons: [makeZIPITAmountRowOneStackView(), makeZIPITAmountRowTwoStackView(), makeZIPITAmountRowThreeStackView(), makeZIPITAmountRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 6
        ZIPITAmountKeyboardContainer.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: ZIPITAmountKeyboardContainer.leftAnchor).isActive = true
        pStackView.rightAnchor.constraint(equalTo: ZIPITAmountKeyboardContainer.rightAnchor).isActive = true
        pStackView.topAnchor.constraint(equalTo: ZIPITAmountKeyboardContainer.topAnchor).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: ZIPITAmountKeyboardContainer.bottomAnchor).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET UP ZIPIT AMOUNT VIEW CONSTRAINTS
    //----------------------------------------------------------------
    
    func  setZIPITAmountViewConstraints(){
        
        ZIPITAmountView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        ZIPITAmountView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        ZIPITAmountView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        ZIPITAmountView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    
    //----------------------------------------------------------------
    
    
}

//
//  RTGSAmountView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/8/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit

extension KeyboardViewController{
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS AMOUNT VIEW
    //----------------------------------------------------------------
    
    func makeRTGSAmountView(){
        
        RTGSAmountView.backgroundColor = Theme.LighterGray
        RTGSAmountView.layer.cornerRadius = 0
        view.addSubview(RTGSAmountView)
        setRTGSAmountViewConstraints()
        makeRTGSAmountViewTopContainer()
        makeRTGSAmountKeyboardViewContainer()
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS AMOUNT VIEW TOP CONTAINER
    //----------------------------------------------------------------
    
    func makeRTGSAmountViewTopContainer(){
        
        RTGSAmountTopContainer.backgroundColor = Theme.LighterGray
        RTGSAmountTopContainer.layer.cornerRadius = 0
        RTGSAmountView.addSubview(RTGSAmountTopContainer)
        
        RTGSAmountTopContainer.topAnchor.constraint(equalTo: RTGSAmountView.topAnchor).isActive = true
        RTGSAmountTopContainer.leftAnchor.constraint(equalTo: RTGSAmountView.leftAnchor).isActive = true
        RTGSAmountTopContainer.rightAnchor.constraint(equalTo: RTGSAmountView.rightAnchor).isActive = true
        RTGSAmountTopContainer.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        makeRTGSTopContainerLabel()
        makeRTGSAmountViewBackButton()
        makeRTGSAmountViewRightButton()
        makeRTGSAmountTopContainerTextField()
        
        
    }
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS AMOUNT TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeRTGSTopContainerLabel(){
        
        RTGSAmountTopContainer.addSubview(RTGSAmountTopContainerLabel)
        RTGSAmountTopContainerLabel.textAlignment = .center
        
        RTGSAmountTopContainerLabel.topAnchor.constraint(equalTo: RTGSAmountTopContainer.topAnchor, constant: 3).isActive = true
        RTGSAmountTopContainerLabel.leftAnchor.constraint(equalTo: RTGSAmountTopContainer.leftAnchor, constant: 3).isActive = true
        RTGSAmountTopContainerLabel.rightAnchor.constraint(equalTo: RTGSAmountTopContainer.rightAnchor, constant: 3).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS  AMOUNT VIEW BACK BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeRTGSAmountViewBackButton(){
        
        RTGSAmountBackBtn.layer.cornerRadius = 15
        RTGSAmountTopContainer.addSubview(RTGSAmountBackBtn)
        
        
        RTGSAmountBackBtn.addTarget(self, action: #selector(RTGSAmountBackBtnPressed), for: .touchUpInside)
        
        RTGSAmountBackBtn.topAnchor.constraint(equalTo: RTGSAmountTopContainerLabel.bottomAnchor, constant: 2).isActive = true
        RTGSAmountBackBtn.leftAnchor.constraint(equalTo: RTGSAmountTopContainer.leftAnchor, constant: 8).isActive = true
        RTGSAmountBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        RTGSAmountBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS AMOUNT BACK BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func RTGSAmountBackBtnPressed(){
        
        RTGSAmountView.removeFromSuperview()
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS AMOUNT VIEW RIGHT BUTTON VIEW
    //----------------------------------------------------------------
    
    func makeRTGSAmountViewRightButton(){
        
        RTGSAmountRightBtn.layer.cornerRadius = 15
        RTGSAmountTopContainer.addSubview(RTGSAmountRightBtn)
        //      airtimeAmountViewRightButtonPressed()
        
        RTGSAmountRightBtn.addTarget(self, action: #selector(RTGSAmountRightBtnPressed), for: .touchUpInside)
        
        RTGSAmountRightBtn.topAnchor.constraint(equalTo: RTGSAmountTopContainerLabel.bottomAnchor, constant: 2).isActive = true
        RTGSAmountRightBtn.rightAnchor.constraint(equalTo: RTGSAmountTopContainer.rightAnchor, constant: -8).isActive = true
        RTGSAmountRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        RTGSAmountRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS AMOUNT RIGHT BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func RTGSAmountRightBtnPressed(){
        
        makeRTGSPaymentsOptionsView()
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS AMOUNT TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeRTGSAmountTopContainerTextField(){
        
        RTGSAmountTopContainer.addSubview(RTGSAmountTextField)
        RTGSAmountTextField.textAlignment = .center
        RTGSAmountTextField.backgroundColor = UIColor.white
        RTGSAmountTextField.layer.cornerRadius = 5
        RTGSAmountTextField.layer.masksToBounds = true
        RTGSAmountTextField.textColor = UIColor.gray
        
        RTGSAmountTextField.centerYAnchor.constraint(equalTo: RTGSAmountBackBtn.centerYAnchor).isActive = true
        RTGSAmountTextField.leftAnchor.constraint(equalTo: RTGSAmountBackBtn.rightAnchor, constant: 30).isActive = true
        RTGSAmountTextField.rightAnchor.constraint(equalTo: RTGSAmountRightBtn.leftAnchor, constant: -30).isActive = true
        RTGSAmountTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS AMOUNT VIEW KEYBOARD CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeRTGSAmountKeyboardViewContainer(){
        
        RTGSAmountKeyboardContainer.backgroundColor = UIColor.lightGray
        RTGSAmountKeyboardContainer.layer.cornerRadius = 0
        RTGSAmountView.addSubview(RTGSAmountKeyboardContainer)
        
        RTGSAmountKeyboardContainer.topAnchor.constraint(equalTo:    RTGSAmountTopContainer.bottomAnchor, constant: 5).isActive = true
        RTGSAmountKeyboardContainer.leftAnchor.constraint(equalTo:   RTGSAmountView.leftAnchor, constant: 5).isActive = true
        RTGSAmountKeyboardContainer.rightAnchor.constraint(equalTo:  RTGSAmountView.rightAnchor, constant: -5).isActive = true
        RTGSAmountKeyboardContainer.bottomAnchor.constraint(equalTo: RTGSAmountView.bottomAnchor, constant: -5).isActive = true
        
        makeRTGSAmountKeyBoardParentStackView()
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS AMOUNT VIEW KEYBOARD ROW ONE STACKVIEW
    //----------------------------------------------------------------
    
    func makeRTGSAmountRowOneStackView() -> UIStackView {
        
        RTGSAmountOneButton.layer.cornerRadius = 3
        RTGSAmountOneButton.backgroundColor = UIColor.white
        RTGSAmountOneButton.setTitleColor(UIColor.black, for: .normal)
        RTGSAmountTwoButton.layer.cornerRadius = 3
        RTGSAmountTwoButton.backgroundColor = UIColor.white
        RTGSAmountTwoButton.setTitleColor(UIColor.black, for: .normal)
        RTGSAmountThreeButton.layer.cornerRadius = 3
        RTGSAmountThreeButton.backgroundColor = UIColor.white
        RTGSAmountThreeButton.setTitleColor(UIColor.black, for: .normal)
        
        RTGSAmountOneButton.addTarget(self, action:   #selector(RTGSAmountOneButtonPressed), for: .touchUpInside)
        RTGSAmountTwoButton.addTarget(self, action:   #selector(RTGSAmountTwoButtonPressed), for: .touchUpInside)
        RTGSAmountThreeButton.addTarget(self, action: #selector(RTGSAmountThreeButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [RTGSAmountOneButton, RTGSAmountTwoButton, RTGSAmountThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
        
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS AMOUNT ROW ONE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func RTGSAmountOneButtonPressed(){
        
        numpadBtnPressed(button: RTGSAmountOneButton, label:RTGSAmountTextField)
        
    }
    
    @objc func RTGSAmountTwoButtonPressed(){
        
        numpadBtnPressed(button: RTGSAmountTwoButton, label: RTGSAmountTextField)
        
    }
    
    @objc func RTGSAmountThreeButtonPressed(){
        
        numpadBtnPressed(button: RTGSAmountThreeButton, label: RTGSAmountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS AMOUNT VIEW KEYBOARD ROW TWO STACKVIEW
    //----------------------------------------------------------------
    
    func makeRTGSAmountRowTwoStackView() -> UIStackView {
        
        RTGSAmountFourButton.layer.cornerRadius = 3
        RTGSAmountFourButton.backgroundColor = UIColor.white
        RTGSAmountFourButton.setTitleColor(UIColor.black, for: .normal)
        RTGSAmountFiveButton.layer.cornerRadius = 3
        RTGSAmountFiveButton.backgroundColor = UIColor.white
        RTGSAmountFiveButton.setTitleColor(UIColor.black, for: .normal)
        RTGSAmountSixButton.layer.cornerRadius = 3
        RTGSAmountSixButton.backgroundColor = UIColor.white
        RTGSAmountSixButton.setTitleColor(UIColor.black, for: .normal)
        
        RTGSAmountFourButton.addTarget(self, action: #selector(RTGSAmountFourButtonPressed), for: .touchUpInside)
        RTGSAmountFiveButton.addTarget(self, action: #selector(RTGSAmountFiveButtonPressed), for: .touchUpInside)
        RTGSAmountSixButton.addTarget(self, action: #selector(RTGSAmountSixButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [RTGSAmountFourButton, RTGSAmountFiveButton, RTGSAmountSixButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS AMOUNT ROW TWO BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func RTGSAmountFourButtonPressed(){
        
        numpadBtnPressed(button: RTGSAmountFourButton, label: RTGSAmountTextField)
        
    }
    
    @objc func RTGSAmountFiveButtonPressed(){
        
        numpadBtnPressed(button: RTGSAmountFiveButton, label: RTGSAmountTextField)
        
    }
    
    @objc func RTGSAmountSixButtonPressed(){
        
        numpadBtnPressed(button: RTGSAmountSixButton, label: RTGSAmountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS AMOUNT VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makeRTGSAmountRowThreeStackView() -> UIStackView {
        
        RTGSAmountSevenButton.layer.cornerRadius = 3
        RTGSAmountSevenButton.backgroundColor = UIColor.white
        RTGSAmountSevenButton.setTitleColor(UIColor.black, for: .normal)
        RTGSAmountEightButton.layer.cornerRadius = 3
        RTGSAmountEightButton.backgroundColor = UIColor.white
        RTGSAmountEightButton.setTitleColor(UIColor.black, for: .normal)
        RTGSAmountNineButton.layer.cornerRadius = 3
        RTGSAmountNineButton.backgroundColor = UIColor.white
        RTGSAmountNineButton.setTitleColor(UIColor.black, for: .normal)
        
        RTGSAmountSevenButton.addTarget(self, action: #selector(RTGSAmountSevenButtonPressed), for: .touchUpInside)
        RTGSAmountEightButton.addTarget(self, action: #selector(RTGSAmountEightButtonPressed), for: .touchUpInside)
        RTGSAmountNineButton.addTarget(self, action: #selector(RTGSAmountNineButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [RTGSAmountSevenButton, RTGSAmountEightButton, RTGSAmountNineButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS AMOUNT ROW THREE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func RTGSAmountSevenButtonPressed(){
        
        numpadBtnPressed(button: RTGSAmountSevenButton, label: RTGSAmountTextField)
        
    }
    
    @objc func RTGSAmountEightButtonPressed(){
        
        numpadBtnPressed(button: RTGSAmountEightButton, label: RTGSAmountTextField)
        
    }
    
    @objc func RTGSAmountNineButtonPressed(){
        
        numpadBtnPressed(button: RTGSAmountNineButton, label: RTGSAmountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS AMOUNT VIEW KEYBOARD ROW FOUR STACKVIEW
    //----------------------------------------------------------------
    
    func makeRTGSAmountRowFourStackView() -> UIStackView {
        
        RTGSAmountZeroButton.layer.cornerRadius = 3
        RTGSAmountZeroButton.backgroundColor = UIColor.white
        RTGSAmountZeroButton.setTitleColor(UIColor.black, for: .normal)
        RTGSAmountDecimalButton.layer.cornerRadius = 3
        RTGSAmountDecimalButton.backgroundColor = UIColor.white
        RTGSAmountDecimalButton.setTitleColor(UIColor.black, for: .normal)
        RTGSAmountDeleteButton.layer.cornerRadius = 3
        RTGSAmountDeleteButton.backgroundColor = UIColor.white
        RTGSAmountDeleteButton.setTitleColor(UIColor.black, for: .normal)
        
        RTGSAmountZeroButton.addTarget(self, action: #selector(RTGSAmountZeroButtonPressed), for: .touchUpInside)
        RTGSAmountDecimalButton.addTarget(self, action: #selector(RTGSAmountDecimalButtonPressed), for: .touchUpInside)
        RTGSAmountDeleteButton.addTarget(self, action: #selector(RTGSAmountDeleteButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [RTGSAmountZeroButton, RTGSAmountDecimalButton, RTGSAmountDeleteButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS AMOUNT ROW FOUR BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func RTGSAmountZeroButtonPressed(){
        
        numpadBtnPressed(button: RTGSAmountZeroButton, label: RTGSAmountTextField)
        
    }
    
    @objc func RTGSAmountDecimalButtonPressed(){
        
        numpadBtnPressed(button: RTGSAmountDecimalButton, label: RTGSAmountTextField)
        
    }
    
    @objc func RTGSAmountDeleteButtonPressed(){
        
        numpadClearBtnPressed(button: RTGSAmountDeleteButton, label: RTGSAmountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS AMOUNT KEYBOARD PARENT STACKVIEW
    //----------------------------------------------------------------
    
    func makeRTGSAmountKeyBoardParentStackView(){
        
        let pStackView = Controls().theParentStackView(buttons: [makeRTGSAmountRowOneStackView(), makeRTGSAmountRowTwoStackView(), makeRTGSAmountRowThreeStackView(), makeRTGSAmountRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 1
        RTGSAmountKeyboardContainer.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: RTGSAmountKeyboardContainer.leftAnchor).isActive = true
        pStackView.rightAnchor.constraint(equalTo: RTGSAmountKeyboardContainer.rightAnchor).isActive = true
        pStackView.topAnchor.constraint(equalTo: RTGSAmountKeyboardContainer.topAnchor).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: RTGSAmountKeyboardContainer.bottomAnchor).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET UP RTGS AMOUNT VIEW CONSTRAINTS
    //----------------------------------------------------------------
    
    func  setRTGSAmountViewConstraints(){
        
        RTGSAmountView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        RTGSAmountView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        RTGSAmountView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        RTGSAmountView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    
    
}

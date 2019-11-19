//
//  AirtimeAmountView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 9/2/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit

extension KeyboardViewController {
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME AMOUNT MAIN VIEW
    //----------------------------------------------------------------
    
    func makeAirtimeAmountView(){
        
        airtimeAmountView.backgroundColor = Theme.LighterGray
        airtimeAmountView.layer.cornerRadius = 0
        view.addSubview(airtimeAmountView)
        setAirtimeAmountViewConstraints()
        makeAirtimeAmountViewTopContainer()
        makeAirtimeAmountKeyboardViewContainer()
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME AMOUNT VIEW TOP CONTAINER
    //----------------------------------------------------------------
    
    func makeAirtimeAmountViewTopContainer(){
        
        airtimeAmountViewTopContainer.backgroundColor = Theme.LighterGray
        airtimeAmountViewTopContainer.layer.cornerRadius = 0
        airtimeAmountView.addSubview(airtimeAmountViewTopContainer)
        
        airtimeAmountViewTopContainer.topAnchor.constraint(equalTo: airtimeAmountView.topAnchor).isActive = true
        airtimeAmountViewTopContainer.leftAnchor.constraint(equalTo: airtimeAmountView.leftAnchor).isActive = true
        airtimeAmountViewTopContainer.rightAnchor.constraint(equalTo: airtimeAmountView.rightAnchor).isActive = true
        airtimeAmountViewTopContainer.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        makeAirtimeAmountTopContainerLabel()
        makeAirTimeAmountViewBackButton()
        makeAirTimeAmountViewRightButton()
        makeAirtimeAmountTopContainerTextField()
        
        
    }
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeAirtimeAmountTopContainerLabel(){
        
        airtimeAmountViewTopContainer.addSubview(airtimeAmountTopContainerLabel)
        airtimeAmountTopContainerLabel.textAlignment = .center
    
        airtimeAmountTopContainerLabel.topAnchor.constraint(equalTo: airtimeAmountViewTopContainer.topAnchor, constant: 3).isActive = true
        airtimeAmountTopContainerLabel.leftAnchor.constraint(equalTo: airtimeAmountViewTopContainer.leftAnchor, constant: 3).isActive = true
        airtimeAmountTopContainerLabel.rightAnchor.constraint(equalTo: airtimeAmountViewTopContainer.rightAnchor, constant: 3).isActive = true
        
  
        
    }

    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME AMOUNT VIEW KEYBOARD CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeAirtimeAmountKeyboardViewContainer(){
        
        airtimeAmountViewKeyboardContainer.backgroundColor = UIColor.clear
        airtimeAmountViewKeyboardContainer.layer.cornerRadius = 0
        airtimeAmountView.addSubview(airtimeAmountViewKeyboardContainer)
        
        airtimeAmountViewKeyboardContainer.topAnchor.constraint(equalTo: airtimeAmountViewTopContainer.bottomAnchor, constant: 5).isActive = true
        airtimeAmountViewKeyboardContainer.leftAnchor.constraint(equalTo: airtimeAmountView.leftAnchor, constant: 5).isActive = true
        airtimeAmountViewKeyboardContainer.rightAnchor.constraint(equalTo: airtimeAmountView.rightAnchor, constant: -5).isActive = true
        airtimeAmountViewKeyboardContainer.bottomAnchor.constraint(equalTo: airtimeAmountView.bottomAnchor, constant: -5).isActive = true
        
        makeAirtimeAmountKeyBoardParentStackView()
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME AMOUNT VIEW KEYBOARD ROW ONE STACKVIEW
    //----------------------------------------------------------------
    
    func makeAirtimeAmountRowOneStackView() -> UIStackView {
        
        airtimeAmountViewOneButton.layer.cornerRadius = 3
        airtimeAmountViewOneButton.backgroundColor = UIColor.white
        airtimeAmountViewOneButton.setTitleColor(UIColor.black, for: .normal)
        airtimeAmountViewTwoButton.layer.cornerRadius = 3
        airtimeAmountViewTwoButton.backgroundColor = UIColor.white
        airtimeAmountViewTwoButton.setTitleColor(UIColor.black, for: .normal)
        airtimeAmountViewThreeButton.layer.cornerRadius = 3
        airtimeAmountViewThreeButton.backgroundColor = UIColor.white
        airtimeAmountViewThreeButton.setTitleColor(UIColor.black, for: .normal)
        
        airtimeAmountViewOneButton.addTarget(self, action: #selector(airtimeAmountBtn1Pressed), for: .touchUpInside)
        airtimeAmountViewTwoButton.addTarget(self, action: #selector(airtimeAmountBtn2Pressed), for: .touchUpInside)
        airtimeAmountViewThreeButton.addTarget(self, action: #selector(airtimeAmountBtn3Pressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [airtimeAmountViewOneButton, airtimeAmountViewTwoButton, airtimeAmountViewThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME AMOUNT ROW ONE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func airtimeAmountBtn1Pressed(){
        
        numpadBtnPressed(button: airtimeAmountViewOneButton, label: airtimeAmountViewAmountTextField)
        
    }
    
    @objc func airtimeAmountBtn2Pressed(){
        
        numpadBtnPressed(button: airtimeAmountViewTwoButton, label: airtimeAmountViewAmountTextField)
        
    }
    
    @objc func airtimeAmountBtn3Pressed(){
        
        numpadBtnPressed(button: airtimeAmountViewThreeButton, label: airtimeAmountViewAmountTextField)
        
    }

    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME AMOUNT VIEW KEYBOARD ROW TWO STACKVIEW
    //----------------------------------------------------------------
    
    func makeAirtimeAmountRowTwoStackView() -> UIStackView {
        
        airtimeAmountViewFourButton.layer.cornerRadius = 3
        airtimeAmountViewFourButton.backgroundColor = UIColor.white
        airtimeAmountViewFourButton.setTitleColor(UIColor.black, for: .normal)
        airtimeAmountViewFiveButton.layer.cornerRadius = 3
        airtimeAmountViewFiveButton.backgroundColor = UIColor.white
        airtimeAmountViewFiveButton.setTitleColor(UIColor.black, for: .normal)
        airtimeAmountViewSixButton.layer.cornerRadius = 3
        airtimeAmountViewSixButton.backgroundColor = UIColor.white
        airtimeAmountViewSixButton.setTitleColor(UIColor.black, for: .normal)
        
        airtimeAmountViewFourButton.addTarget(self, action: #selector(airtimeAmountBtn4Pressed), for: .touchUpInside)
        airtimeAmountViewFiveButton.addTarget(self, action: #selector(airtimeAmountBtn5Pressed), for: .touchUpInside)
        airtimeAmountViewSixButton.addTarget(self, action: #selector(airtimeAmountBtn6Pressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [airtimeAmountViewFourButton, airtimeAmountViewFiveButton, airtimeAmountViewSixButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME AMOUNT ROW TWO BUTTON ACTION METHODS'''
    
    //----------------------------------------------------------------
    
    @objc func airtimeAmountBtn4Pressed() {
        
        numpadBtnPressed(button: airtimeAmountViewFourButton, label: airtimeAmountViewAmountTextField)
    }
    
    
    @objc func airtimeAmountBtn5Pressed() {
        
        numpadBtnPressed(button: airtimeAmountViewFiveButton, label: airtimeAmountViewAmountTextField)
    }
    
    
    @objc func airtimeAmountBtn6Pressed() {
        
        numpadBtnPressed(button: airtimeAmountViewSixButton, label: airtimeAmountViewAmountTextField)
    }

    //----------------------------------------------------------------
    

    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME AMOUNT VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makeAirtimeAmountRowThreeStackView() -> UIStackView {
        
        airtimeAmountViewSevenButton.layer.cornerRadius = 3
        airtimeAmountViewSevenButton.backgroundColor = UIColor.white
        airtimeAmountViewSevenButton.setTitleColor(UIColor.black, for: .normal)
        airtimeAmountViewEightButton.layer.cornerRadius = 3
        airtimeAmountViewEightButton.backgroundColor = UIColor.white
        airtimeAmountViewEightButton.setTitleColor(UIColor.black, for: .normal)
        airtimeAmountViewNineButton.layer.cornerRadius = 3
        airtimeAmountViewNineButton.backgroundColor = UIColor.white
        airtimeAmountViewNineButton.setTitleColor(UIColor.black, for: .normal)
        
        
        airtimeAmountViewSevenButton.addTarget(self, action: #selector(airtimeAmountBtn7Pressed), for: .touchUpInside)
        airtimeAmountViewEightButton.addTarget(self, action: #selector(airtimeAmountBtn8Pressed), for: .touchUpInside)
        airtimeAmountViewNineButton.addTarget(self, action: #selector(airtimeAmountBtn9Pressed), for: .touchUpInside)
        
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [airtimeAmountViewSevenButton, airtimeAmountViewEightButton, airtimeAmountViewNineButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME AMOUNT ROW THREE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func airtimeAmountBtn7Pressed() {
        
        numpadBtnPressed(button: airtimeAmountViewSevenButton, label: airtimeAmountViewAmountTextField)
    }
    
    @objc func airtimeAmountBtn8Pressed() {
        
        numpadBtnPressed(button: airtimeAmountViewEightButton, label: airtimeAmountViewAmountTextField)
    }
    
    
    @objc func airtimeAmountBtn9Pressed() {
        
        numpadBtnPressed(button: airtimeAmountViewNineButton, label: airtimeAmountViewAmountTextField)
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME AMOUNT VIEW KEYBOARD ROW FOUR STACKVIEW
    //----------------------------------------------------------------
    
    func makeAirtimeAmountRowFourStackView() -> UIStackView {
        
        airtimeAmountViewZeroButton.layer.cornerRadius = 3
        airtimeAmountViewZeroButton.backgroundColor = UIColor.white
        airtimeAmountViewZeroButton.setTitleColor(UIColor.black, for: .normal)
        airtimeAmountViewDecimalButton.layer.cornerRadius = 3
        airtimeAmountViewDecimalButton.backgroundColor = UIColor.white
        airtimeAmountViewDecimalButton.setTitleColor(UIColor.black, for: .normal)
        airtimeAmountViewDeleteButton.layer.cornerRadius = 3
        airtimeAmountViewDeleteButton.backgroundColor = UIColor.white
        airtimeAmountViewDeleteButton.setTitleColor(UIColor.black, for: .normal)
        
        airtimeAmountViewZeroButton.addTarget(self, action: #selector(airtimeAmountBtnZeroPressed), for: .touchUpInside)
        airtimeAmountViewDecimalButton.addTarget(self, action: #selector(airtimeAmountBtnDecimalPressed), for: .touchUpInside)
        airtimeAmountViewDeleteButton.addTarget(self, action: #selector(airtimeAmountBtnDeletePressed), for: .touchUpInside)
        
        

        let hStackView = Controls().theHorizontalStackView(buttons: [airtimeAmountViewZeroButton, airtimeAmountViewDecimalButton, airtimeAmountViewDeleteButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME AMOUNT ROW FOUR BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func airtimeAmountBtnZeroPressed(){
        
        numpadBtnPressed(button: airtimeAmountViewZeroButton, label: airtimeAmountViewAmountTextField)
    }
    
    
    @objc func airtimeAmountBtnDecimalPressed(){
        
        numpadBtnPressed(button: airtimeAmountViewDecimalButton, label: airtimeAmountViewAmountTextField)
    }
    
    
    @objc func airtimeAmountBtnDeletePressed(){
        
        numpadClearBtnPressed(button: airtimeAmountViewDeleteButton, label: airtimeAmountViewAmountTextField)
    }
    
    //----------------------------------------------------------------
    

    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME AMOUNT KEYBOARD PARENT STACKVIEW
    //----------------------------------------------------------------
    
    func makeAirtimeAmountKeyBoardParentStackView(){
        
        let pStackView = Controls().theParentStackView(buttons: [makeAirtimeAmountRowOneStackView(), makeAirtimeAmountRowTwoStackView(), makeAirtimeAmountRowThreeStackView(), makeAirtimeAmountRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 6
        airtimeAmountViewKeyboardContainer.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: airtimeAmountViewKeyboardContainer.leftAnchor).isActive = true
        pStackView.rightAnchor.constraint(equalTo: airtimeAmountViewKeyboardContainer.rightAnchor).isActive = true
        pStackView.topAnchor.constraint(equalTo: airtimeAmountViewKeyboardContainer.topAnchor).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: airtimeAmountViewKeyboardContainer.bottomAnchor).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME AMOUNT VIEW BACK BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeAirTimeAmountViewBackButton(){
        
        airtimeAmountViewBackBtn.layer.cornerRadius = 15
        airtimeAmountViewTopContainer.addSubview(airtimeAmountViewBackBtn)
        airtimeAmountViewBackButtonPressed()
        
        airtimeAmountViewBackBtn.topAnchor.constraint(equalTo: airtimeAmountTopContainerLabel.bottomAnchor, constant: 2).isActive = true
        airtimeAmountViewBackBtn.leftAnchor.constraint(equalTo: airtimeAmountViewTopContainer.leftAnchor, constant: 8).isActive = true
        airtimeAmountViewBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        airtimeAmountViewBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME AMOUNT VIEW RIGHT BUTTON VIEW
    //----------------------------------------------------------------
    
    func makeAirTimeAmountViewRightButton(){
        
        airtimeAmountViewRightBtn.layer.cornerRadius = 15
        airtimeAmountViewTopContainer.addSubview(airtimeAmountViewRightBtn)
        airtimeAmountViewRightButtonPressed()
        
        airtimeAmountViewRightBtn.topAnchor.constraint(equalTo: airtimeAmountTopContainerLabel.bottomAnchor, constant: 2).isActive = true
        airtimeAmountViewRightBtn.rightAnchor.constraint(equalTo: airtimeAmountViewTopContainer.rightAnchor, constant: -8).isActive = true
        airtimeAmountViewRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        airtimeAmountViewRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeAirtimeAmountTopContainerTextField(){
        
        airtimeAmountViewTopContainer.addSubview(airtimeAmountViewAmountTextField)
        airtimeAmountViewAmountTextField.textAlignment = .center
        airtimeAmountViewAmountTextField.backgroundColor = UIColor.white
        airtimeAmountViewAmountTextField.layer.cornerRadius = 5
        airtimeAmountViewAmountTextField.layer.masksToBounds = true
        airtimeAmountViewAmountTextField.textColor = UIColor.gray
        
        airtimeAmountViewAmountTextField.centerYAnchor.constraint(equalTo: airtimeAmountViewRightBtn.centerYAnchor).isActive = true
        airtimeAmountViewAmountTextField.leftAnchor.constraint(equalTo: airtimeAmountViewBackBtn.rightAnchor, constant: 30).isActive = true
        airtimeAmountViewAmountTextField.rightAnchor.constraint(equalTo: airtimeAmountViewRightBtn.leftAnchor, constant: -30).isActive = true
        airtimeAmountViewAmountTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
                                                
    
    
   
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET AIRTIME AMOUNT VIEW CONSTRAINTS
    //----------------------------------------------------------------
    
    func setAirtimeAmountViewConstraints(){
        airtimeAmountView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        airtimeAmountView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        airtimeAmountView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        airtimeAmountView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CLOSE AIRTIME VIEW
    //----------------------------------------------------------------
    
    func airtimeAmountViewBackButtonPressed(){
        
        airtimeAmountViewBackBtn.addTarget(self, action: #selector(closeAirtimeAmountView), for: .touchUpInside)
    }
    
    @objc func closeAirtimeAmountView(){
        
        airtimeAmountView.removeFromSuperview()
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SHOW AIRTIME PAYMENT OPTIONS VIEW
    //----------------------------------------------------------------
    
    func airtimeAmountViewRightButtonPressed(){
        
        airtimeAmountViewRightBtn.addTarget(self, action: #selector(showAirtimePaymentOptionsView), for: .touchUpInside)
    }
    
    @objc func showAirtimePaymentOptionsView(){
        
        
        if airtimeAmountViewAmountTextField.text?.isEmpty ?? true {
            
            showValidationView(message: "Please enter airtime amount.")
            
        }else {
            
            airtimeAmountView.removeFromSuperview()
            makeEcocashPaymentsOptionsView()
            KeyboardSharedPreferences().setAirtimeAmount(amount: airtimeAmountViewAmountTextField.text!)
            
        }
        
        
        
    }
    
    //----------------------------------------------------------------
    
}

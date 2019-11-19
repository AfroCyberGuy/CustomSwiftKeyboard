//
//  BillPaymentsAmountView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/4/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit

extension KeyboardViewController {
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BIllPAYMENTS AMOUNT VIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentAmountView(){
        
        billPaymentsAmountView.backgroundColor = Theme.LighterGray
        billPaymentsAmountView.layer.cornerRadius = 0
        view.addSubview(billPaymentsAmountView)
        setBillPaymentsAmountViewConstraints()
        makeBillPaymentAmountViewTopContainer()
        makeBillPaymentsAmountKeyboardViewContainer()
//        makeBillPaymentsAmountKeyboardViewContainer()
    }
    
    
    //----------------------------------------------------------------
    
   
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILLPAYMENT AMOUNT VIEW TOP CONTAINER
    //----------------------------------------------------------------
    
    func makeBillPaymentAmountViewTopContainer(){
        
        billPaymentsTopContainer.backgroundColor = Theme.LighterGray
        billPaymentsTopContainer.layer.cornerRadius = 0
        billPaymentsAmountView.addSubview(billPaymentsTopContainer)
        
        billPaymentsTopContainer.topAnchor.constraint(equalTo: billPaymentsAmountView.topAnchor).isActive = true
        billPaymentsTopContainer.leftAnchor.constraint(equalTo: billPaymentsAmountView.leftAnchor).isActive = true
        billPaymentsTopContainer.rightAnchor.constraint(equalTo: billPaymentsAmountView.rightAnchor).isActive = true
        billPaymentsTopContainer.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        makeBillPaymentsAmountTopContainerLabel()
        makeBIllPaymentAmountViewBackButton()
        makeBillPaymentAmountViewRightButton()
        makebillPaymentsAmountTopContainerTextField()
        
        
    }
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENT AMOUNT TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeBillPaymentsAmountTopContainerLabel(){
        
        billPaymentsTopContainer.addSubview(billPaymentsTopContainerLabel)
        billPaymentsTopContainerLabel.textAlignment = .center
        
        billPaymentsTopContainerLabel.topAnchor.constraint(equalTo: billPaymentsTopContainer.topAnchor, constant: 3).isActive = true
        billPaymentsTopContainerLabel.leftAnchor.constraint(equalTo: billPaymentsTopContainer.leftAnchor, constant: 3).isActive = true
        billPaymentsTopContainerLabel.rightAnchor.constraint(equalTo: billPaymentsTopContainer.rightAnchor, constant: 3).isActive = true
    
    }
    
    //----------------------------------------------------------------
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENT AMOUNT VIEW BACK BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeBIllPaymentAmountViewBackButton(){
        
        billPaymentsAmountBackBtn.layer.cornerRadius = 15
        billPaymentsTopContainer.addSubview(billPaymentsAmountBackBtn)
       
        
        billPaymentsAmountBackBtn.addTarget(self, action: #selector(billPaymentsAmountViewBackButtonPressed), for: .touchUpInside)
        
        billPaymentsAmountBackBtn.topAnchor.constraint(equalTo: billPaymentsTopContainerLabel.bottomAnchor, constant: 2).isActive = true
        billPaymentsAmountBackBtn.leftAnchor.constraint(equalTo: billPaymentsTopContainer.leftAnchor, constant: 8).isActive = true
        billPaymentsAmountBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        billPaymentsAmountBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS BACK BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func billPaymentsAmountViewBackButtonPressed(){
        
        billPaymentsAmountView.removeFromSuperview()
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS AMOUNT VIEW RIGHT BUTTON VIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentAmountViewRightButton(){
        
        billPaymentsAmountRightBtn.layer.cornerRadius = 15
        billPaymentsTopContainer.addSubview(billPaymentsAmountRightBtn)
//      airtimeAmountViewRightButtonPressed()
        
        billPaymentsAmountRightBtn.addTarget(self, action: #selector(billPaymentsAmounRightBtnPressed), for: .touchUpInside)
        
        billPaymentsAmountRightBtn.topAnchor.constraint(equalTo: billPaymentsTopContainerLabel.bottomAnchor, constant: 2).isActive = true
        billPaymentsAmountRightBtn.rightAnchor.constraint(equalTo: billPaymentsTopContainer.rightAnchor, constant: -8).isActive = true
        billPaymentsAmountRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        billPaymentsAmountRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS RIGHT BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func billPaymentsAmounRightBtnPressed(){
        
        
        if billPaymentsAmountTextField.text?.isEmpty ?? true {
            
            showValidationView(message: "Please enter amount.")
            
        }else {
            
            BILLBILLAMOUNT = billPaymentsAmountTextField.text!
            KeyboardSharedPreferences().setBillPaymentAmount(billPaymentAmount: billPaymentsAmountTextField.text!)
            makeBillPaymentsOptionsView()
        }
        
        
      
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS AMOUNT TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makebillPaymentsAmountTopContainerTextField(){
        
        billPaymentsTopContainer.addSubview(billPaymentsAmountTextField)
        billPaymentsAmountTextField.textAlignment = .center
        billPaymentsAmountTextField.backgroundColor = UIColor.white
        billPaymentsAmountTextField.layer.cornerRadius = 5
        billPaymentsAmountTextField.layer.masksToBounds = true
        billPaymentsAmountTextField.textColor = UIColor.gray
        
        billPaymentsAmountTextField.centerYAnchor.constraint(equalTo: billPaymentsAmountBackBtn.centerYAnchor).isActive = true
        billPaymentsAmountTextField.leftAnchor.constraint(equalTo: billPaymentsAmountBackBtn.rightAnchor, constant: 20).isActive = true
        billPaymentsAmountTextField.rightAnchor.constraint(equalTo: billPaymentsAmountRightBtn.leftAnchor, constant: -20).isActive = true
        billPaymentsAmountTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS AMOUNT VIEW KEYBOARD CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentsAmountKeyboardViewContainer(){
        
        billPaymentsKeyboardContainer.backgroundColor = UIColor.clear
        billPaymentsKeyboardContainer.layer.cornerRadius = 0
        billPaymentsAmountView.addSubview(billPaymentsKeyboardContainer)
        
        billPaymentsKeyboardContainer.topAnchor.constraint(equalTo: billPaymentsTopContainer.bottomAnchor, constant: 6).isActive = true
        billPaymentsKeyboardContainer.leftAnchor.constraint(equalTo: billPaymentsAmountView.leftAnchor, constant: 6).isActive = true
        billPaymentsKeyboardContainer.rightAnchor.constraint(equalTo: billPaymentsAmountView.rightAnchor, constant: -6).isActive = true
        billPaymentsKeyboardContainer.bottomAnchor.constraint(equalTo: billPaymentsAmountView.bottomAnchor, constant: -6).isActive = true
        
        makeBillPaymentsAmountKeyBoardParentStackView()
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS AMOUNT VIEW KEYBOARD ROW ONE STACKVIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentsAmountRowOneStackView() -> UIStackView {
        
        billPaymentsAmountOneButton.layer.cornerRadius = 3
        billPaymentsAmountOneButton.backgroundColor = UIColor.white
        billPaymentsAmountOneButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentsAmountTwoButton.layer.cornerRadius = 3
        billPaymentsAmountTwoButton.backgroundColor = UIColor.white
        billPaymentsAmountTwoButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentsAmountThreeButton.layer.cornerRadius = 3
        billPaymentsAmountThreeButton.backgroundColor = UIColor.white
        billPaymentsAmountThreeButton.setTitleColor(UIColor.black, for: .normal)
        
        billPaymentsAmountOneButton.addTarget(self, action: #selector(billPaymentsAmountOneButtonPressed), for: .touchUpInside)
        billPaymentsAmountTwoButton.addTarget(self, action: #selector(billPaymentsAmountTwoButtonPressed), for: .touchUpInside)
        billPaymentsAmountThreeButton.addTarget(self, action: #selector(billPaymentsAmountThreeButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [billPaymentsAmountOneButton, billPaymentsAmountTwoButton, billPaymentsAmountThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS AMOUNT ROW ONE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func billPaymentsAmountOneButtonPressed(){
        
        numpadBtnPressed(button: billPaymentsAmountOneButton, label: billPaymentsAmountTextField)
        
    }
    
    @objc func billPaymentsAmountTwoButtonPressed(){
        
        numpadBtnPressed(button: billPaymentsAmountTwoButton, label: billPaymentsAmountTextField)
        
    }
    
    @objc func billPaymentsAmountThreeButtonPressed(){
        
        numpadBtnPressed(button: billPaymentsAmountThreeButton, label: billPaymentsAmountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTSS AMOUNT VIEW KEYBOARD ROW TWO STACKVIEW
    //----------------------------------------------------------------
    
    func makebillPaymentsAmountRowTwoStackView() -> UIStackView {
        
        billPaymentsAmountFourButton.layer.cornerRadius = 3
        billPaymentsAmountFourButton.backgroundColor = UIColor.white
        billPaymentsAmountFourButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentsAmountFiveButton.layer.cornerRadius = 3
        billPaymentsAmountFiveButton.backgroundColor = UIColor.white
        billPaymentsAmountFiveButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentsAmountSixButton.layer.cornerRadius = 3
        billPaymentsAmountSixButton.backgroundColor = UIColor.white
        billPaymentsAmountSixButton.setTitleColor(UIColor.black, for: .normal)
        
        billPaymentsAmountFourButton.addTarget(self, action: #selector(billPaymentsAmountFourButtonPressed), for: .touchUpInside)
        billPaymentsAmountFiveButton.addTarget(self, action: #selector(billPaymentsAmountFiveButtonPressed), for: .touchUpInside)
        billPaymentsAmountSixButton.addTarget(self, action: #selector(billPaymentsAmountSixButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [billPaymentsAmountFourButton, billPaymentsAmountFiveButton, billPaymentsAmountSixButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS AMOUNT ROW TWO BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func billPaymentsAmountFourButtonPressed(){
        
        numpadBtnPressed(button: billPaymentsAmountFourButton, label: billPaymentsAmountTextField)
        
    }
    
    @objc func billPaymentsAmountFiveButtonPressed(){
        
        numpadBtnPressed(button: billPaymentsAmountFiveButton, label: billPaymentsAmountTextField)
        
    }
    
    @objc func billPaymentsAmountSixButtonPressed(){
        
        numpadBtnPressed(button: billPaymentsAmountSixButton, label: billPaymentsAmountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS AMOUNT VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makebillPaymentsAmountRowThreeStackView() -> UIStackView {
        
        billPaymentsAmountSevenButton.layer.cornerRadius = 3
        billPaymentsAmountSevenButton.backgroundColor = UIColor.white
        billPaymentsAmountSevenButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentsAmountEightButton.layer.cornerRadius = 3
        billPaymentsAmountEightButton.backgroundColor = UIColor.white
        billPaymentsAmountEightButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentsAmountNineButton.layer.cornerRadius = 3
        billPaymentsAmountNineButton.backgroundColor = UIColor.white
        billPaymentsAmountNineButton.setTitleColor(UIColor.black, for: .normal)
        
        billPaymentsAmountSevenButton.addTarget(self, action: #selector(billPaymentsAmountSevenButtonPressed), for: .touchUpInside)
        billPaymentsAmountEightButton.addTarget(self, action: #selector(billPaymentsAmountEightButtonPressed), for: .touchUpInside)
        billPaymentsAmountNineButton.addTarget(self, action: #selector(billPaymentsAmountNineButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [billPaymentsAmountSevenButton, billPaymentsAmountEightButton, billPaymentsAmountNineButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS AMOUNT ROW THREE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func billPaymentsAmountSevenButtonPressed(){
        
        numpadBtnPressed(button: billPaymentsAmountSevenButton, label: billPaymentsAmountTextField)
        
    }
    
    @objc func billPaymentsAmountEightButtonPressed(){
        
        numpadBtnPressed(button: billPaymentsAmountEightButton, label: billPaymentsAmountTextField)
        
    }
    
    @objc func billPaymentsAmountNineButtonPressed(){
        
        numpadBtnPressed(button: billPaymentsAmountNineButton, label: billPaymentsAmountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS AMOUNT VIEW KEYBOARD ROW FOUR STACKVIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentsAmountRowFourStackView() -> UIStackView {
        
        billPaymentsAmountZeroButton.layer.cornerRadius = 3
        billPaymentsAmountZeroButton.backgroundColor = UIColor.white
        billPaymentsAmountZeroButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentsAmountDecimalButton.layer.cornerRadius = 3
        billPaymentsAmountDecimalButton.backgroundColor = UIColor.white
        billPaymentsAmountDecimalButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentsAmountDeleteButton.layer.cornerRadius = 3
        billPaymentsAmountDeleteButton.backgroundColor = UIColor.white
        billPaymentsAmountDeleteButton.setTitleColor(UIColor.black, for: .normal)
        
        billPaymentsAmountZeroButton.addTarget(self, action: #selector(billPaymentsAmountZeroButtonPressed), for: .touchUpInside)
        billPaymentsAmountDecimalButton.addTarget(self, action: #selector(billPaymentsAmountDecimalButtonPressed), for: .touchUpInside)
        billPaymentsAmountDeleteButton.addTarget(self, action: #selector(billPaymentsAmountDeleteButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [billPaymentsAmountZeroButton, billPaymentsAmountDecimalButton, billPaymentsAmountDeleteButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS AMOUNT ROW FOUR BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func billPaymentsAmountZeroButtonPressed(){
        
        numpadBtnPressed(button: billPaymentsAmountZeroButton, label: billPaymentsAmountTextField)
        
    }
    
    @objc func billPaymentsAmountDecimalButtonPressed(){
        
        numpadBtnPressed(button: billPaymentsAmountDecimalButton, label: billPaymentsAmountTextField)
        
    }
    
    @objc func billPaymentsAmountDeleteButtonPressed(){
        
        numpadClearBtnPressed(button: billPaymentsAmountDeleteButton, label: billPaymentsAmountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME AMOUNT KEYBOARD PARENT STACKVIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentsAmountKeyBoardParentStackView(){
        
        let pStackView = Controls().theParentStackView(buttons: [makeBillPaymentsAmountRowOneStackView(), makebillPaymentsAmountRowTwoStackView(), makebillPaymentsAmountRowThreeStackView(), makeBillPaymentsAmountRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 6
        billPaymentsKeyboardContainer.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: billPaymentsKeyboardContainer.leftAnchor).isActive = true
        pStackView.rightAnchor.constraint(equalTo: billPaymentsKeyboardContainer.rightAnchor).isActive = true
        pStackView.topAnchor.constraint(equalTo: billPaymentsKeyboardContainer.topAnchor).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: billPaymentsKeyboardContainer.bottomAnchor).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET UP BILL PAYMENT AMOUNT VIEW CONSTRAINTS
    //----------------------------------------------------------------
    
    func  setBillPaymentsAmountViewConstraints(){
        
        billPaymentsAmountView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        billPaymentsAmountView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        billPaymentsAmountView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        billPaymentsAmountView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

    }
    
    
    //----------------------------------------------------------------
    
    
    
    
}

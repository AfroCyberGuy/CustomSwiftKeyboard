//
//  BillPaymentMainView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/2/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit

extension KeyboardViewController {
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENT MAIN VIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentMainView(){
        
        billpaymentsMainView.backgroundColor = Theme.LighterGray
        billpaymentsMainView.layer.cornerRadius = 0
        view.addSubview(billpaymentsMainView)
        
        billpaymentsMainView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        billpaymentsMainView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        billpaymentsMainView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        billpaymentsMainView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        makebillPaymentMainViewTopContainer()
        makeBillPaymentsKeyboardView()
        
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENT MAIN VIEW TOP CONTAINER
    //----------------------------------------------------------------
    
    func makebillPaymentMainViewTopContainer(){
        
        billpaymentsMainViewTopContainer.backgroundColor = Theme.LighterGray
        billpaymentsMainViewTopContainer.layer.cornerRadius = 0
        billpaymentsMainView.addSubview(billpaymentsMainViewTopContainer)
        
        billpaymentsMainViewTopContainer.topAnchor.constraint(equalTo: billpaymentsMainView.topAnchor).isActive = true
        billpaymentsMainViewTopContainer.leftAnchor.constraint(equalTo: billpaymentsMainView.leftAnchor).isActive = true
        billpaymentsMainViewTopContainer.rightAnchor.constraint(equalTo: billpaymentsMainView.rightAnchor).isActive = true
        billpaymentsMainViewTopContainer.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
        
        
        makeBillPaymentMainViewBackButton()
        makeBillPaymentMainViewRightButton()
        makeBillPaymentsTopContainerTextField()
        makeBillPaymentViewBillerLabel()
        makeBillPaymentsBillListView()
//        makeAirtimeAmountTopContainerLabel()
//        makeAirTimeAmountViewBackButton()
//        makeAirTimeAmountViewRightButton()
//        makeAirtimeAmountTopContainerTextField()
        
        
    }
    //----------------------------------------------------------------
    
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENT  VIEW BACK BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeBillPaymentMainViewBackButton(){
        
        billpaymentsMainViewBackBtn.layer.cornerRadius = 15
        billpaymentsMainViewTopContainer.addSubview(billpaymentsMainViewBackBtn)
//        billpaymentsMainViewBackBtnPressed()
        
        
        billpaymentsMainViewBackBtn.addTarget(self, action: #selector(billpaymentsMainViewBackBtnPressed), for: .touchUpInside)
        
        billpaymentsMainViewBackBtn.topAnchor.constraint(equalTo: billpaymentsMainViewTopContainer.topAnchor, constant: 10).isActive = true
        billpaymentsMainViewBackBtn.leftAnchor.constraint(equalTo: billpaymentsMainViewTopContainer.leftAnchor, constant: 8).isActive = true
        billpaymentsMainViewBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        billpaymentsMainViewBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS MAIN BACK BTN CLIICKED
    //----------------------------------------------------------------
    @objc func billpaymentsMainViewBackBtnPressed(){
        
        billpaymentsMainView.removeFromSuperview()
        
    }

    //----------------------------------------------------------------
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME AMOUNT VIEW RIGHT BUTTON VIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentMainViewRightButton(){
        
        billpaymentsMainViewRightBtn.layer.cornerRadius = 15
        billpaymentsMainViewTopContainer.addSubview(billpaymentsMainViewRightBtn)
//        billpaymentsViewRightButtonPressed()
        
        billpaymentsMainViewRightBtn.addTarget(self, action: #selector(billpaymentsViewRightButtonPressed), for: .touchUpInside)
        
        billpaymentsMainViewRightBtn.topAnchor.constraint(equalTo: billpaymentsMainViewTopContainer.topAnchor, constant: 10).isActive = true
        billpaymentsMainViewRightBtn.rightAnchor.constraint(equalTo: billpaymentsMainViewTopContainer.rightAnchor, constant: -8).isActive = true
        billpaymentsMainViewRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        billpaymentsMainViewRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILLPAYMENTS MAIN VIEW RIGHT BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func billpaymentsViewRightButtonPressed(){
        
        
        if billpaymentsMainViewAmountTextField.text?.isEmpty ?? true {
            
            showValidationView(message: "Please enter bill payment account number.")
            
        }else if billpaymentsMainViewAmountTextField.text == "Type your bill account number" {
            
             showValidationView(message: "Please enter bill payment account number.")
            
        }else if billpaymentsMainBillerLabel.text == "Choose a Bill Provider" {
            
            showValidationView(message: "Please choose biller.")
            
        }else {
            
            BILLBILLACCOUNT = billpaymentsMainViewAmountTextField.text!
            //KeyboardSharedPreferences().setBillAmount(billAmount: billpaymentsMainViewAmountTextField.text!)
            KeyboardSharedPreferences().setBillAccountNumber(billaccountNumber: billpaymentsMainViewAmountTextField.text!)
            
            makeBillPaymentAmountView()
        }
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeBillPaymentsTopContainerTextField(){
        
        billpaymentsMainViewTopContainer.addSubview(billpaymentsMainViewAmountTextField)
        billpaymentsMainViewAmountTextField.textAlignment = .center
        billpaymentsMainViewAmountTextField.backgroundColor = UIColor.white
        billpaymentsMainViewAmountTextField.layer.cornerRadius = 5
        billpaymentsMainViewAmountTextField.layer.masksToBounds = true
        billpaymentsMainViewAmountTextField.textColor = UIColor.gray
        
        billpaymentsMainViewAmountTextField.centerYAnchor.constraint(equalTo: billpaymentsMainViewRightBtn.centerYAnchor).isActive = true
        billpaymentsMainViewAmountTextField.leftAnchor.constraint(equalTo: billpaymentsMainViewBackBtn.rightAnchor, constant: 20).isActive = true
        billpaymentsMainViewAmountTextField.rightAnchor.constraint(equalTo: billpaymentsMainViewRightBtn.leftAnchor, constant: -20).isActive = true
        billpaymentsMainViewAmountTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS MAIN VIEW BILLER NAME LABEL
    //----------------------------------------------------------------
    
    func makeBillPaymentViewBillerLabel(){
        

        billpaymentsMainViewTopContainer.addSubview(billpaymentsMainBillerLabel)
        billpaymentsMainBillerLabel.textAlignment = .left
        billpaymentsMainBillerLabel.layer.cornerRadius = 5
        billpaymentsMainBillerLabel.layer.masksToBounds = true
        billpaymentsMainBillerLabel.textColor = Theme.PrimaryPurple
        
        billpaymentsMainBillerLabel.topAnchor.constraint(equalTo: billpaymentsMainViewAmountTextField.bottomAnchor, constant: 3).isActive = true
        billpaymentsMainBillerLabel.leftAnchor.constraint(equalTo: billpaymentsMainViewAmountTextField.leftAnchor, constant: 0).isActive = true
//        billpaymentsMainBillerLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS MAKE BILLERS LIST VIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentsBillListView(){
        
        billpaymentsMainViewTopContainer.addSubview(billpaymentMainViewBillerList)
        
        billpaymentMainViewBillerList.topAnchor.constraint(equalTo: billpaymentsMainBillerLabel.bottomAnchor, constant: 5).isActive = true
        billpaymentMainViewBillerList.leftAnchor.constraint(equalTo: billpaymentsMainViewTopContainer.leftAnchor, constant: 0).isActive = true
        billpaymentMainViewBillerList.rightAnchor.constraint(equalTo: billpaymentsMainViewTopContainer.rightAnchor, constant: 0).isActive = true
        billpaymentMainViewBillerList.bottomAnchor.constraint(equalTo: billpaymentsMainViewTopContainer.bottomAnchor, constant: 0).isActive = true
        
//        addTopView()
        
//        billpaymentMainViewBillerList.addSubview(topView)
//        topView.topAnchor.constraint(equalTo: billpaymentMainViewBillerList.topAnchor, constant: 0).isActive = true
//        topView.leftAnchor.constraint(equalTo: billpaymentMainViewBillerList.leftAnchor, constant: 0).isActive = true
//        topView.rightAnchor.constraint(equalTo: billpaymentMainViewBillerList.rightAnchor, constant: 0).isActive = true
//        topView.bottomAnchor.constraint(equalTo: billpaymentMainViewBillerList.bottomAnchor, constant: 0).isActive = true
//
       


    }
    //----------------------------------------------------------------
    
    
//    func addTopView() {
//        view.addSubview(topView)
//        
//        topView.leadingAnchor.constraint(equalTo: billpaymentMainViewBillerList.leadingAnchor).isActive = true
//        topView.trailingAnchor.constraint(equalTo: billpaymentMainViewBillerList.trailingAnchor).isActive = true
//        topView.topAnchor.constraint(equalTo: billpaymentMainViewBillerList.topAnchor, constant: 300).isActive = true
//        topView.widthAnchor.constraint(equalTo: billpaymentMainViewBillerList.widthAnchor).isActive = true
//        topView.heightAnchor.constraint(equalToConstant: 10).isActive = true
//    }
//    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS COLLECTION VIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentsCollectionView(){
    
        
        
//        billpaymentMainViewBillerList.addSubview(billPaymentCollectionview)
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS MAKE BILLER KEYBOARD VIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentsKeyboardView(){
        
        billpaymentsMainView.addSubview(billpaymentsMainViewKeyboardContainer)
        billpaymentsMainViewKeyboardContainer.backgroundColor = Theme.LighterGray
        
        billpaymentsMainViewKeyboardContainer.topAnchor.constraint(equalTo: billpaymentsMainViewTopContainer.bottomAnchor, constant: 6).isActive = true
        billpaymentsMainViewKeyboardContainer.leftAnchor.constraint(equalTo: billpaymentsMainView.leftAnchor, constant: 6).isActive = true
        billpaymentsMainViewKeyboardContainer.rightAnchor.constraint(equalTo: billpaymentsMainView.rightAnchor, constant: -6).isActive = true
        billpaymentsMainViewKeyboardContainer.bottomAnchor.constraint(equalTo: billpaymentsMainView.bottomAnchor, constant: -6).isActive = true
        
        makeBillPaymentsKeyBoardParentStackView()
    
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS MAIN VIEW KEYBOARD ROW ONE STACKVIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentsMainViewRowOneStackView() -> UIStackView {
        
        billpaymentsMainViewOneButton.layer.cornerRadius = 3
        billpaymentsMainViewOneButton.backgroundColor = UIColor.white
        billpaymentsMainViewOneButton.setTitleColor(UIColor.black, for: .normal)
        billpaymentsMainViewTwoButton.layer.cornerRadius = 3
        billpaymentsMainViewTwoButton.backgroundColor = UIColor.white
        billpaymentsMainViewTwoButton.setTitleColor(UIColor.black, for: .normal)
        billpaymentsMainViewThreeButton.layer.cornerRadius = 3
        billpaymentsMainViewThreeButton.backgroundColor = UIColor.white
        billpaymentsMainViewThreeButton.setTitleColor(UIColor.black, for: .normal)
        
        billpaymentsMainViewOneButton.addTarget(self, action: #selector(billpaymentsMainViewOneButtonPressed), for: .touchUpInside)
        billpaymentsMainViewTwoButton.addTarget(self, action: #selector(billpaymentsMainViewTwoButtonPressed), for: .touchUpInside)
        billpaymentsMainViewThreeButton.addTarget(self, action: #selector(billpaymentsMainViewThreeButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [billpaymentsMainViewOneButton, billpaymentsMainViewTwoButton, billpaymentsMainViewThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS MAIN ROW ONE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func billpaymentsMainViewOneButtonPressed(){
        
        if handlePlaceholder(text: billpaymentsMainViewAmountTextField.text!) {
            
            billpaymentsMainViewAmountTextField.text = ""
            
            numpadBtnPressed(button: billpaymentsMainViewOneButton, label: billpaymentsMainViewAmountTextField)
            
        }else {
            
            
             numpadBtnPressed(button: billpaymentsMainViewOneButton, label: billpaymentsMainViewAmountTextField)
            
        }
        
       
        
    }
    
    @objc func billpaymentsMainViewTwoButtonPressed(){
        
        if handlePlaceholder(text: billpaymentsMainViewAmountTextField.text!) {
            
            billpaymentsMainViewAmountTextField.text = ""
            numpadBtnPressed(button: billpaymentsMainViewTwoButton, label: billpaymentsMainViewAmountTextField)
        }else {
            
            numpadBtnPressed(button: billpaymentsMainViewTwoButton, label: billpaymentsMainViewAmountTextField)
        }
    
    }
    
    @objc func billpaymentsMainViewThreeButtonPressed(){
        
        numpadBtnPressed(button: billpaymentsMainViewThreeButton, label: billpaymentsMainViewAmountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS MAIN VIEW KEYBOARD ROW TWO STACKVIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentsMainRowTwoStackView() -> UIStackView {
        
        billpaymentsMainViewFourButton.layer.cornerRadius = 3
        billpaymentsMainViewFourButton.backgroundColor = UIColor.white
        billpaymentsMainViewFourButton.setTitleColor(UIColor.black, for: .normal)
        billpaymentsMainViewFiveButton.layer.cornerRadius = 3
        billpaymentsMainViewFiveButton.backgroundColor = UIColor.white
        billpaymentsMainViewFiveButton.setTitleColor(UIColor.black, for: .normal)
        billpaymentsMainViewSixButton.layer.cornerRadius = 3
        billpaymentsMainViewSixButton.backgroundColor = UIColor.white
        billpaymentsMainViewSixButton.setTitleColor(UIColor.black, for: .normal)
        
        billpaymentsMainViewFourButton.addTarget(self, action: #selector(billpaymentsMainViewFourButtonPressed), for: .touchUpInside)
        billpaymentsMainViewFiveButton.addTarget(self, action: #selector(billpaymentsMainViewFiveButtonPressed), for: .touchUpInside)
        billpaymentsMainViewSixButton.addTarget(self, action: #selector(billpaymentsMainViewSixButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [billpaymentsMainViewFourButton, billpaymentsMainViewFiveButton, billpaymentsMainViewSixButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
     //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS MAIN VIEW ROW TWO BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func billpaymentsMainViewFourButtonPressed() {
        
        if handlePlaceholder(text: billpaymentsMainViewAmountTextField.text!) {
            
            billpaymentsMainViewAmountTextField.text = ""
            numpadBtnPressed(button: billpaymentsMainViewFourButton, label: billpaymentsMainViewAmountTextField)
        }else {
        
        numpadBtnPressed(button: billpaymentsMainViewFourButton, label: billpaymentsMainViewAmountTextField)
            
        }
    }
    
    
    @objc func billpaymentsMainViewFiveButtonPressed() {
        
        if handlePlaceholder(text: billpaymentsMainViewAmountTextField.text!) {
            
            billpaymentsMainViewAmountTextField.text = ""
            numpadBtnPressed(button: billpaymentsMainViewFiveButton, label: billpaymentsMainViewAmountTextField)
        }else {
        
        numpadBtnPressed(button: billpaymentsMainViewFiveButton, label: billpaymentsMainViewAmountTextField)
            
        }
    }
    
    
    @objc func billpaymentsMainViewSixButtonPressed() {
        
        if handlePlaceholder(text: billpaymentsMainViewAmountTextField.text!) {
            
            billpaymentsMainViewAmountTextField.text = ""
            numpadBtnPressed(button: billpaymentsMainViewSixButton, label: billpaymentsMainViewAmountTextField)
        }else {
        
        numpadBtnPressed(button: billpaymentsMainViewSixButton, label: billpaymentsMainViewAmountTextField)
            
        }
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS MAIN VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentsRowThreeStackView() -> UIStackView {
        
        billpaymentsMainViewSevenButton.layer.cornerRadius = 3
        billpaymentsMainViewSevenButton.backgroundColor = UIColor.white
        billpaymentsMainViewSevenButton.setTitleColor(UIColor.black, for: .normal)
        billpaymentsMainViewEightButton.layer.cornerRadius = 3
        billpaymentsMainViewEightButton.backgroundColor = UIColor.white
        billpaymentsMainViewEightButton.setTitleColor(UIColor.black, for: .normal)
        billpaymentsMainViewNineButton.layer.cornerRadius = 3
        billpaymentsMainViewNineButton.backgroundColor = UIColor.white
        billpaymentsMainViewNineButton.setTitleColor(UIColor.black, for: .normal)
        
        
        billpaymentsMainViewSevenButton.addTarget(self, action: #selector(billpaymentsMainViewSevenButtonPressed), for: .touchUpInside)
        billpaymentsMainViewEightButton.addTarget(self, action: #selector(billpaymentsMainViewEightButtonPressed), for: .touchUpInside)
        billpaymentsMainViewNineButton.addTarget(self, action: #selector(billpaymentsMainViewNineButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [billpaymentsMainViewSevenButton, billpaymentsMainViewEightButton, billpaymentsMainViewNineButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS MAIN VIEW ROW THREE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func billpaymentsMainViewSevenButtonPressed() {
        
        
        if handlePlaceholder(text: billpaymentsMainViewAmountTextField.text!) {
            
            billpaymentsMainViewAmountTextField.text = ""
            numpadBtnPressed(button: billpaymentsMainViewSevenButton, label: billpaymentsMainViewAmountTextField)
            
        }else {
       
            numpadBtnPressed(button: billpaymentsMainViewSevenButton, label: billpaymentsMainViewAmountTextField)
            
        }
        
        
        
    }
    
    @objc func billpaymentsMainViewEightButtonPressed() {
        
        if handlePlaceholder(text: billpaymentsMainViewAmountTextField.text!) {
            
            billpaymentsMainViewAmountTextField.text = ""
            numpadBtnPressed(button: billpaymentsMainViewEightButton, label: billpaymentsMainViewAmountTextField)
        }else {
    
        numpadBtnPressed(button: billpaymentsMainViewEightButton, label: billpaymentsMainViewAmountTextField)
            
        }
    }
    
    
    @objc func billpaymentsMainViewNineButtonPressed() {
        
        if handlePlaceholder(text: billpaymentsMainViewAmountTextField.text!) {
            
            billpaymentsMainViewAmountTextField.text = ""
            numpadBtnPressed(button: billpaymentsMainViewNineButton, label: billpaymentsMainViewAmountTextField)
        }else {

        numpadBtnPressed(button: billpaymentsMainViewNineButton, label: billpaymentsMainViewAmountTextField)
            
        }
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS MAIN VIEW KEYBOARD ROW FOUR STACKVIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentsRowFourStackView() -> UIStackView {
        
        billpaymentsMainViewZeroButton.layer.cornerRadius = 3
        billpaymentsMainViewZeroButton.backgroundColor = UIColor.white
        billpaymentsMainViewZeroButton.setTitleColor(UIColor.black, for: .normal)
        billpaymentsMainViewDecimalButton.layer.cornerRadius = 3
        billpaymentsMainViewDecimalButton.backgroundColor = UIColor.white
        billpaymentsMainViewDecimalButton.setTitleColor(UIColor.black, for: .normal)
        billpaymentsMainViewDeleteButton.layer.cornerRadius = 3
        billpaymentsMainViewDeleteButton.backgroundColor = UIColor.white
//        billpaymentsMainViewDeleteButton.setTitleColor(UIColor.black, for: .normal)
        
        billpaymentsMainViewZeroButton.addTarget(self, action: #selector(billpaymentsMainViewZeroButtonPressed), for: .touchUpInside)
        billpaymentsMainViewDecimalButton.addTarget(self, action: #selector(billpaymentsMainViewDecimalButtonPressed), for: .touchUpInside)
        billpaymentsMainViewDeleteButton.addTarget(self, action: #selector(billpaymentsMainViewDeleteButtonPressed), for: .touchUpInside)
        
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [billpaymentsMainViewZeroButton, billpaymentsMainViewDecimalButton, billpaymentsMainViewDeleteButton])
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
    
    @objc func billpaymentsMainViewZeroButtonPressed(){

        if handlePlaceholder(text: billpaymentsMainViewAmountTextField.text!) {
            
            billpaymentsMainViewAmountTextField.text = ""
            numpadBtnPressed(button: billpaymentsMainViewZeroButton, label: billpaymentsMainViewAmountTextField)
            
            
        }else {
          
            numpadBtnPressed(button: billpaymentsMainViewZeroButton, label: billpaymentsMainViewAmountTextField)
            
        }
    }
    
    
    @objc func billpaymentsMainViewDecimalButtonPressed(){
        
        if handlePlaceholder(text: billpaymentsMainViewAmountTextField.text!) {
            
            billpaymentsMainViewAmountTextField.text = ""
            numpadBtnPressed(button: billpaymentsMainViewDecimalButton, label: billpaymentsMainViewAmountTextField)
            
        }else {
    
        numpadBtnPressed(button: billpaymentsMainViewDecimalButton, label: billpaymentsMainViewAmountTextField)
            
        }
    }
    
    
    @objc func billpaymentsMainViewDeleteButtonPressed(){
        
        if handlePlaceholder(text: billpaymentsMainViewAmountTextField.text!) {
            
            billpaymentsMainViewAmountTextField.text = ""
           
        }else{
            
        numpadClearBtnPressed(button: billpaymentsMainViewDeleteButton, label: billpaymentsMainViewAmountTextField)
            
        }
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS KEYBOARD PARENT STACKVIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentsKeyBoardParentStackView(){
        
        let pStackView = Controls().theParentStackView(buttons: [makeBillPaymentsMainViewRowOneStackView(), makeBillPaymentsMainRowTwoStackView(), makeBillPaymentsRowThreeStackView(), makeBillPaymentsRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 6
        billpaymentsMainViewKeyboardContainer.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: billpaymentsMainViewKeyboardContainer.leftAnchor).isActive = true
        pStackView.rightAnchor.constraint(equalTo: billpaymentsMainViewKeyboardContainer.rightAnchor).isActive = true
        pStackView.topAnchor.constraint(equalTo: billpaymentsMainViewKeyboardContainer.topAnchor).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: billpaymentsMainViewKeyboardContainer.bottomAnchor).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- HANDLE PLACEHOLDER METHOD
    //----------------------------------------------------------------
    
    func handlePlaceholder(text: String) -> Bool {
        
        var isClearlaceholder = false
        
        if billpaymentsMainViewAmountTextField.text == "Type your bill account number" {
            
            isClearlaceholder = true
            
        }else if airtimeNumberTextField.text == "Type the reciepient number" {
            
            isClearlaceholder = true
        }
        
        return isClearlaceholder
    }
    
    
    func handleAirtimePlaceholder(text: String) -> Bool {
        
        var isClearlaceholder = false
        
        if airtimeNumberTextField.text == "Type the reciepient number" {
            
            isClearlaceholder = true
        }
        
        return isClearlaceholder
        
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
}

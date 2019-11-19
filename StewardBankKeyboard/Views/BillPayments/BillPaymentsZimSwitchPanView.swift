//
//  BillPaymentsZimSwitchPanView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/5/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit

extension KeyboardViewController {
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS ZIMSWITCH PAN VIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentsZimSwitchPanView(){
        
        billPaymentZimSwitchPanView.backgroundColor = Theme.LighterGray
        billPaymentZimSwitchPanView.layer.cornerRadius = 0
        view.addSubview(billPaymentZimSwitchPanView)
        setupBillPaymentsZimSwitchPan()
        makeBillPaymentZimswitchViewTopContainer()
        makeBillPaymentsZimswitchKeyboardViewContainer()
        
    
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILLPAYMENT ZIMSWITCH PAN VIEW TOP CONTAINER
    //----------------------------------------------------------------
    
    func makeBillPaymentZimswitchViewTopContainer(){
        
        billPaymentZimSwitchPanTopContainer.backgroundColor = Theme.LighterGray
        billPaymentZimSwitchPanTopContainer.layer.cornerRadius = 0
        billPaymentZimSwitchPanView.addSubview(billPaymentZimSwitchPanTopContainer)
        
        billPaymentZimSwitchPanTopContainer.topAnchor.constraint(equalTo: billPaymentZimSwitchPanView.topAnchor).isActive = true
        billPaymentZimSwitchPanTopContainer.leftAnchor.constraint(equalTo: billPaymentZimSwitchPanView.leftAnchor).isActive = true
        billPaymentZimSwitchPanTopContainer.rightAnchor.constraint(equalTo: billPaymentZimSwitchPanView.rightAnchor).isActive = true
        billPaymentZimSwitchPanTopContainer.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        makeBillPaymentsZimswitchTopContainerLabel()
        makeBIllPaymentZimSwitchViewBackButton()
        makeBillPaymentZimSwitchViewRightButton()
        makebillPaymentsZimswitchTopContainerTextField()
        
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENT ZIMSWITCH PAN TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeBillPaymentsZimswitchTopContainerLabel(){
        
        billPaymentZimSwitchPanTopContainer.addSubview(billPaymentZimSwitchPanTopContainerLabel)
        billPaymentZimSwitchPanTopContainerLabel.textAlignment = .center
        
        billPaymentZimSwitchPanTopContainerLabel.topAnchor.constraint(equalTo: billPaymentsTopContainer.topAnchor, constant: 3).isActive = true
        billPaymentZimSwitchPanTopContainerLabel.leftAnchor.constraint(equalTo: billPaymentsTopContainer.leftAnchor, constant: 3).isActive = true
        billPaymentZimSwitchPanTopContainerLabel.rightAnchor.constraint(equalTo: billPaymentsTopContainer.rightAnchor, constant: 3).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENT ZIMSWITCH PAN VIEW BACK BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeBIllPaymentZimSwitchViewBackButton(){
        
        billPaymentZimSwitchPanBackBtn.layer.cornerRadius = 15
        billPaymentZimSwitchPanTopContainer.addSubview(billPaymentZimSwitchPanBackBtn)
        
        
        billPaymentZimSwitchPanBackBtn.addTarget(self, action: #selector(billPaymentsZimswitchViewBackButtonPressed), for: .touchUpInside)
        
        billPaymentZimSwitchPanBackBtn.topAnchor.constraint(equalTo: billPaymentZimSwitchPanTopContainerLabel.bottomAnchor, constant: 2).isActive = true
        billPaymentZimSwitchPanBackBtn.leftAnchor.constraint(equalTo: billPaymentZimSwitchPanTopContainer.leftAnchor, constant: 8).isActive = true
        billPaymentZimSwitchPanBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        billPaymentZimSwitchPanBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS ZIMSWITCH BACK BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func billPaymentsZimswitchViewBackButtonPressed(){
        
        billPaymentZimSwitchPanView.removeFromSuperview()
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS ZIMSWITCH PAN VIEW RIGHT BUTTON VIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentZimSwitchViewRightButton(){
        
        billPaymentZimSwitchPanRightBtn.layer.cornerRadius = 15
        billPaymentZimSwitchPanTopContainer.addSubview(billPaymentZimSwitchPanRightBtn)
       
        
        billPaymentZimSwitchPanRightBtn.addTarget(self, action: #selector(billPaymentsZimswitchRightBtnPressed), for: .touchUpInside)
        
        billPaymentZimSwitchPanRightBtn.topAnchor.constraint(equalTo: billPaymentZimSwitchPanTopContainerLabel.bottomAnchor, constant: 2).isActive = true
        billPaymentZimSwitchPanRightBtn.rightAnchor.constraint(equalTo: billPaymentZimSwitchPanTopContainer.rightAnchor, constant: -8).isActive = true
        billPaymentZimSwitchPanRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        billPaymentZimSwitchPanRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS RIGHT BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func billPaymentsZimswitchRightBtnPressed(){
        
        if billPaymentZimSwitchPanTextField.text?.isEmpty ?? true {
            
            showValidationView(message: "Please enter a valid full card number")
            
        }else {
            
            BILLPANNUMBER = billPaymentZimSwitchPanTextField.text!
            
            if isExpiryNeeded(cardNumber: BILLPANNUMBER) {
                
                KeyboardSharedPreferences().setBillPaymentZimswitchStatus(billZimStatus: "1")
                KeyboardSharedPreferences().setIsExpiry(isExpiry: "1")
                makeExpiryView()
                
            }else {
                
                makebillPaymentsPinView()
            }
            
        }
    
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS ZIMSWITCH TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makebillPaymentsZimswitchTopContainerTextField(){
        
        billPaymentZimSwitchPanTopContainer.addSubview(billPaymentZimSwitchPanTextField)
        billPaymentZimSwitchPanTextField.textAlignment = .center
        billPaymentZimSwitchPanTextField.backgroundColor = UIColor.white
        billPaymentZimSwitchPanTextField.layer.cornerRadius = 5
        billPaymentZimSwitchPanTextField.layer.masksToBounds = true
        billPaymentZimSwitchPanTextField.textColor = UIColor.gray
        
        billPaymentZimSwitchPanTextField.centerYAnchor.constraint(equalTo: billPaymentZimSwitchPanBackBtn.centerYAnchor).isActive = true
        billPaymentZimSwitchPanTextField.leftAnchor.constraint(equalTo: billPaymentZimSwitchPanBackBtn.rightAnchor, constant: 30).isActive = true
        billPaymentZimSwitchPanTextField.rightAnchor.constraint(equalTo: billPaymentZimSwitchPanRightBtn.leftAnchor, constant: -30).isActive = true
        billPaymentZimSwitchPanTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS ZIMSWITCH VIEW KEYBOARD CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentsZimswitchKeyboardViewContainer(){
        
        billPaymentZimSwitchPanKeyboardContainer.backgroundColor = UIColor.clear
        billPaymentZimSwitchPanKeyboardContainer.layer.cornerRadius = 0
        billPaymentZimSwitchPanView.addSubview(billPaymentZimSwitchPanKeyboardContainer)
        
        billPaymentZimSwitchPanKeyboardContainer.topAnchor.constraint(equalTo: billPaymentZimSwitchPanTopContainer.bottomAnchor, constant: 6).isActive = true
        billPaymentZimSwitchPanKeyboardContainer.leftAnchor.constraint(equalTo: billPaymentZimSwitchPanView.leftAnchor, constant: 6).isActive = true
        billPaymentZimSwitchPanKeyboardContainer.rightAnchor.constraint(equalTo: billPaymentZimSwitchPanView.rightAnchor, constant: -6).isActive = true
        billPaymentZimSwitchPanKeyboardContainer.bottomAnchor.constraint(equalTo: billPaymentZimSwitchPanView.bottomAnchor, constant: -6).isActive = true
        
        makeBillPaymentsZimswitchKeyBoardParentStackView()
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS ZIMSWITCH PAN VIEW KEYBOARD ROW ONE STACKVIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentsZimswitchRowOneStackView() -> UIStackView {
        
        billPaymentZimSwitchPanOneButton.layer.cornerRadius = 3
        billPaymentZimSwitchPanOneButton.backgroundColor = UIColor.white
        billPaymentZimSwitchPanOneButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentZimSwitchPanTwoButton.layer.cornerRadius = 3
        billPaymentZimSwitchPanTwoButton.backgroundColor = UIColor.white
        billPaymentZimSwitchPanTwoButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentZimSwitchPanThreeButton.layer.cornerRadius = 3
        billPaymentZimSwitchPanThreeButton.backgroundColor = UIColor.white
        billPaymentZimSwitchPanThreeButton.setTitleColor(UIColor.black, for: .normal)
        
        billPaymentZimSwitchPanOneButton.addTarget(self, action: #selector(billPaymentZimSwitchPanOneButtonPressed), for: .touchUpInside)
        billPaymentZimSwitchPanTwoButton.addTarget(self, action: #selector(billPaymentZimSwitchPanTwoButtonPressed), for: .touchUpInside)
        billPaymentZimSwitchPanThreeButton.addTarget(self, action: #selector(billPaymentZimSwitchPanThreeButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [billPaymentZimSwitchPanOneButton, billPaymentZimSwitchPanTwoButton, billPaymentZimSwitchPanThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS ZIMSWITCH PAN ROW ONE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func billPaymentZimSwitchPanOneButtonPressed(){
        
        numpadBtnPressed(button: billPaymentZimSwitchPanOneButton, label: billPaymentZimSwitchPanTextField)
        
    }
    
    @objc func billPaymentZimSwitchPanTwoButtonPressed(){
        
        numpadBtnPressed(button: billPaymentZimSwitchPanTwoButton, label: billPaymentZimSwitchPanTextField)
        
    }
    
    @objc func billPaymentZimSwitchPanThreeButtonPressed(){
        
        numpadBtnPressed(button: billPaymentZimSwitchPanThreeButton, label: billPaymentZimSwitchPanTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTSS ZIMSWITCH VIEW KEYBOARD ROW TWO STACKVIEW
    //----------------------------------------------------------------
    
    func makebillPaymentsZimswitchRowTwoStackView() -> UIStackView {
        
        billPaymentZimSwitchPanFourButton.layer.cornerRadius = 3
        billPaymentZimSwitchPanFourButton.backgroundColor = UIColor.white
        billPaymentZimSwitchPanFourButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentZimSwitchPanFiveButton.layer.cornerRadius = 3
        billPaymentZimSwitchPanFiveButton.backgroundColor = UIColor.white
        billPaymentZimSwitchPanFiveButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentZimSwitchPanSixButton.layer.cornerRadius = 3
        billPaymentZimSwitchPanSixButton.backgroundColor = UIColor.white
        billPaymentZimSwitchPanSixButton.setTitleColor(UIColor.black, for: .normal)
        
        billPaymentZimSwitchPanFourButton.addTarget(self, action: #selector(billPaymentZimSwitchPanFourButtonPressed), for: .touchUpInside)
        billPaymentZimSwitchPanFiveButton.addTarget(self, action: #selector(billPaymentZimSwitchPanFiveButtonPressed), for: .touchUpInside)
        billPaymentZimSwitchPanSixButton.addTarget(self, action: #selector(billPaymentZimSwitchPanSixButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [billPaymentZimSwitchPanFourButton, billPaymentZimSwitchPanFiveButton, billPaymentZimSwitchPanSixButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS ZIMSWITCH  ROW TWO BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func billPaymentZimSwitchPanFourButtonPressed(){
        
        numpadBtnPressed(button: billPaymentZimSwitchPanFourButton, label: billPaymentZimSwitchPanTextField)
        
    }
    
    @objc func billPaymentZimSwitchPanFiveButtonPressed(){
        
        numpadBtnPressed(button: billPaymentsAmountFiveButton, label: billPaymentZimSwitchPanTextField)
        
    }
    
    @objc func billPaymentZimSwitchPanSixButtonPressed(){
        
        numpadBtnPressed(button: billPaymentZimSwitchPanSixButton, label: billPaymentZimSwitchPanTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS ZIMSWITCH PAN VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makebillPaymentsZimswitchRowThreeStackView() -> UIStackView {
        
        billPaymentZimSwitchPanSevenButton.layer.cornerRadius = 3
        billPaymentZimSwitchPanSevenButton.backgroundColor = UIColor.white
        billPaymentZimSwitchPanSevenButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentZimSwitchPanEightButton.layer.cornerRadius = 3
        billPaymentZimSwitchPanEightButton.backgroundColor = UIColor.white
        billPaymentZimSwitchPanEightButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentZimSwitchPanNineButton.layer.cornerRadius = 3
        billPaymentZimSwitchPanNineButton.backgroundColor = UIColor.white
        billPaymentZimSwitchPanNineButton.setTitleColor(UIColor.black, for: .normal)
        
        billPaymentZimSwitchPanSevenButton.addTarget(self, action: #selector(billPaymentZimSwitchPanSevenButtonPressed), for: .touchUpInside)
        billPaymentZimSwitchPanEightButton.addTarget(self, action: #selector(billPaymentZimSwitchPanEightButtonPressed), for: .touchUpInside)
        billPaymentZimSwitchPanNineButton.addTarget(self, action: #selector(billPaymentZimSwitchPanNineButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [billPaymentZimSwitchPanSevenButton, billPaymentZimSwitchPanEightButton, billPaymentZimSwitchPanNineButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
     //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS ZIMSWITCH ROW THREE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func billPaymentZimSwitchPanSevenButtonPressed(){
        
        numpadBtnPressed(button: billPaymentZimSwitchPanSevenButton, label: billPaymentZimSwitchPanTextField)
        
    }
    
    @objc func billPaymentZimSwitchPanEightButtonPressed(){
        
        numpadBtnPressed(button: billPaymentZimSwitchPanEightButton, label: billPaymentZimSwitchPanTextField)
        
    }
    
    @objc func billPaymentZimSwitchPanNineButtonPressed(){
        
        numpadBtnPressed(button: billPaymentsAmountNineButton, label: billPaymentZimSwitchPanTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS ZIMSWITCH PAN VIEW KEYBOARD ROW FOUR STACKVIEW
    //----------------------------------------------------------------
    
    func makebillPaymentsZimswitchRowFourStackView() -> UIStackView {
        
        billPaymentZimSwitchPanZeroButton.layer.cornerRadius = 3
        billPaymentZimSwitchPanZeroButton.backgroundColor = UIColor.white
        billPaymentZimSwitchPanZeroButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentZimSwitchPanDecimalButton.layer.cornerRadius = 3
        billPaymentZimSwitchPanDecimalButton.backgroundColor = UIColor.white
        billPaymentZimSwitchPanDecimalButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentZimSwitchPanDeleteButton.layer.cornerRadius = 3
        billPaymentZimSwitchPanDeleteButton.backgroundColor = UIColor.white
        billPaymentZimSwitchPanDeleteButton.setTitleColor(UIColor.black, for: .normal)
        
        billPaymentZimSwitchPanZeroButton.addTarget(self, action: #selector(billPaymentZimSwitchPanZeroButtonPressed), for: .touchUpInside)
        billPaymentZimSwitchPanDecimalButton.addTarget(self, action: #selector(billPaymentZimSwitchPanDecimalButtonPressed), for: .touchUpInside)
        billPaymentZimSwitchPanDeleteButton.addTarget(self, action: #selector(billPaymentZimSwitchPanDeleteButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [billPaymentZimSwitchPanZeroButton, billPaymentZimSwitchPanDecimalButton, billPaymentZimSwitchPanDeleteButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS ZIMSWITCH ROW FOUR BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func billPaymentZimSwitchPanZeroButtonPressed(){
        
        numpadBtnPressed(button: billPaymentZimSwitchPanZeroButton, label: billPaymentZimSwitchPanTextField)
        
    }
    
    @objc func billPaymentZimSwitchPanDecimalButtonPressed(){
        
        numpadBtnPressed(button: billPaymentZimSwitchPanDecimalButton, label: billPaymentZimSwitchPanTextField)
        
    }
    
    @objc func billPaymentZimSwitchPanDeleteButtonPressed(){
        
        numpadClearBtnPressed(button: billPaymentZimSwitchPanDeleteButton, label: billPaymentZimSwitchPanTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS PAN KEYBOARD PARENT STACKVIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentsZimswitchKeyBoardParentStackView(){
        
        let pStackView = Controls().theParentStackView(buttons: [makeBillPaymentsZimswitchRowOneStackView(), makebillPaymentsZimswitchRowTwoStackView(), makebillPaymentsZimswitchRowThreeStackView(), makebillPaymentsZimswitchRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 6
        billPaymentZimSwitchPanView.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: billPaymentZimSwitchPanKeyboardContainer.leftAnchor).isActive = true
        pStackView.rightAnchor.constraint(equalTo: billPaymentZimSwitchPanKeyboardContainer.rightAnchor).isActive = true
        pStackView.topAnchor.constraint(equalTo: billPaymentZimSwitchPanKeyboardContainer.topAnchor).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: billPaymentZimSwitchPanKeyboardContainer.bottomAnchor).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET BILL PAYMENTS ZIMSWITCH PAN VIEW CONSTRAINTS
    //----------------------------------------------------------------
    
    func setupBillPaymentsZimSwitchPan(){
        
        billPaymentZimSwitchPanView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        billPaymentZimSwitchPanView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        billPaymentZimSwitchPanView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        billPaymentZimSwitchPanView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
}

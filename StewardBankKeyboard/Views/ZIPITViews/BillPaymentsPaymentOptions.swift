//
//  BillPaymentsPaymentOptions.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/5/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper



extension KeyboardViewController{
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILLPAYMENTS PAYMENT OPTIONS VIEW.
    //----------------------------------------------------------------
    
    func makeBillPaymentsOptionsView(){
        
        
        billPaymentOptionsView.backgroundColor = UIColor.lightGray
        billPaymentOptionsView.layer.cornerRadius = 0
        view.addSubview(billPaymentOptionsView)
        setupBilPaymentsOptionsConstraints()
        makeBillPaymentsOptionBackBtn()
        makeBillPaymentsOptionLabel()
        makeBillPaymentsOptionContainerView()
        makeBillPaymentOptionsRowOneStackView()
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS OPTIONS LABEL
    //----------------------------------------------------------------
    
    
    func makeBillPaymentsOptionLabel(){
    
        billPaymentOptionsView.addSubview(billPaymentsOptionLabel)
        billPaymentsOptionLabel.textAlignment = .center
        
        
        billPaymentsOptionLabel.centerYAnchor.constraint(equalTo: billPaymentsOptionBackBtn.centerYAnchor).isActive = true
        billPaymentsOptionLabel.leftAnchor.constraint(equalTo: billPaymentsOptionBackBtn.leftAnchor, constant: 3).isActive = true
        billPaymentsOptionLabel.rightAnchor.constraint(equalTo: billPaymentOptionsView.rightAnchor, constant: 3).isActive = true
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS OPTIONS BACK BUTTON
    //----------------------------------------------------------------
    
    func makeBillPaymentsOptionBackBtn(){
        
        billPaymentOptionsView.addSubview(billPaymentsOptionBackBtn)
        billPaymentsOptionBackBtn.layer.cornerRadius = 15
        
        
        billPaymentsOptionBackBtn.addTarget(self, action: #selector(billPaymentsOptionBackBtnPressed), for: .touchUpInside)
        
        billPaymentsOptionBackBtn.topAnchor.constraint(equalTo: billPaymentOptionsView.topAnchor, constant: 20).isActive = true
        billPaymentsOptionBackBtn.leftAnchor.constraint(equalTo: billPaymentOptionsView.leftAnchor, constant: 20).isActive = true
        billPaymentsOptionBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        billPaymentsOptionBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS BACK BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func billPaymentsOptionBackBtnPressed(){
        
        billPaymentOptionsView.removeFromSuperview()
        
    }
    
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENT OPTIONS CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentsOptionContainerView(){
        
        billPaymentOptionsView.addSubview(billPaymentOptionContainerView)
        billPaymentOptionContainerView.backgroundColor = UIColor.lightGray
        
        billPaymentOptionContainerView.topAnchor.constraint(equalTo: billPaymentsOptionLabel.bottomAnchor, constant: 20).isActive = true
        billPaymentOptionContainerView.rightAnchor.constraint(equalTo: billPaymentOptionsView.rightAnchor, constant: -20).isActive = true
        billPaymentOptionContainerView.leftAnchor.constraint(equalTo: billPaymentOptionsView.leftAnchor, constant: 20).isActive = true
        billPaymentOptionContainerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENT OPTIONS STACK VIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentOptionsRowOneStackView() {
        
        //        airtimePaymentsOptionsStewardImgView.contentMode = .scaleAspectFit
        //        airtimePaymentOptionsEcocashImgView.contentMode = .scaleAspectFit
        
        let hstackView = Controls().theHorizontalImageViewStackView(imageViews: [billPaymentOptionsEcocash, billPaymentOptionsStewardBank, billPaymentOptionsZimSwitch])
        hstackView.axis = .horizontal
        hstackView.distribution = .fillEqually
        hstackView.spacing = 5
        
        billPaymentOptionContainerView.addSubview(hstackView)
        hstackView.topAnchor.constraint(equalTo: billPaymentOptionContainerView.topAnchor, constant: 3).isActive = true
        hstackView.leftAnchor.constraint(equalTo: billPaymentOptionContainerView.leftAnchor, constant: 3).isActive = true
        hstackView.rightAnchor.constraint(equalTo: billPaymentOptionContainerView.rightAnchor, constant: -3).isActive = true
        hstackView.bottomAnchor.constraint(equalTo: billPaymentOptionContainerView.bottomAnchor, constant: -3).isActive = true
        
        billPaymentEcocashClicked()
        billPaymentStewardClicked()
        billPaymentZimswitchClicked()
    }

    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILLPAYMENT ECOCASH CLICKED
    //----------------------------------------------------------------
    
    func billPaymentEcocashClicked(){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.billPaymentEcocashPressed(_:)))
        billPaymentOptionsEcocash.isUserInteractionEnabled = true
        billPaymentOptionsEcocash.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func billPaymentEcocashPressed(_ sender: AnyObject){
        
        let billAuthUrl = BaseEndPoint.LOCAL_BASE_URL + "/api/billpayengine/secured/thirdParty/billAuth"
        
        
        print(KeyboardSharedPreferences().getBillAccountNumber()!)
        print(KeyboardSharedPreferences().getBillPaymentAmount()!)
        print(SharedPreference.getPhoneNumber()!)
        print(KeyboardSharedPreferences().getBillerCode()!)
        
        
        let parameters = Mapper().toJSON(OtherBillersAuthPostModel(billAccount: KeyboardSharedPreferences().getBillAccountNumber()!, billAmount: KeyboardSharedPreferences().getBillPaymentAmount()!, cardReference: "1234560000000001", channel: "SOSHO", debitAccountNumber: "1000000000", debitCurrency: "USD", payerMsisdn: SharedPreference.getPhoneNumber()!, provider: KeyboardSharedPreferences().getBillerCode()!, providerProduct: KeyboardSharedPreferences().getBillerCode()!))
        
        
        billPaymentEcocashAuth(url: billAuthUrl, parameters: parameters)
        
        
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILLPAYMENT STEWARD BANK CLICKED
    //----------------------------------------------------------------
    
    func billPaymentStewardClicked(){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.billPaymentStewardPressed(_:)))
        billPaymentOptionsStewardBank.isUserInteractionEnabled = true
        billPaymentOptionsStewardBank.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func billPaymentStewardPressed(_ sender: AnyObject){
    
        KeyboardSharedPreferences().setSquareBillPaymentStatus(squareBillPaymentStatus: "1")
        makebillPaymentsPinView()
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILLPAYMENT ZIMSWITCH BANK CLICKED
    //----------------------------------------------------------------
    
    func billPaymentZimswitchClicked(){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.billPaymentZimswitchPressed(_:)))
        billPaymentOptionsZimSwitch.isUserInteractionEnabled = true
        billPaymentOptionsZimSwitch.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func billPaymentZimswitchPressed(_ sender: AnyObject){
        
        BILLPANNUMBER = billPaymentZimSwitchPanTextField.text!
        makeBillPaymentsZimSwitchPanView()
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET UP BILLPAYMENTS PAYMENT OPTIONS
    //----------------------------------------------------------------
    
    func setupBilPaymentsOptionsConstraints(){
        
        billPaymentOptionsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        billPaymentOptionsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        billPaymentOptionsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        billPaymentOptionsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS ECOCASH PAY REQUEST METHOD
    //----------------------------------------------------------------
    
    
    func billEcocashPay(url: String, parameters: [String: Any]){
        
        print("ECOCASH PAY ZIPIT URL: \(url)")
        print("ECOCASH PAY ZIPIT PARAMETERS: \(parameters)")
        
        makeProgressParticleProgressBar(containingView: billPaymentOptionsView)
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: EcocashPayModel?, error) in
            
            if error != nil {
                
                
                print("ERROR")
                
                self.stopParticleProgressDialog(generalProgressLabel: "Error", generalProgressConfirmLabel: "An error ocurred", generalBtnVisibility: false)
                
            }else {
                
                
                if response!.message == "SUCCESS" {
                    
                    self.ASSOCIATEDCODE = response!.responseBody!.associatedCode!
                    self.ECOCASHSTATUS = response!.responseBody!.ecocashStatus!
                    self.ID = response!.responseBody!.id!
                    self.STATUS = response!.responseBody!.status!
                    self.AMOUNT = response!.responseBody!.amount!
                    self.CORRELATER = response!.responseBody!.correlater!
                    self.REFERENCE = response!.responseBody!.reference!
                    self.ECOCASHREFERENCE = response!.responseBody!.ecocashReference!
                    self.PHONE = response!.responseBody!.phone!
                    
                    
                    SharedPreference.setEcocashPaymentParams(
                        amount: response!.responseBody!.amount!,
                        associatedCode: response!.responseBody!.associatedCode!,
                        correlater: response!.responseBody!.correlater!,
                        reference: response!.responseBody!.reference!,
                        status: response!.responseBody!.status!,
                        ecocashReference: response!.responseBody!.ecocashReference!,
                        ecocashStatus: response!.responseBody!.ecocashStatus!,
                        phone: response!.responseBody!.phone!,
                        id: response!.responseBody!.id!)
                    
                    SharedPreference.setEcocashPaymentStatus(ecocashpaymentstatus: "1")
                    
//                    self.stopParticleProgressDialog(generalProgressLabel: response!.message!, generalProgressConfirmLabel: "SUCCESS", generalBtnVisibility: true)
                    self.dismissParticleProgresssDialog()
                    
                    self.makeNumericKeyboardView()
                    
                }else {
                    
                    print(response!.message!)
                    self.stopParticleProgressDialog(generalProgressLabel: response!.message!, generalProgressConfirmLabel: "FAILED", generalBtnVisibility: true)
                    
                }
                
                
                print(response!.toJSONString(prettyPrint: true)!)
                
            }
            
        }
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILLPAYMENT ECOCASH AUTH METHOD REQUEST
    //----------------------------------------------------------------
    
    func  billPaymentEcocashAuth(url: String, parameters: [String: Any]){
        
        print("BILL PAYMENT ECOCASH AUTH URL: \(url)")
        print("O6THER BILLERS AUTH PARAMETERS: \(parameters)")
        
        makeProgressParticleProgressBar(containingView: billPaymentOptionsView)
        
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: OtherBillersAuthModel?, error) in
            
            if error != nil {
                
                print("Error: \(error.debugDescription)")
                
                self.stopParticleProgressDialog(generalProgressLabel: "Error", generalProgressConfirmLabel: "Error Occured", generalBtnVisibility: false)
                
            }else {
                
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message == "SUCCESS" {
                    
                    self.dismissParticleProgresssDialog()
                    
                    KeyboardSharedPreferences().setBillAuthToken(billToken: response!.responseBody!)
                    
                    
                    let billPaymentEcocashurl = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/ecocashcontainer/secured/ecocash/pay"
                    
                    
                    let billPaymentParameters = Mapper().toJSON(EcocashPayPostModel(amount: KeyboardSharedPreferences().getBillPaymentAmount()!, channel: Channel.transactionChannel(), biller: KeyboardSharedPreferences().getBillerCode()!, phone: SharedPreference.getEcocashEcocashPhone()!))
                    
                    
                    self.ecocashBillPaymentPay(url: billPaymentEcocashurl, parameters: billPaymentParameters)
                    
                   
                    
                    
                }else {
                    
                    self.stopParticleProgressDialog(generalProgressLabel: "Error", generalProgressConfirmLabel: response!.message!, generalBtnVisibility: false)
                    
                }
                
            }
            
        }
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ECOCASH BILL PAYMENTS PAY REQUEST METHOD
    //----------------------------------------------------------------
    
    
    func ecocashBillPaymentPay(url: String, parameters: [String: Any]){
        
        print("ECOCASH BILL PAYMENT PAY URL: \(url)")
        print("ECOCASH BILL PAYMENT PARAMETERS: \(parameters)")
        
        makeProgressParticleProgressBar(containingView: billPaymentOptionsView)
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: EcocashPayModel?, error) in
            
            if error != nil {
                
                
                print("ERROR")
                
                self.stopParticleProgressDialog(generalProgressLabel: "Error", generalProgressConfirmLabel: "An error ocurred", generalBtnVisibility: false)
                
            }else {
                
                print(response!.toJSONString(prettyPrint: true)!)

                
                if response!.message == "SUCCESS" {
                    
                    //                    self.ASSOCIATEDCODE = response!.responseBody!.associatedCode!
                    self.ECOCASHSTATUS = response!.responseBody!.ecocashStatus!
                    self.ID = response!.responseBody!.id!
                    self.STATUS = response!.responseBody!.status!
                    self.AMOUNT = response!.responseBody!.amount!
                    self.CORRELATER = response!.responseBody!.correlater!
                    self.REFERENCE = response!.responseBody!.reference!
                    self.ECOCASHREFERENCE = response!.responseBody!.ecocashReference!
                    self.PHONE = response!.responseBody!.phone!
                    
                    
                    KeyboardSharedPreferences().setEcocashPaymentParams(
                        amount: response!.responseBody!.amount!, associatedCode: "",
                        //                        associatedCode: response!.responseBody!.associatedCode!,
                        correlater: response!.responseBody!.correlater!,
                        reference: response!.responseBody!.reference!,
                        status: response!.responseBody!.status!,
                        ecocashReference: response!.responseBody!.ecocashReference!,
                        ecocashStatus: response!.responseBody!.ecocashStatus!,
                        phone: response!.responseBody!.phone!,
                        id: response!.responseBody!.id!)
                    
                    KeyboardSharedPreferences().setBillPaymentEcocashStatus(billPaymentEcocashStatus: "1")
                   
                    
                    self.stopParticleProgressDialog(generalProgressLabel: response!.message!, generalProgressConfirmLabel: "SUCCESS", generalBtnVisibility: true)
                    self.dismissParticleProgresssDialog()
                    
                    self.makeNumericKeyboardView()
                    
                }else {
                    
                    print(response!.message!)
                    self.stopParticleProgressDialog(generalProgressLabel: response!.message!, generalProgressConfirmLabel: "FAILED", generalBtnVisibility: true)
                    
                }
                
                
            }
            
        }
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    
}

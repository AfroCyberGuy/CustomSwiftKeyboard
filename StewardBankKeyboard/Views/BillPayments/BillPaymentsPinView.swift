//
//  BillPaymentsPinView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/6/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

extension KeyboardViewController {
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS PIN
    //----------------------------------------------------------------
    
    func makebillPaymentsPinView(){
        
        billPaymentsPinView.backgroundColor = Theme.LighterGray
        billPaymentsPinView.layer.cornerRadius = 0
        view.addSubview(billPaymentsPinView)
        
        billPaymentsPinView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        billPaymentsPinView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        billPaymentsPinView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        billPaymentsPinView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        makeBillPaymentsPinTopContainer()
        makeBillPayementsPinKeyboardContainer()
        
        
    }
    
    //----------------------------------------------------------------
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS PIN VIEW TOP CONTAINER
    //----------------------------------------------------------------
    
    func makeBillPaymentsPinTopContainer(){
        
        billPaymentsPinTopContainer.backgroundColor = Theme.LighterGray
        billPaymentsPinTopContainer.layer.cornerRadius = 0
        billPaymentsPinView.addSubview(billPaymentsPinTopContainer)
        
        billPaymentsPinTopContainer.topAnchor.constraint(equalTo: billPaymentsPinView.topAnchor).isActive = true
        billPaymentsPinTopContainer.leftAnchor.constraint(equalTo: billPaymentsPinView.leftAnchor).isActive = true
        billPaymentsPinTopContainer.rightAnchor.constraint(equalTo: billPaymentsPinView.rightAnchor).isActive = true
        billPaymentsPinTopContainer.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        makeBillPaymentsPinTopContainerLabel()
        makeBillPaymentsPinViewBackButton()
        makeBillPaymentsPinViewRightButton()
       makeBillPaymentsinStackView()
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeBillPaymentsPinTopContainerLabel(){
        
        billPaymentsPinTopContainer.addSubview(billPaymentsPinLabel)
        billPaymentsPinLabel.textAlignment = .center
        
        billPaymentsPinLabel.topAnchor.constraint(equalTo: billPaymentsPinTopContainer.topAnchor, constant: 3).isActive = true
        billPaymentsPinLabel.leftAnchor.constraint(equalTo: billPaymentsPinTopContainer.leftAnchor, constant: 3).isActive = true
        billPaymentsPinLabel.rightAnchor.constraint(equalTo: billPaymentsPinTopContainer.rightAnchor, constant: 3).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS PIN VIEW BACK BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeBillPaymentsPinViewBackButton(){
        
        billPaymentsPinBackBtn.layer.cornerRadius = 15
        billPaymentsPinTopContainer.addSubview(billPaymentsPinBackBtn)
        
        billPaymentsPinBackBtn.addTarget(self, action: #selector(closeBillPaymentsPinView), for: .touchUpInside)
        
        
       billPaymentsPinBackBtn.topAnchor.constraint(equalTo: billPaymentsPinLabel.bottomAnchor, constant: 2).isActive = true
       billPaymentsPinBackBtn.leftAnchor.constraint(equalTo: billPaymentsPinTopContainer.leftAnchor, constant: 8).isActive = true
       billPaymentsPinBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
       billPaymentsPinBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CLOSE BILL PAYMENTS PIN VIEW
    //----------------------------------------------------------------
    
    @objc func closeBillPaymentsPinView() {
        
        billPaymentsPinView.removeFromSuperview()
    }
    
    //----------------------------------------------------------------
    
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS PIN VIEW RIGHT BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeBillPaymentsPinViewRightButton(){
        
        billPaymentsPinRightBtn.layer.cornerRadius = 15
        billPaymentsPinTopContainer.addSubview(billPaymentsPinRightBtn)
        billPaymentsPinRightBtn.addTarget(self, action: #selector(billPaymentsPinConfirmPin), for: .touchUpInside)
        
        
       billPaymentsPinRightBtn.topAnchor.constraint(equalTo: billPaymentsPinLabel.bottomAnchor, constant: 2).isActive = true
       billPaymentsPinRightBtn.rightAnchor.constraint(equalTo: billPaymentsPinTopContainer.rightAnchor, constant: -8).isActive = true
       billPaymentsPinRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
       billPaymentsPinRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME PIN CONFIRM PIN BTN PRESSED
    //----------------------------------------------------------------
    
    @objc func billPaymentsPinConfirmPin() {
        
        print("Working")
        
        if pinString.count < 4 {
            
            showValidationView(message: "Incorrect pin")
            
        }else {
            
        
        if KeyboardSharedPreferences().getSquareBillPaymentStatus() == "1" {
            
            let billAuthUrl = BaseEndPoint.LOCAL_BASE_URL + "/api/billpayengine/secured/thirdParty/billAuth"
            let parameters = Mapper().toJSON(OtherBillersAuthPostModel(billAccount: BILLBILLACCOUNT, billAmount: BILLBILLAMOUNT, cardReference: "1234560000000001", channel: "SOSHO", debitAccountNumber: "1000000000", debitCurrency: "USD", payerMsisdn: SharedPreference.getPhoneNumber()!, provider: KeyboardSharedPreferences().getBillerCode()!, providerProduct: KeyboardSharedPreferences().getBillerCode()!))
            
            otherBillersSquareAuth(url: billAuthUrl, parameters: parameters)
            
            
            

            
        }else {
            
            let billAuthUrl = BaseEndPoint.LOCAL_BASE_URL + "/api/billpayengine/secured/thirdParty/billAuth"
            let parameters = Mapper().toJSON(OtherBillersAuthPostModel(billAccount: BILLBILLACCOUNT, billAmount: BILLBILLAMOUNT, cardReference: "1234560000000001", channel: "SOSHO", debitAccountNumber: "1000000000", debitCurrency: "USD", payerMsisdn: SharedPreference.getPhoneNumber()!, provider: KeyboardSharedPreferences().getBillerCode()!, providerProduct: KeyboardSharedPreferences().getBillerCode()!))
            
            otherBillersAuth(url: billAuthUrl, parameters: parameters)
            
        }
        
       
        
        
//  billPaymentZimswitchPurchase(pan: BILLPANNUMBER, pinBlock: pinString, transactionAmount: BILLBILLAMOUNT, biller: BILLBILLERCODE, imei: SharedPreference.getIMEI()!, customerMsisdn: SharedPreference.getPhoneNumber()!)
            
        }
    
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS P1 LABEL
    //----------------------------------------------------------------
    
    func makeBillPaymentsinStackView(){
        
        billPaymentsPinP1Label.backgroundColor = UIColor.white
        billPaymentsPinP2Label.backgroundColor = UIColor.white
        billPaymentsPinP3Label.backgroundColor = UIColor.white
        billPaymentsPinP4Label.backgroundColor = UIColor.white
        
        billPaymentsPinP1Label.textAlignment = .center
        billPaymentsPinP2Label.textAlignment = .center
        billPaymentsPinP3Label.textAlignment = .center
        billPaymentsPinP4Label.textAlignment = .center
        
        billPaymentsPinP1Label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        let hstackView = Controls().theHorizontalLabelStackView(labels: [billPaymentsPinP1Label, billPaymentsPinP2Label, billPaymentsPinP3Label, billPaymentsPinP4Label])
        hstackView.axis = .horizontal
        hstackView.distribution = .fillEqually
        hstackView.spacing = 2
        
        billPaymentsPinTopContainer.addSubview(hstackView)
        
        hstackView.leftAnchor.constraint(equalTo: billPaymentsPinBackBtn.rightAnchor, constant: 40).isActive = true
        hstackView.rightAnchor.constraint(equalTo: billPaymentsPinRightBtn.leftAnchor, constant: -40).isActive = true
        hstackView.centerYAnchor.constraint(equalTo: billPaymentsPinBackBtn.centerYAnchor).isActive = true
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS PIN VIEW KEYBOARD ROW ONE STACKVIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentsPinViewRowOneStackView() -> UIStackView {
        
        billPaymentsPinOneButton.layer.cornerRadius = 3
        billPaymentsPinOneButton.backgroundColor = UIColor.white
        billPaymentsPinOneButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentsPinTwoButton.layer.cornerRadius = 3
        billPaymentsPinTwoButton.backgroundColor = UIColor.white
        billPaymentsPinTwoButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentsPinThreeButton.layer.cornerRadius = 3
        billPaymentsPinThreeButton.backgroundColor = UIColor.white
        billPaymentsPinThreeButton.setTitleColor(UIColor.black, for: .normal)
        
        billPaymentsPinOneButton.addTarget(self, action: #selector(billPaymentsPinOneButtonPressed), for: .touchUpInside)
        billPaymentsPinTwoButton.addTarget(self, action: #selector(billPaymentsPinTwoButtonPressed), for: .touchUpInside)
        billPaymentsPinThreeButton.addTarget(self, action: #selector(billPaymentsPinThreeButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [billPaymentsPinOneButton, billPaymentsPinTwoButton, billPaymentsPinThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS PIN VIEW ROW ONE BUTTON ACTIONS
    //----------------------------------------------------------------
    
    @objc func billPaymentsPinOneButtonPressed(){
        
        handlePin(txt1: billPaymentsPinP1Label, txt2: billPaymentsPinP2Label, txt3: billPaymentsPinP3Label, txt4: billPaymentsPinP4Label, button: billPaymentsPinOneButton)
    }
    
    @objc func billPaymentsPinTwoButtonPressed(){
        
          handlePin(txt1: billPaymentsPinP1Label, txt2: billPaymentsPinP2Label, txt3: billPaymentsPinP3Label, txt4: billPaymentsPinP4Label, button: billPaymentsPinTwoButton)
    }
    
    @objc func billPaymentsPinThreeButtonPressed(){
        
       handlePin(txt1: billPaymentsPinP1Label, txt2: billPaymentsPinP2Label, txt3: billPaymentsPinP3Label, txt4: billPaymentsPinP4Label, button: billPaymentsPinThreeButton)
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS PIN VIEW KEYBOARD ROW TWO STACKVIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentsPinViewRowTwoStackView() -> UIStackView {
        
        billPaymentsPinFourButton.layer.cornerRadius = 3
        billPaymentsPinFourButton.backgroundColor = UIColor.white
        billPaymentsPinFourButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentsPinFiveButton.layer.cornerRadius = 3
        billPaymentsPinFiveButton.backgroundColor = UIColor.white
        billPaymentsPinFiveButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentsPinSixButton.layer.cornerRadius = 3
        billPaymentsPinSixButton.backgroundColor = UIColor.white
        billPaymentsPinSixButton.setTitleColor(UIColor.black, for: .normal)
        
        billPaymentsPinFourButton.addTarget(self, action: #selector(billPaymentsPinFourButtonPressed), for: .touchUpInside)
        billPaymentsPinFiveButton.addTarget(self, action: #selector(billPaymentsPinFiveButtonPressed), for: .touchUpInside)
        billPaymentsPinSixButton.addTarget(self, action: #selector(billPaymentsPinSixButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [billPaymentsPinFourButton, billPaymentsPinFiveButton, billPaymentsPinSixButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS PIN VIEW ROW TWO BUTTON ACTIONS
    //----------------------------------------------------------------
    
    
    @objc func billPaymentsPinFourButtonPressed() {
        
        
        handlePin(txt1: billPaymentsPinP1Label, txt2: billPaymentsPinP2Label, txt3: billPaymentsPinP3Label, txt4: billPaymentsPinP4Label, button: billPaymentsPinFourButton)
        
    }
    
    @objc func billPaymentsPinFiveButtonPressed() {
        
         handlePin(txt1: billPaymentsPinP1Label, txt2: billPaymentsPinP2Label, txt3: billPaymentsPinP3Label, txt4: billPaymentsPinP4Label, button: billPaymentsPinFiveButton)
        
    }
    
    @objc func billPaymentsPinSixButtonPressed() {
        
         handlePin(txt1: billPaymentsPinP1Label, txt2: billPaymentsPinP2Label, txt3: billPaymentsPinP3Label, txt4: billPaymentsPinP4Label, button: billPaymentsPinSixButton)
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS PIN VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentsPinViewRowThreeStackView() -> UIStackView {
        
        billPaymentsPinSevenButton.layer.cornerRadius = 3
        billPaymentsPinSevenButton.backgroundColor = UIColor.white
        billPaymentsPinSevenButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentsPinEightButton.layer.cornerRadius = 3
        billPaymentsPinEightButton.backgroundColor = UIColor.white
        billPaymentsPinEightButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentsPinNineButton.layer.cornerRadius = 3
        billPaymentsPinNineButton.backgroundColor = UIColor.white
        billPaymentsPinNineButton.setTitleColor(UIColor.black, for: .normal)
        
        billPaymentsPinSevenButton.addTarget(self, action: #selector(billPaymentsPinSevenButtonPressed), for: .touchUpInside)
        billPaymentsPinEightButton.addTarget(self, action: #selector(billPaymentsPinEightButtonPressed), for: .touchUpInside)
        billPaymentsPinNineButton.addTarget(self, action: #selector(billPaymentsPinNineButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [billPaymentsPinSevenButton, billPaymentsPinEightButton, billPaymentsPinNineButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS PIN VIEW ROW THREE BUTTON ACTIONS
    //----------------------------------------------------------------
    
    
    @objc func billPaymentsPinSevenButtonPressed() {
        
        
        handlePin(txt1: billPaymentsPinP1Label, txt2: billPaymentsPinP2Label, txt3: billPaymentsPinP3Label, txt4: billPaymentsPinP4Label, button: billPaymentsPinSevenButton)
        
    }
    
    @objc func billPaymentsPinEightButtonPressed() {
        
        handlePin(txt1: billPaymentsPinP1Label, txt2: billPaymentsPinP2Label, txt3: billPaymentsPinP3Label, txt4: billPaymentsPinP4Label, button: billPaymentsPinEightButton)
        
    }
    
    @objc func billPaymentsPinNineButtonPressed() {
        
        handlePin(txt1: billPaymentsPinP1Label, txt2: billPaymentsPinP2Label, txt3: billPaymentsPinP3Label, txt4: billPaymentsPinP4Label, button: billPaymentsPinNineButton)
        
    }
    
    
    //------------------------------------------------------------------
    
    //------------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS PIN VIEW KEYBOARD ROW FOUR STACKVIEW
    //------------------------------------------------------------------
    
    func makeBillPaymentsPinViewRowFourStackView() -> UIStackView {
        
        billPaymentsPinZeroButton.layer.cornerRadius = 3
        billPaymentsPinZeroButton.backgroundColor = UIColor.white
        billPaymentsPinZeroButton.setTitleColor(UIColor.black, for: .normal)
        billPaymentsPinDeleteButton.layer.cornerRadius = 3
        billPaymentsPinDeleteButton.backgroundColor = UIColor.white
        billPaymentsPinDeleteButton.setTitleColor(UIColor.black, for: .normal)
        
    
        billPaymentsPinZeroButton.addTarget(self, action: #selector(billPaymentsPinZeroButtonPressed), for: .touchUpInside)
        billPaymentsPinDeleteButton.addTarget(self, action: #selector(billPaymentsPinDeleteButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [billPaymentsPinZeroButton, billPaymentsPinDeleteButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS PIN VIEW ROW FOUR BUTTON ACTIONS
    //----------------------------------------------------------------
    
    
    @objc func billPaymentsPinZeroButtonPressed() {
        
        handlePin(txt1: billPaymentsPinP1Label, txt2: billPaymentsPinP2Label, txt3: billPaymentsPinP3Label, txt4: billPaymentsPinP4Label, button: billPaymentsPinZeroButton)
    }
    
   
    
    @objc func billPaymentsPinDeleteButtonPressed() {
        
        clearPin(txt1: billPaymentsPinP1Label, txt2: billPaymentsPinP2Label, txt3: billPaymentsPinP3Label, txt4: billPaymentsPinP4Label)
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS PIN KEYBOARD CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeBillPayementsPinKeyboardContainer(){
        
        billPaymentsPinKeyboardContainer.backgroundColor = Theme.LighterGray
        billPaymentsPinKeyboardContainer.layer.cornerRadius = 0
        billPaymentsPinView.addSubview(billPaymentsPinKeyboardContainer)
        
        billPaymentsPinKeyboardContainer.topAnchor.constraint(equalTo: billPaymentsPinTopContainer.bottomAnchor, constant: 6).isActive = true
        billPaymentsPinKeyboardContainer.leftAnchor.constraint(equalTo:   billPaymentsPinView.leftAnchor, constant: 6).isActive = true
        billPaymentsPinKeyboardContainer.rightAnchor.constraint(equalTo:  billPaymentsPinView.rightAnchor, constant: -6).isActive = true
        billPaymentsPinKeyboardContainer.bottomAnchor.constraint(equalTo: billPaymentsPinView.bottomAnchor, constant: -6).isActive = true
     
        makeBillPaymentsPinviewKeyBoardParentStackView()
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BILL PAYMENTS PIN VIEW KEYBOARD PARENT STACKVIEW
    //----------------------------------------------------------------
    
    func makeBillPaymentsPinviewKeyBoardParentStackView(){
        
        let pStackView = Controls().theParentStackView(buttons: [makeBillPaymentsPinViewRowOneStackView(), makeBillPaymentsPinViewRowTwoStackView(), makeBillPaymentsPinViewRowThreeStackView(), makeBillPaymentsPinViewRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 6
        billPaymentsPinKeyboardContainer.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: billPaymentsPinKeyboardContainer.leftAnchor).isActive = true
        pStackView.rightAnchor.constraint(equalTo: billPaymentsPinKeyboardContainer.rightAnchor).isActive = true
        pStackView.topAnchor.constraint(equalTo: billPaymentsPinKeyboardContainer.topAnchor).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: billPaymentsPinKeyboardContainer.bottomAnchor).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIMSWITCH BILLPAYMENTS PURCHASE
    //----------------------------------------------------------------
    
    func billPaymentZimswitchPurchase(pan: String, pinBlock: String, transactionAmount: String, biller: String, imei: String, customerMsisdn: String, expiryDate: String) {
        
       makeProgressParticleProgressBar(containingView: billPaymentsPinView)
        
        let convertedAmount = Double(transactionAmount)! * 100
        let conv = Int(convertedAmount)
        
        let finalConvertedAmount = String(conv)
        
        print("CONVERTED AMOUNT: \(Int(finalConvertedAmount)!)")
        
        let panValue = pan.aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let pinBlockValue = pinBlock.aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let transactionAmountValue = "\(finalConvertedAmount)".aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let billerValue = KeyboardSharedPreferences().getBillerCode()!.aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let imeiValue = imei.aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let expiryDateValue = expiryDate.aesDecrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let customerMsisdnValue = customerMsisdn
        
        
        var parameters = [String : Any]()
        
        if KeyboardSharedPreferences().getIsExpiry() == "1" {
            
            KeyboardSharedPreferences().setIsExpiry(isExpiry: "0")
            
               parameters = Mapper().toJSON(PurchaseZimPostModel(pan: pan, pinBlock: pinBlock, imei: imei, transactionAmount: transactionAmount, biller: biller, channel: Channel.transactionChannel(), customerMsisdn: customerMsisdn, expiryDate: expiryDateValue))
            
        }else {
            
              parameters = Mapper().toJSON(PurchaseZimPostModel(pan: panValue, pinBlock: pinBlockValue, imei: imeiValue, transactionAmount: transactionAmountValue, biller: billerValue, channel: Channel.transactionChannel(), customerMsisdn: customerMsisdnValue))
            
        }
        
        let url = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/socialMedia/secured/sosho/purchaseZim"
        
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: PurchaseZimModel?, error) in
            
            print("PURCHASE ZIM PARAMETERS: \(parameters)")
            print("PURCHASE ZIM URL: \(url)")
            
            if error != nil {
                
                print("ERROR: Error occured.)")
                
                self.stopParticleProgressDialog(generalProgressLabel: "Error", generalProgressConfirmLabel: "An error occured", generalBtnVisibility: false)
            
            }else {
                
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message! == "SUCCESS" {
                    
                    self.dismissParticleProgresssDialog()
                    
                    print(response!.message!)
                    
                    let decry =  response!.responseBody!.aesDecrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
                    
                    print("DECRYPTED TOKEN: \(decry)")
                    
                     let airtimeUrl = BaseEndPoint.LOCAL_BASE_URL + "/api/billpayengine/secured/thirdParty/payBill"
                    
                    let airtimeParameters = Mapper().toJSON(AirtimePayPostModel(cardReference: "1234560000000001", payerMsisdn: SharedPreference.getEcocashEcocashPhone()!, payerName: "Soshaloza", billAccount: self.BILLBILLACCOUNT, billAmount: FormatMoney.changeFromStringToInt(amount: self.BILLBILLAMOUNT), billProvider: KeyboardSharedPreferences().getBillerCode()!, channel: "MobileWorld", debitAccountnumber: "1007000000", debitCurrency: "USD", token: decry, provider: KeyboardSharedPreferences().getBillerCode()!, providerProduct: "AIRTIME", participantReference: KeyboardSharedPreferences().getBillAuthToken()!))
                    
                    self.billPaymentWithZimswitch(url: airtimeUrl, parameters: airtimeParameters)
                    
                }else {
                    
                    print("ERROR OCCURED....")
                    
                    self.stopParticleProgressDialog(generalProgressLabel: response!.message!, generalProgressConfirmLabel: response!.responseBody!, generalBtnVisibility: false)
                    
                }
                
            }
            
            
        }
        
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL AUTH METHOD REQUEST
    //----------------------------------------------------------------
    
    func otherBillersAuth(url: String, parameters: [String: Any]){
        
        print("OTHER BILLERS AUTH URL: \(url)")
        print("OTHER BILLERS AUTH PARAMETERS: \(parameters)")
        
        makeProgressParticleProgressBar(containingView: billPaymentsPinView)
        
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: OtherBillersAuthModel?, error) in
            
            if error != nil {
                
                print("Error: \(error.debugDescription)")
                
                self.stopParticleProgressDialog(generalProgressLabel: "Error", generalProgressConfirmLabel: "Error Occured", generalBtnVisibility: false)
                
            }else {
                
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message == "SUCCESS" {
                    
                    self.dismissParticleProgresssDialog()
                    
                    KeyboardSharedPreferences().setBillAuthToken(billToken: response!.responseBody!)
                    
                    self.billPaymentZimswitchPurchase(pan: self.BILLPANNUMBER, pinBlock: self.pinString, transactionAmount: self.BILLBILLAMOUNT, biller: KeyboardSharedPreferences().getBillerCode()!, imei: SharedPreference.getIMEI()!, customerMsisdn: SharedPreference.getPhoneNumber()!, expiryDate: KeyboardSharedPreferences().getExpiryDate()!)
                    
                }else {
                    
                    self.stopParticleProgressDialog(generalProgressLabel: "Error", generalProgressConfirmLabel: response!.message!, generalBtnVisibility: false)
                    
                }
                
            }
            
        }
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL SQUARE AUTH METHOD REQUEST
    //----------------------------------------------------------------
    
    func otherBillersSquareAuth(url: String, parameters: [String: Any]){
        
        print("OTHER BILLERS AUTH URL: \(url)")
        print("OTHER BILLERS AUTH PARAMETERS: \(parameters)")
        
        makeProgressParticleProgressBar(containingView: billPaymentsPinView)
        
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: OtherBillersAuthModel?, error) in
            
            if error != nil {
                
                print("Error: \(error.debugDescription)")
                
                self.stopParticleProgressDialog(generalProgressLabel: "Error", generalProgressConfirmLabel: "Error Occured", generalBtnVisibility: false)
                
            }else {
                
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message == "SUCCESS" {
                    
                    self.dismissParticleProgresssDialog()
                    
                    KeyboardSharedPreferences().setBillAuthToken(billToken: response!.responseBody!)
                    
                    let billPaymentSquarePurchaseUrl = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/socialMedia/secured/sosho/squarePurchase"
                    
                    let billPaymentSquarePurchaseParameters = Mapper().toJSON(SquarePurchaseModel(username: SharedPreference.getSquareMobileNumber()!, password: self.pinString, phone: SharedPreference.getSquareMobileNumber()!, amount: Double(self.BILLBILLAMOUNT)!, biller: KeyboardSharedPreferences().getBillerCode()!))
                    
                    self.takeBillPaymentMoneyFromSquare(url: billPaymentSquarePurchaseUrl, parameters: billPaymentSquarePurchaseParameters)
                   
                    
                }else {
                    
                    self.stopParticleProgressDialog(generalProgressLabel: "Error", generalProgressConfirmLabel: response!.message!, generalBtnVisibility: false)
                    
                }
                
            }
            
        }
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- TAKE BILL PAYMENT MONEY FROM  SQUARE
    //----------------------------------------------------------------
    
    func takeBillPaymentMoneyFromSquare(url: String, parameters: [String: Any]){
        
        makeProgressParticleProgressBar(containingView: billPaymentsPinView)
        
        print("TAKE ZIPIT MONEY FROM SQUARE URL: \(url)")
        print("TAKE ZIPIT MONEY FROM SQUARE PARAMETERS: \(parameters)")
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: InternalTransferModel?, error) in
            
            if error != nil {
                
                print("ERROR")
                
                self.stopParticleProgressDialog(generalProgressLabel: "ERROR", generalProgressConfirmLabel: "An error occurred", generalBtnVisibility: false)
                
            }else{
                
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message == "SUCCESS" {
                    
                    print(response!.responseBody!)
                    
                    self.dismissParticleProgresssDialog()
                    
                    
                    let payBillUrl = BaseEndPoint.LOCAL_BASE_URL + "/api/billpayengine/secured/thirdParty/payBill"
        
                    let paybillParameters = Mapper().toJSON(AirtimePayPostModel(cardReference: "1234560000000001", payerMsisdn: SharedPreference.getEcocashEcocashPhone()!, payerName: "Soshaloza", billAccount: self.BILLBILLACCOUNT, billAmount: FormatMoney.changeFromStringToInt(amount: self.BILLBILLAMOUNT), billProvider: KeyboardSharedPreferences().getBillerCode()!, channel: "MobileWorld", debitAccountnumber: "1007000000", debitCurrency: "USD", token: response!.responseBody!, provider: KeyboardSharedPreferences().getBillerCode()!, providerProduct: "AIRTIME", participantReference: KeyboardSharedPreferences().getBillAuthToken()!))
        
                    self.billPaymentWithZimswitch(url: payBillUrl, parameters: paybillParameters)
                   
                    
                }else{
                    
                    
                    
                    self.stopParticleProgressDialog(generalProgressLabel: response!.message!, generalProgressConfirmLabel: response!.responseBody! , generalBtnVisibility: false)
                }
                
                
            }
        }
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- PAY BILL REQUEST METHOD
    //----------------------------------------------------------------
    
    func payBill(url: String, parameters: [String: Any]){

        makeProgressParticleProgressBar(containingView: billPaymentsPinView)
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: OtherBillersPayModel?, error) in
            
            print("PAY BILL URL: \(url)")
            print("PAY BILL PARAMETERS: \(parameters)")
            
            if error != nil {
                
                print(error.debugDescription)
                
                self.stopParticleProgressDialog(generalProgressLabel: "Error", generalProgressConfirmLabel: "An Error Occured", generalBtnVisibility: false)
                
            }else {
                
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message == "SUCCESS" {
                    
                    self.stopParticleProgressDialog(generalProgressLabel: response!.message!, generalProgressConfirmLabel: response!.responseBody!, generalBtnVisibility: false)
                    
                }else{
                    
                    self.stopParticleProgressDialog(generalProgressLabel: response!.message!, generalProgressConfirmLabel: response!.responseBody!, generalBtnVisibility: false)
                    
                }
                
            }
        }
        
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENT WITH ZIMSWITCH PAYMENT OPTION
    //----------------------------------------------------------------
    
    func billPaymentWithZimswitch(url: String, parameters: [String: Any]){
        
        print("BUY AIRTIME URL: \(url)")
        print("BUY AIRTIME PARAMETERS: \(parameters)")
        
        self.makeProgressParticleProgressBar(containingView: ZIPITPinView)
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: AirtimePayModel?, error) in
            
            if error != nil {
                
                print("Error")
                
                self.dismissParticleProgresssDialog()
                self.makeZIPITTransferFinalDialog(transactionMessage: "Oops. That didn't go as planned. The problem is: FAILED", icon: "oops")
                
                
            }else {
                
                print(response!.toJSONString(prettyPrint: true)!)
                
                
                if response!.message == "SUCCESS" {
                    
                    KeyboardSharedPreferences().setAirtimeEcocashPaymentStatus(ecocashPaymentStatus: "0")
                    KeyboardSharedPreferences().setSquareBillPaymentStatus(squareBillPaymentStatus: "0")
                    
                    self.dismissParticleProgresssDialog()
                    self.makeZIPITTransferFinalDialog(transactionMessage: "Yaay, your bill payment transaction for \(KeyboardSharedPreferences().getBillerCode()!) was successful.", icon: "sosho_icon")
                    
                    
                }else {
                    
                    self.dismissParticleProgresssDialog()
                    self.makeZIPITTransferFinalDialog(transactionMessage: "Oops. That didn't go as planned. The problem is: FAILED", icon: "oops")
                    
                }
            }
            
        }
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENT  FINAL DIALOG
    //----------------------------------------------------------------
    
    func makeBillPaymentFinalDialog(transactionMessage: String, icon: String){
        
        view.addSubview(balanceFinalDialog)
        balanceFinalDialog.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        balanceFinalDialog.layer.cornerRadius = 0
        
        balanceFinalDialog.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        balanceFinalDialog.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        balanceFinalDialog.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        balanceFinalDialog.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        balanceFinalDialog.addSubview(balanceFinalDialogIcon)
        balanceFinalDialogIcon.image = UIImage(named: icon)
        balanceFinalDialogIcon.contentMode = .scaleAspectFit
        
        balanceFinalDialogIcon.topAnchor.constraint(equalTo: balanceFinalDialog.topAnchor, constant: 20).isActive = true
        balanceFinalDialogIcon.widthAnchor.constraint(equalToConstant: 100).isActive = true
        balanceFinalDialogIcon.heightAnchor.constraint(equalToConstant: 100).isActive = true
        balanceFinalDialogIcon.centerXAnchor.constraint(equalTo: balanceFinalDialog.centerXAnchor).isActive = true
        
        balanceFinalDialog.addSubview(balanceFinalDialogLabel)
        balanceFinalDialogLabel.text = transactionMessage
        balanceFinalDialogLabel.textAlignment = .center
        
        
        balanceFinalDialogLabel.text = transactionMessage
        balanceFinalDialogLabel.numberOfLines = 0
        
        balanceFinalDialogLabel.topAnchor.constraint(equalTo: balanceFinalDialogIcon.bottomAnchor, constant: 16).isActive = true
        balanceFinalDialogLabel.leftAnchor.constraint(equalTo: balanceFinalDialog.leftAnchor, constant: 30).isActive = true
        balanceFinalDialogLabel.rightAnchor.constraint(equalTo: balanceFinalDialog.rightAnchor, constant: -30).isActive = true
        
        balanceFinalDialogMsgBtn.heightAnchor.constraint(equalToConstant: 40).isActive  = true
        
        balanceFinalDialogMsgBtn.layer.cornerRadius = 5
        balanceFinalDialogMsgBtn.backgroundColor =  #colorLiteral(red: 0.3921568627, green: 0.09411764706, blue: 0.4862745098, alpha: 1)
        balanceFinalDialogCloseBtn.layer.cornerRadius = 5
        balanceFinalDialogCloseBtn.backgroundColor = #colorLiteral(red: 0.6274509804, green: 0.007843137255, blue: 0.007843137255, alpha: 1)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [balanceFinalDialogMsgBtn, balanceFinalDialogCloseBtn])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 20
        
        balanceFinalDialog.addSubview(hStackView)
        
        hStackView.topAnchor.constraint(equalTo: balanceFinalDialogLabel.bottomAnchor, constant: 10).isActive = true
        hStackView.leftAnchor.constraint(equalTo: balanceFinalDialog.leftAnchor, constant: 30).isActive = true
        hStackView.rightAnchor.constraint(equalTo: balanceFinalDialog.rightAnchor, constant: -30).isActive = true
        
        
        
        balanceFinalDialogMsgBtn.addTarget(self, action: #selector(billPaymentDialogMsgBtnPressed), for: .touchUpInside)
        
        balanceFinalDialogCloseBtn.addTarget(self, action: #selector(billPaymentDialogCloseBtnPressed), for: .touchUpInside)
        
    }
    
    //----------------------------------------------------------------
    
    @objc func billPaymentDialogMsgBtnPressed(){
        
        let proxy = textDocumentProxy
        proxy.insertText("Yaay. Bill payment transaction for \(KeyboardSharedPreferences().getBillerCode()!) was successful.")
        
    }
    
    
    @objc func billPaymentDialogCloseBtnPressed() {
        
        balanceFinalDialog.removeFromSuperview()
    }
    
    
    
}

//
//  ZIPITPinView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/7/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper


extension KeyboardViewController {
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:-  ZIPIT PIN VIEW
    //----------------------------------------------------------------
    
    func makeZIPITPinView(){
        
        ZIPITPinView.backgroundColor = Theme.LighterGray
        ZIPITPinView.layer.cornerRadius = 0
        view.addSubview(ZIPITPinView)
        
        ZIPITPinView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        ZIPITPinView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        ZIPITPinView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        ZIPITPinView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        makeZIPITPinTopContainer()
        makeZIPITPinKeyboardContainer()
    
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT PIN VIEW TOP CONTAINER
    //----------------------------------------------------------------
    
    func makeZIPITPinTopContainer(){
        
        ZIPITPinTopContainer.backgroundColor = Theme.LighterGray
        ZIPITPinTopContainer.layer.cornerRadius = 0
        ZIPITPinView.addSubview(ZIPITPinTopContainer)
        
        ZIPITPinTopContainer.topAnchor.constraint(equalTo: ZIPITPinView.topAnchor).isActive = true
        ZIPITPinTopContainer.leftAnchor.constraint(equalTo: ZIPITPinView.leftAnchor).isActive = true
        ZIPITPinTopContainer.rightAnchor.constraint(equalTo: ZIPITPinView.rightAnchor).isActive = true
        ZIPITPinTopContainer.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        makeZIPITPinTopContainerLabel()
        makeZIPITPinViewBackButton()
        makeZIPITPinViewRightButton()
        makeZIPITPinStackView()
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT PIN TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeZIPITPinTopContainerLabel(){
        
        ZIPITPinTopContainer.addSubview(ZIPITPinLabel)
        ZIPITPinLabel.textAlignment = .center
        
        ZIPITPinLabel.topAnchor.constraint(equalTo: ZIPITPinTopContainer.topAnchor, constant: 3).isActive = true
        ZIPITPinLabel.leftAnchor.constraint(equalTo: ZIPITPinTopContainer.leftAnchor, constant: 3).isActive = true
        ZIPITPinLabel.rightAnchor.constraint(equalTo: ZIPITPinTopContainer.rightAnchor, constant: 3).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT PIN VIEW BACK BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeZIPITPinViewBackButton(){
        
        ZIPITPinBackBtn.layer.cornerRadius = 15
        ZIPITPinTopContainer.addSubview(ZIPITPinBackBtn)
        
        ZIPITPinBackBtn.addTarget(self, action: #selector(closeZIPITPinView), for: .touchUpInside)
        
        
        ZIPITPinBackBtn.topAnchor.constraint(equalTo: ZIPITPinLabel.bottomAnchor, constant: 2).isActive = true
        ZIPITPinBackBtn.leftAnchor.constraint(equalTo: ZIPITPinTopContainer.leftAnchor, constant: 8).isActive = true
        ZIPITPinBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        ZIPITPinBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CLOSE ZIPIT PIN VIEW
    //----------------------------------------------------------------
    
    @objc func closeZIPITPinView() {
        
        ZIPITPinView.removeFromSuperview()
    }
    
    //----------------------------------------------------------------
    
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT PIN VIEW RIGHT BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeZIPITPinViewRightButton(){
        
        ZIPITPinRightBtn.layer.cornerRadius = 15
        ZIPITPinTopContainer.addSubview(ZIPITPinRightBtn)
        ZIPITPinRightBtn.addTarget(self, action: #selector(ZIPITPinConfirmPin), for: .touchUpInside)
        
        
        ZIPITPinRightBtn.topAnchor.constraint(equalTo: ZIPITPinLabel.bottomAnchor, constant: 2).isActive = true
        ZIPITPinRightBtn.rightAnchor.constraint(equalTo: ZIPITPinTopContainer.rightAnchor, constant: -8).isActive = true
        ZIPITPinRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        ZIPITPinRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT PIN CONFIRM PIN BTN PRESSED
    //----------------------------------------------------------------
    
    @objc func ZIPITPinConfirmPin() {
        
        //        airtimePinView.removeFromSuperview()
     
        if ZIPITPinP1Label.text != "" && ZIPITPinP2Label.text != ""
            && ZIPITPinP3Label.text != "" && ZIPITPinP4Label.text != "" {
//
//            let pin = "\(ZIPITPinP1Label.text!)\(ZIPITPinP2Label.text!)\(ZIPITPinP3Label.text!)\(ZIPITPinP4Label.text!)"
            
            if KeyboardSharedPreferences().getAirtimeZimswitchPurchase() == "1" {
                
                let url =  BaseEndPoint.LOCAL_BASE_URL + "/api/billpayengine/secured/thirdParty/billAuth"
                
                print(SharedPreference.getPhoneNumber()!)
                print(KeyboardSharedPreferences().getAirtimeRecipient()!)
                print(FormatMoney.changeFromStringToDouble(amount: KeyboardSharedPreferences().getAirtimeAmount()!))
                print(KeyboardSharedPreferences().getAirtimeNetworkProvider()!)
                print(KeyboardSharedPreferences().getAirtimeNetworkProvider()!)
              
                let parameters = Mapper().toJSON(AirtimeAuthPostModel(cardReference: "1234560000000001", payerMsisdn: SharedPreference.getPhoneNumber()!, payerName: "Soshaloza", billAccount: KeyboardSharedPreferences().getAirtimeRecipient()!, billAmount: FormatMoney.changeFromStringToDouble(amount: KeyboardSharedPreferences().getAirtimeAmount()! ) , billProvider: KeyboardSharedPreferences().getAirtimeNetworkProvider()!, channel: "MobileWorld", debitAccountnumber: "1000000000", debitCurrency: "USD", provider: KeyboardSharedPreferences().getAirtimeNetworkProvider()!, providerProduct:"AIRTIME"))
                
            
                    zimswitchAirtimeAuth(url: url, parameters: parameters)
                
                
                
//                ZIMSWITCHEcocashToken(pan: ZIPIT_PAN_NUMBER, pinBlock: pinString, transactionAmount: KeyboardSharedPreferences().getAirtimeAmount()!, biller: KeyboardSharedPreferences().getAirtimeNetworkProvider()!, imei: SharedPreference.getIMEI()!, customerMsisdn: SharedPreference.getPhoneNumber()!)
                
            }else if KeyboardSharedPreferences().getSquareZIPITTransferOption() == "1" {
                
                let zipitSquarePurchaseUrl = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/socialMedia/secured/sosho/squarePurchase"
                
//                let zipitSquarePurchaseParameters = Mapper().toJSON(InternalTransferPostModel(username: SharedPreference.getSquareMobileNumber()!, password: pinString, phone: SharedPreference.getSquareMobileNumber()!, amount: Double(KeyboardSharedPreferences().getAirtimeAmount()!)!, biller: "ZIPIT"))
                
                let zipitSquarePurchaseParameters = Mapper().toJSON(SquarePurchaseModel(username: SharedPreference.getSquareMobileNumber()!, password: pinString, phone: SharedPreference.getSquareMobileNumber()!, amount: Double(KeyboardSharedPreferences().getZIPITAmount()!)!, biller: "ZIPIT"))
                
                takeZIPITMoneyFromSquare(url: zipitSquarePurchaseUrl, parameters: zipitSquarePurchaseParameters)
                
            }else{
                
                print("PIN: \(pinString)")
                
                ZIPITToken(pan: ZIPIT_CARD_NUMBER, pinBlock: pinString, transactionAmount: ZIPIT_AMOUNT, biller: "ZIPIT", imei: SharedPreference.getIMEI()!, customerMsisdn: SharedPreference.getPhoneNumber()!, expiryDate: KeyboardSharedPreferences().getExpiryDate()!)
                
            }
        }
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT PIN P1 LABEL
    //----------------------------------------------------------------
    
    func makeZIPITPinStackView(){
        
        ZIPITPinP1Label.backgroundColor = UIColor.white
        ZIPITPinP2Label.backgroundColor = UIColor.white
        ZIPITPinP3Label.backgroundColor = UIColor.white
        ZIPITPinP4Label.backgroundColor = UIColor.white
        
        ZIPITPinP1Label.textAlignment = .center
        ZIPITPinP2Label.textAlignment = .center
        ZIPITPinP3Label.textAlignment = .center
        ZIPITPinP4Label.textAlignment = .center
        
        ZIPITPinP1Label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        let hstackView = Controls().theHorizontalLabelStackView(labels: [ZIPITPinP1Label, ZIPITPinP2Label, ZIPITPinP3Label, ZIPITPinP4Label])
        hstackView.axis = .horizontal
        hstackView.distribution = .fillEqually
        hstackView.spacing = 2
        
        ZIPITPinTopContainer.addSubview(hstackView)
        
        hstackView.leftAnchor.constraint(equalTo: ZIPITPinBackBtn.rightAnchor, constant: 40).isActive = true
        hstackView.rightAnchor.constraint(equalTo: ZIPITPinRightBtn.leftAnchor, constant: -40).isActive = true
        hstackView.centerYAnchor.constraint(equalTo: ZIPITPinBackBtn.centerYAnchor).isActive = true
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT PIN VIEW KEYBOARD ROW ONE STACKVIEW
    //----------------------------------------------------------------
    
    func makeZIPITPinViewRowOneStackView() -> UIStackView {
        
        ZIPITPinOneButton.layer.cornerRadius = 3
        ZIPITPinOneButton.backgroundColor = UIColor.white
        ZIPITPinOneButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITPinTwoButton.layer.cornerRadius = 3
        ZIPITPinTwoButton.backgroundColor = UIColor.white
        ZIPITPinTwoButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITPinThreeButton.layer.cornerRadius = 3
        ZIPITPinThreeButton.backgroundColor = UIColor.white
        ZIPITPinThreeButton.setTitleColor(UIColor.black, for: .normal)
        
        ZIPITPinOneButton.addTarget(self, action: #selector(ZIPITPinOneButtonPressed), for: .touchUpInside)
        ZIPITPinTwoButton.addTarget(self, action: #selector(ZIPITPinTwoButtonPressed), for: .touchUpInside)
        ZIPITPinThreeButton.addTarget(self, action: #selector(ZIPITPinThreeButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [ZIPITPinOneButton, ZIPITPinTwoButton, ZIPITPinThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:-  ZIPIT PIN VIEW ROW ONE BUTTON ACTIONS
    //----------------------------------------------------------------
    
    @objc func ZIPITPinOneButtonPressed(){
        
        handlePin(txt1: ZIPITPinP1Label, txt2: ZIPITPinP2Label, txt3: ZIPITPinP3Label, txt4: ZIPITPinP4Label, button: ZIPITPinOneButton)
    }
    
    @objc func ZIPITPinTwoButtonPressed(){
        
         handlePin(txt1: ZIPITPinP1Label, txt2: ZIPITPinP2Label, txt3: ZIPITPinP3Label, txt4: ZIPITPinP4Label, button: ZIPITPinTwoButton)
    }
    
    @objc func ZIPITPinThreeButtonPressed(){
        
        handlePin(txt1: ZIPITPinP1Label, txt2: ZIPITPinP2Label, txt3: ZIPITPinP3Label, txt4: ZIPITPinP4Label, button: ZIPITPinThreeButton)
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT PIN VIEW KEYBOARD ROW TWO STACKVIEW
    //----------------------------------------------------------------
    
    func makeZIPITPinViewRowTwoStackView() -> UIStackView {
        
        ZIPITPinFourButton.layer.cornerRadius = 3
        ZIPITPinFourButton.backgroundColor = UIColor.white
        ZIPITPinFourButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITPinFiveButton.layer.cornerRadius = 3
        ZIPITPinFiveButton.backgroundColor = UIColor.white
        ZIPITPinFiveButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITPinSixButton.layer.cornerRadius = 3
        ZIPITPinSixButton.backgroundColor = UIColor.white
        ZIPITPinSixButton.setTitleColor(UIColor.black, for: .normal)
        
        ZIPITPinFourButton.addTarget(self, action: #selector(ZIPITPinFourButtonPressed), for: .touchUpInside)
        ZIPITPinFiveButton.addTarget(self, action: #selector(ZIPITPinFiveButtonPressed), for: .touchUpInside)
        ZIPITPinSixButton.addTarget(self, action: #selector(ZIPITPinSixButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [ZIPITPinFourButton, ZIPITPinFiveButton, ZIPITPinSixButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT PIN VIEW ROW TWO BUTTON ACTIONS
    //----------------------------------------------------------------
    
    
    @objc func ZIPITPinFourButtonPressed() {
        
        
         handlePin(txt1: ZIPITPinP1Label, txt2: ZIPITPinP2Label, txt3: ZIPITPinP3Label, txt4: ZIPITPinP4Label, button: ZIPITPinFourButton)
        
    }
    
    @objc func ZIPITPinFiveButtonPressed() {
        
        handlePin(txt1: ZIPITPinP1Label, txt2: ZIPITPinP2Label, txt3: ZIPITPinP3Label, txt4: ZIPITPinP4Label, button: ZIPITPinFiveButton)
        
    }
    
    @objc func ZIPITPinSixButtonPressed() {
        
         handlePin(txt1: ZIPITPinP1Label, txt2: ZIPITPinP2Label, txt3: ZIPITPinP3Label, txt4: ZIPITPinP4Label, button: ZIPITPinSixButton)
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT PIN VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makeZIPITPinViewRowThreeStackView() -> UIStackView {
        
        ZIPITPinSevenButton.layer.cornerRadius = 3
        ZIPITPinSevenButton.backgroundColor = UIColor.white
        ZIPITPinSevenButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITPinEightButton.layer.cornerRadius = 3
        ZIPITPinEightButton.backgroundColor = UIColor.white
        ZIPITPinEightButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITPinNineButton.layer.cornerRadius = 3
        ZIPITPinNineButton.backgroundColor = UIColor.white
        ZIPITPinNineButton.setTitleColor(UIColor.black, for: .normal)
        
        ZIPITPinSevenButton.addTarget(self, action: #selector(ZIPITPinSevenButtonPressed), for: .touchUpInside)
        ZIPITPinEightButton.addTarget(self, action: #selector(ZIPITPinEightButtonPressed), for: .touchUpInside)
        ZIPITPinNineButton.addTarget(self, action: #selector(ZIPITPinNineButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [ZIPITPinSevenButton, ZIPITPinEightButton, ZIPITPinNineButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT PIN VIEW ROW THREE BUTTON ACTIONS
    //----------------------------------------------------------------
    
    
    @objc func ZIPITPinSevenButtonPressed() {
        
        
         handlePin(txt1: ZIPITPinP1Label, txt2: ZIPITPinP2Label, txt3: ZIPITPinP3Label, txt4: ZIPITPinP4Label, button: ZIPITPinSevenButton)
        
    }
    
    @objc func ZIPITPinEightButtonPressed() {
        
         handlePin(txt1: ZIPITPinP1Label, txt2: ZIPITPinP2Label, txt3: ZIPITPinP3Label, txt4: ZIPITPinP4Label, button: ZIPITPinEightButton)
        
    }
    
    @objc func ZIPITPinNineButtonPressed() {
        
       handlePin(txt1: ZIPITPinP1Label, txt2: ZIPITPinP2Label, txt3: ZIPITPinP3Label, txt4: ZIPITPinP4Label, button: ZIPITPinNineButton)
        
    }
    
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT PIN VIEW KEYBOARD ROW FOUR STACKVIEW
    //----------------------------------------------------------------
    
    func makeZIPITPinViewRowFourStackView() -> UIStackView {
        
        ZIPITPinZeroButton.layer.cornerRadius = 3
        ZIPITPinZeroButton.backgroundColor = UIColor.white
        ZIPITPinZeroButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITPinDeleteButton.layer.cornerRadius = 3
        ZIPITPinDeleteButton.backgroundColor = UIColor.white
        ZIPITPinDeleteButton.setTitleColor(UIColor.black, for: .normal)
        
        
        ZIPITPinZeroButton.addTarget(self, action: #selector(ZIPITPinZeroButtonPressed), for: .touchUpInside)
        ZIPITPinDeleteButton.addTarget(self, action: #selector(ZIPITPinDeleteButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [ZIPITPinZeroButton, ZIPITPinDeleteButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT PIN VIEW ROW FOUR BUTTON ACTIONS
    //----------------------------------------------------------------
    
    
    @objc func ZIPITPinZeroButtonPressed() {
        
        handlePin(txt1: ZIPITPinP1Label, txt2: ZIPITPinP2Label, txt3: ZIPITPinP3Label, txt4: ZIPITPinP4Label, button: ZIPITPinZeroButton)
    }
    
    
    
    @objc func ZIPITPinDeleteButtonPressed() {
        
        clearPin(txt1: ZIPITPinP1Label, txt2: ZIPITPinP2Label, txt3: ZIPITPinP3Label, txt4: ZIPITPinP4Label)
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT PIN KEYBOARD CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeZIPITPinKeyboardContainer(){
        
        ZIPITPinKeyboardContainer.backgroundColor = Theme.LighterGray
        ZIPITPinKeyboardContainer.layer.cornerRadius = 0
        ZIPITPinView.addSubview(ZIPITPinKeyboardContainer)
        
        ZIPITPinKeyboardContainer.topAnchor.constraint(equalTo: ZIPITPinTopContainer.bottomAnchor, constant: 6).isActive = true
        ZIPITPinKeyboardContainer.leftAnchor.constraint(equalTo:   ZIPITPinView.leftAnchor, constant: 6).isActive = true
        ZIPITPinKeyboardContainer.rightAnchor.constraint(equalTo:  ZIPITPinView.rightAnchor, constant: -6).isActive = true
        ZIPITPinKeyboardContainer.bottomAnchor.constraint(equalTo: ZIPITPinView.bottomAnchor, constant: -6).isActive = true
        
        makeZIPITPinKeyBoardParentStackView()
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT PIN VIEW KEYBOARD PARENT STACKVIEW
    //----------------------------------------------------------------
    
    func makeZIPITPinKeyBoardParentStackView(){
        
        let pStackView = Controls().theParentStackView(buttons: [makeZIPITPinViewRowOneStackView(), makeZIPITPinViewRowTwoStackView(), makeZIPITPinViewRowThreeStackView(), makeZIPITPinViewRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 6
        ZIPITPinKeyboardContainer.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: ZIPITPinKeyboardContainer.leftAnchor).isActive = true
        pStackView.rightAnchor.constraint(equalTo: ZIPITPinKeyboardContainer.rightAnchor).isActive = true
        pStackView.topAnchor.constraint(equalTo: ZIPITPinKeyboardContainer.topAnchor).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: ZIPITPinKeyboardContainer.bottomAnchor).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIMSWITCH TOKEN
    //----------------------------------------------------------------
    
    func ZIPITToken(pan: String, pinBlock: String, transactionAmount: String, biller: String, imei: String, customerMsisdn: String, expiryDate: String) {
        
       makeProgressZIPITContainerView()
        
        let convertedAmount = Double(transactionAmount)! * 100
        let conv = Int(convertedAmount)
        
        let finalConvertedAmount = String(conv)
        
        print("CONVERTED AMOUNT: \(Int(finalConvertedAmount)!)")
        
        let panValue = pan.aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let pinBlockValue = pinBlock.aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let transactionAmountValue = "\(finalConvertedAmount)".aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let billerValue = "ZIPIT".aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let imeiValue = imei.aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let expiryDateValue = expiryDate.aesDecrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let customerMsisdnValue = customerMsisdn
        
        
        let parameters = Mapper().toJSON(PurchaseZimPostModel(pan: panValue, pinBlock: pinBlockValue, imei: imeiValue, transactionAmount: transactionAmountValue, biller: billerValue, channel: Channel.transactionChannel(), customerMsisdn: customerMsisdnValue, expiryDate: expiryDateValue))
        
        let url = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/socialMedia/secured/sosho/purchaseZim"
        
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: PurchaseZimModel?, error) in
            
            print("PURCHASE ZIM PARAMETERS: \(parameters)")
            print("PURCHASE ZIM URL: \(url)")
            
            if error != nil {
                
                print("ERROR: Error occured.)")
                
                self.zipitLoadingView.stopAnimating()
                self.zipitProgressLabel.text = "Error"
                self.zipitProgressConfirmLabel.text = "An error occured."
                self.zipitProgressOkbtn.isHidden = false
                
                
                
            }else {
                
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message! == "SUCCESS" {
                    
                    print(response!.message!)
                    
                    self.zipitLoadingView.removeFromSuperview()
                    self.zipitProgressView.removeFromSuperview()
                    
                    let decry =  response!.responseBody!.aesDecrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
                    
                    print(" DECRYPTED TOKEN: \(decry)")
                    
                    let zimswitchZIPITUrl = BaseEndPoint.LOCAL_BASE_URL + "/api/diaspora/zipitService/secured/zipitTransfer"
                    
                    let zipitParams = Mapper().toJSON(ZIPITPostModel(amount: "\(finalConvertedAmount)", destinationAccount: KeyboardSharedPreferences().getZIPITDestinationAccount()! ,accountNumber:  KeyboardSharedPreferences().getZIPITDestinationAccount()!, destinationInstitution: KeyboardSharedPreferences().getZIPITBankInstitution()!, mobileNumber: SharedPreference.getPhoneNumber()!, channel: "ZIPIT", debitCurrency: "USD", token: decry, provider: "ZIPIT"))
                    
                    self.sendZIPITZIMSWITCH(url: zimswitchZIPITUrl, parameters: zipitParams)
                    
                    
                }else {
                    
                    print("ERROR OCCURED....")
                    self.zipitLoadingView.stopAnimating()
                    self.zipitProgressLabel.text = response!.message!
//                    self.zipitProgressConfirmLabel.text = response!.responseBody!
                    self.zipitProgressOkbtn.isHidden = false
                    
                }
                
            }
            
            
        }
        
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIMSWITCH ECOCASH TOKEN
    //----------------------------------------------------------------
    
    func ZIMSWITCHEcocashToken(pan: String, pinBlock: String, transactionAmount: String, biller: String, imei: String, customerMsisdn: String, expiryDate: String) {
        
        makeProgressZIPITContainerView()
        
        let convertedAmount = Double(transactionAmount)! * 100
        let conv = Int(convertedAmount)
        
        let finalConvertedAmount = String(conv)
        
        print("CONVERTED AMOUNT: \(Int(finalConvertedAmount)!)")
        
        let panValue = pan.aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let pinBlockValue = pinBlock.aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let transactionAmountValue = "\(finalConvertedAmount)".aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let billerValue = "ZIPIT".aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let imeiValue = imei.aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let expiryDateValue = expiryDate.aesDecrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let customerMsisdnValue = customerMsisdn
        
        
        let parameters = Mapper().toJSON(PurchaseZimPostModel(pan: panValue, pinBlock: pinBlockValue, imei: imeiValue, transactionAmount: transactionAmountValue, biller: billerValue, channel: Channel.transactionChannel(), customerMsisdn: customerMsisdnValue, expiryDate: expiryDateValue))
        
        let url = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/socialMedia/secured/sosho/purchaseZim"
        
        print("AIRTIME ZIMSWITCH PURCHASE URL: \(url)")
        print("AIRTIME ZIMSWITCH PURCHASE PARAMETERS: \(parameters)")
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: PurchaseZimModel?, error) in
            
            if error != nil {
                
                print("ERROR: Error occured.)")
                
                self.zipitLoadingView.stopAnimating()
                self.zipitProgressLabel.text = "Error"
                self.zipitProgressConfirmLabel.text = "An error occured."
                self.zipitProgressOkbtn.isHidden = false
                
            }else {
                
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message! == "SUCCESS" {
                    
                    print(response!.message!)
                    
                    let decry =  response!.responseBody!.aesDecrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
                    
                    print("DECRYPTED TOKEN: \(decry)")
                    
                    let zimswitchZIPITUrl = BaseEndPoint.LOCAL_BASE_URL + "/api/diaspora/zipitService/secured/zipitTransfer"

                    let zipitParams = Mapper().toJSON(ZIPITPostModel(amount: "\(finalConvertedAmount)", destinationAccount: KeyboardSharedPreferences().getZIPITDestinationAccount()! ,accountNumber:  KeyboardSharedPreferences().getZIPITDestinationAccount()!, destinationInstitution: KeyboardSharedPreferences().getZIPITBankInstitution()!, mobileNumber: SharedPreference.getPhoneNumber()!, channel: "ZIPIT", debitCurrency: "USD", token: decry, provider: "ZIPIT"))

                    self.sendZIPITZIMSWITCH(url: zimswitchZIPITUrl, parameters: zipitParams)
                    
                    
                }else {
                    
                    print("ERROR OCCURED....")
                    self.zipitLoadingView.stopAnimating()
                    self.zipitProgressLabel.text = response!.message!
                    //                    self.zipitProgressConfirmLabel.text = response!.responseBody!
                    self.zipitProgressOkbtn.isHidden = false
                    
                }
                
            }
            
        }
    
    }
    
    
    //----------------------------------------------------------------
    

    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SEND ZIPIT
    //----------------------------------------------------------------
    
    func sendZIPITZIMSWITCH(url: String, parameters: [String:Any]){
        
        makeProgressParticleProgressBar(containingView: ZIPITPinView)
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: ZIPITModel?, error) in
            
            print("ZIMSWITCH ZIPIT PARAMETERS: \(parameters)")
            print("ZIMSWITCH ZIPIT URL: \(url)")
            
            if error != nil {
                
                 print("ERROR: \(error!.localizedFailureReason!)")
                 self.dismissParticleProgresssDialog()
                self.makeSquareZIPITFinalDialog(transactionMessage: "Oops. That didn't go as planned. The problem is: Network Connection", icon: "oops")
                
            }else {
                
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message == "SUCCESS" {
                    
                    print(response!.message!)
                    
                    self.dismissParticleProgresssDialog()
                    self.makeSquareZIPITFinalDialog(transactionMessage: "Yaay. Your ZIPIT transfer of $\(KeyboardSharedPreferences().getZIPITAmount()!) was successful.", icon: "sosho_icon")
                    
                }else {

                    self.dismissParticleProgresssDialog()
                    self.makeSquareZIPITFinalDialog(transactionMessage: "Oops. That didn't go as planned. The problem is: \(response!.responseBody!)", icon: "oops")
                   
                }
            }
        }
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT T24 AUTH
    //----------------------------------------------------------------
    
    func ZipitT24Auth(url: String, parameters: [String: Any]){
        
        makeProgressParticleProgressBar(containingView: ZIPITPinView)
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: ZipitT24AuthModel?, error) in
            
            if error != nil {
                
                print(error.debugDescription)
                self.stopParticleProgressDialog(generalProgressLabel: "Error", generalProgressConfirmLabel: "An error occurred", generalBtnVisibility: false)
                
            }else {
                
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message == "SUCCESS" {
                    
                    self.dismissParticleProgresssDialog()
                    
                    
                }else {
                    
                    
                    print(response!.message!)
                    self.stopParticleProgressDialog(generalProgressLabel: "Error", generalProgressConfirmLabel: "An error occurred", generalBtnVisibility: false)
                    
                }
                
            }
        }
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ADD PROGRESS CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeProgressZIPITContainerView(){
        
        zipitProgressView.backgroundColor = #colorLiteral(red: 0.1981083439, green: 0.04320339475, blue: 0.1978468009, alpha: 0.8520173373)
        ZIPITPinView.addSubview(zipitProgressView)
        
    
        zipitProgressView.topAnchor.constraint(equalTo: ZIPITPinView.topAnchor, constant: 0).isActive = true
        zipitProgressView.leftAnchor.constraint(equalTo: ZIPITPinView.leftAnchor, constant: 0).isActive = true
        zipitProgressView.rightAnchor.constraint(equalTo: ZIPITPinView.rightAnchor, constant: 0).isActive = true
        zipitProgressView.bottomAnchor.constraint(equalTo: ZIPITPinView.bottomAnchor, constant: 0).isActive = true
        
        
        zipitProgressView.addSubview(zipitLoadingView)
        
        zipitLoadingView.centerYAnchor.constraint(equalTo: zipitProgressView.centerYAnchor).isActive = true
        zipitLoadingView.centerXAnchor.constraint(equalTo: zipitProgressView.centerXAnchor).isActive = true
        zipitLoadingView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        zipitLoadingView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        zipitLoadingView.addSubview(zipitProgressLabel)
        zipitProgressLabel.text = "Please Wait"
        zipitProgressLabel.textColor = Theme.WhitePrimary
        zipitProgressLabel.numberOfLines = 0
        zipitProgressLabel.textAlignment = .center
        zipitProgressLabel.centerYAnchor.constraint(equalTo: zipitLoadingView.centerYAnchor).isActive = true
        zipitProgressLabel.centerXAnchor.constraint(equalTo: zipitLoadingView.centerXAnchor).isActive = true
        zipitProgressLabel.leftAnchor.constraint(equalTo: zipitLoadingView.leftAnchor, constant: 3).isActive = true
        zipitProgressLabel.rightAnchor.constraint(equalTo: zipitLoadingView.rightAnchor, constant: -3).isActive = true
        
        
        zipitProgressView.addSubview(zipitProgressConfirmLabel)
        zipitProgressConfirmLabel.text = ""
        zipitProgressConfirmLabel.textColor = Theme.WhitePrimary
        zipitProgressConfirmLabel.textAlignment = .center
        zipitProgressConfirmLabel.topAnchor.constraint(equalTo: zipitLoadingView.bottomAnchor, constant: 16).isActive = true
        zipitProgressConfirmLabel.leftAnchor.constraint(equalTo: zipitProgressView.leftAnchor, constant: 3).isActive = true
        zipitProgressConfirmLabel.rightAnchor.constraint(equalTo: zipitProgressView.rightAnchor, constant: -3).isActive = true
        
        
        zipitProgressView.addSubview(zipitProgressOkbtn)
        zipitProgressOkbtn.backgroundColor = UIColor.white
        zipitProgressOkbtn.layer.cornerRadius = 5
        zipitProgressOkbtn.setTitleColor(Theme.PrimaryPurple, for: .normal)
        zipitProgressOkbtn.addTarget(self, action: #selector(zipitProgressOkbtnPressed), for: .touchUpInside)
        
        zipitProgressOkbtn.topAnchor.constraint(equalTo: zipitProgressView.topAnchor, constant: 10).isActive = true
        zipitProgressOkbtn.rightAnchor.constraint(equalTo: zipitProgressView.rightAnchor, constant: -8).isActive = true
        zipitProgressOkbtn.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        zipitProgressOkbtn.isHidden = true
        
        
        zipitLoadingView.startAnimating()
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
   
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT PROGRESS OKAY BTN ACTION
    //----------------------------------------------------------------
    
    @objc func zipitProgressOkbtnPressed(){
        
        
        zipitProgressView.removeFromSuperview()
        zipitLoadingView.removeFromSuperview()
        ZIPITPinView.removeFromSuperview()
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIMSWITCH AIRTIME AUTH
    //----------------------------------------------------------------
    
    
    
    func zimswitchAirtimeAuth(url: String, parameters: [String: Any]){
        
        self.makeProgressParticleProgressBar(containingView: self.ZIPITPinView)
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: AirtimeModel?, error) in
            
            
            print("AIRTIME AUTH URL: \(url)")
            print("AIRTIME AUTH PARAMETERS: \(parameters)")
            
            
            
            if error != nil {
                
                print("Error: \(error.debugDescription)")
                
                self.stopParticleProgressDialog(generalProgressLabel: "Error", generalProgressConfirmLabel: "An Error Occured", generalBtnVisibility: false)
                
            }else {
                
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message == "SUCCESS" {
                    
                    self.dismissParticleProgresssDialog()
//                    self.AirtimeZimswitchToken(pan: self.ZIPIT_CARD_NUMBER, pinBlock: self.pinString, transactionAmount: self.transactionAmount, self.ZIPIT_AMOUNT, biller: "ZIPIT", imei: SharedPreference.getIMEI()!, customerMsisdn: SharedPreference.getPhoneNumber()!)
                    
                    KeyboardSharedPreferences().setAirtimeAuthToken(token: response!.airtimeResponseBody!)
                    
//                    guard let expDate = KeyboardSharedPreferences().getExpiryDate() else {
//
//                        return
//                    }
                    
                    let expDate = KeyboardSharedPreferences().getExpiryDate() ?? ""
                    
                  
                    self.AirtimeZimswitchToken(pan: self.ZIPIT_CARD_NUMBER, pinBlock: self.pinString, transactionAmount: KeyboardSharedPreferences().getAirtimeAmount()!, biller: KeyboardSharedPreferences().getAirtimeNetworkProvider()!, imei: SharedPreference.getIMEI()!, customerMsisdn: SharedPreference.getPhoneNumber()!, expiryDate: expDate)
                    
                }else {
                    
                    self.dismissParticleProgresssDialog()
                    self.stopParticleProgressDialog(generalProgressLabel: response!.message!, generalProgressConfirmLabel: response!.airtimeResponseBody!, generalBtnVisibility: false)
                    
                }
                
            }
            
        }
        
    }
    
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME ZIMSWITCH TOKEN
    //----------------------------------------------------------------
    
    func AirtimeZimswitchToken(pan: String, pinBlock: String, transactionAmount: String, biller: String, imei: String, customerMsisdn: String, expiryDate: String) {
        
        makeProgressZIPITContainerView()
        
        let convertedAmount = Double(transactionAmount)! * 100
        let conv = Int(convertedAmount)
        
        let finalConvertedAmount = String(conv)
        
        print("CONVERTED AMOUNT: \(Int(finalConvertedAmount)!)")
        
        let panValue = pan.aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let pinBlockValue = pinBlock.aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let transactionAmountValue = "\(finalConvertedAmount)".aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let billerValue = biller.aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let imeiValue = imei.aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let expiryDateValue = expiryDate.aesDecrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let customerMsisdnValue = customerMsisdn
        
        
        var parameters = [String: Any]()
        
        if KeyboardSharedPreferences().getIsExpiry() == "1" {
            
            KeyboardSharedPreferences().setIsExpiry(isExpiry: "0")
            
           parameters = Mapper().toJSON(PurchaseZimPostModel(pan: panValue, pinBlock: pinBlockValue, imei: imeiValue, transactionAmount: transactionAmountValue, biller: billerValue, channel: Channel.transactionChannel(), customerMsisdn: customerMsisdnValue, expiryDate: expiryDateValue))
            
            
        }else {
            
           parameters = Mapper().toJSON(PurchaseZimPostModel(pan: panValue, pinBlock: pinBlockValue, imei: imeiValue, transactionAmount: transactionAmountValue, biller: billerValue, channel: Channel.transactionChannel(), customerMsisdn: customerMsisdnValue))
        }
        
        let url = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/socialMedia/secured/sosho/purchaseZim"
        
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: PurchaseZimModel?, error) in
            
            print("PURCHASE ZIM PARAMETERS: \(parameters)")
            print("PURCHASE ZIM URL: \(url)")
            
            if error != nil {
                
                print("ERROR: Error occured.)")
                
                self.zipitLoadingView.stopAnimating()
                self.zipitProgressLabel.text = "Error"
                self.zipitProgressConfirmLabel.text = "An error occured."
                self.zipitProgressOkbtn.isHidden = false
                
            }else {
                
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message! == "SUCCESS" {
                    
//                    print(response!.message!)
                    self.zipitLoadingView.removeFromSuperview()
                    self.zipitProgressView.removeFromSuperview()
                    
                    
                    let decry =  response!.responseBody!.aesDecrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
//
                    print("DECRYPTED TOKEN: \(decry)")
                    
                    let airtimeUrl = BaseEndPoint.LOCAL_BASE_URL + "/api/billpayengine/secured/thirdParty/payBill"
                    
                    let airtimeParameters = Mapper().toJSON(AirtimePayPostModel(cardReference: "1234560000000001", payerMsisdn: SharedPreference.getEcocashEcocashPhone()!, payerName: "Soshaloza", billAccount: KeyboardSharedPreferences().getAirtimeRecipient()!, billAmount: FormatMoney.changeFromStringToInt(amount: KeyboardSharedPreferences().getAirtimeAmount()!), billProvider: KeyboardSharedPreferences().getAirtimeNetworkProvider()!, channel: "MobileWorld", debitAccountnumber: "1007000000", debitCurrency: "USD", token: decry, provider: KeyboardSharedPreferences().getAirtimeNetworkProvider()!, providerProduct: "AIRTIME", participantReference: KeyboardSharedPreferences().getAirtimeAuthToken()!))
                    
                    self.buyAirtimeWithZimswitch(url: airtimeUrl, parameters: airtimeParameters)

//                    let zimswitchZIPITUrl = BaseEndPoint.LOCAL_BASE_URL + "/api/diaspora/zipitService/secured/zipitTransfer"
//
//                    let zipitParams = Mapper().toJSON(ZIPITPostModel(amount: "\(finalConvertedAmount)", destinationAccount: KeyboardSharedPreferences().getZIPITDestinationAccount()! ,accountNumber:  KeyboardSharedPreferences().getZIPITDestinationAccount()!, destinationInstitution: KeyboardSharedPreferences().getZIPITBankInstitution()!, mobileNumber: SharedPreference.getPhoneNumber()!, channel: "ZIPIT", debitCurrency: "USD", token: decry, provider: "ZIPIT"))
//
//                    self.sendZIPITZIMSWITCH(url: zimswitchZIPITUrl, parameters: zipitParams)

                    
                }else {
                    
                    print("ERROR OCCURED....")
                    self.zipitLoadingView.stopAnimating()
                    self.zipitProgressLabel.text = response!.message!
                    //                    self.zipitProgressConfirmLabel.text = response!.responseBody!
                    self.zipitProgressOkbtn.isHidden = false
                    
                }
                
            }
        }
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ECOCASH AIRTIME WITH ZIMSWITCH PAYMENT OPTION
    //----------------------------------------------------------------
    
    func buyAirtimeWithZimswitch(url: String, parameters: [String: Any]){
        
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
                    
                    self.dismissParticleProgresssDialog()
                    self.makeZIPITTransferFinalDialog(transactionMessage: "Yaay, your airtime purchase was successful", icon: "sosho_icon")
                    
                    
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
    // MARK:- TAKE ZIPIT MONEY FROM  SQUARE
    //----------------------------------------------------------------
    
    func takeZIPITMoneyFromSquare(url: String, parameters: [String: Any]){
        
        makeProgressParticleProgressBar(containingView: ZIPITPinView)
        
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
                    
                    let zimswitchZIPITUrl = BaseEndPoint.LOCAL_BASE_URL + "/api/diaspora/zipitService/secured/zipitTransfer"
                    
                    let convertedAmount = Double(KeyboardSharedPreferences().getZIPITAmount()!)! * 100
                    let conv = Int(convertedAmount)
                    
                    let finalConvertedAmount = String(conv)
                    
                    let zipitParams = Mapper().toJSON(ZIPITPostModel(amount: "\(finalConvertedAmount)", destinationAccount: KeyboardSharedPreferences().getZIPITDestinationAccount()! ,accountNumber:  KeyboardSharedPreferences().getZIPITDestinationAccount()!, destinationInstitution: KeyboardSharedPreferences().getZIPITBankInstitution()!, mobileNumber: SharedPreference.getPhoneNumber()!, channel: "ZIPIT", debitCurrency: "USD", token: response!.responseBody!, provider: "ZIPIT"))
                    
                    self.sendZIPITZIMSWITCH(url: zimswitchZIPITUrl, parameters: zipitParams)
                    
                }else{
                    
                    self.stopParticleProgressDialog(generalProgressLabel: response!.message!, generalProgressConfirmLabel: response!.responseBody!, generalBtnVisibility: false)
                }
                
            }
        }
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SQUARE ZIPIT FINAL DIALOG
    //----------------------------------------------------------------
    
    func makeSquareZIPITFinalDialog(transactionMessage: String, icon: String){
        
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
        
        
        
        balanceFinalDialogMsgBtn.addTarget(self, action: #selector(squareZIPITFinalDialogMsgBtnPressed), for: .touchUpInside)
        
        balanceFinalDialogCloseBtn.addTarget(self, action: #selector(sqaureZIPITFinalDialogCloseBtnPressed), for: .touchUpInside)
        
    }
    
    //----------------------------------------------------------------
    
    @objc func squareZIPITFinalDialogMsgBtnPressed(){
        
        let proxy = textDocumentProxy
        proxy.insertText("I have just sent you a ZIPIT Transfer of $\(Double(KeyboardSharedPreferences().getZIPITAmount()!)!) to Your account: \(KeyboardSharedPreferences().getZIPITDestinationAccount()!)")
        
    }
    
    
    @objc func sqaureZIPITFinalDialogCloseBtnPressed() {
        
        balanceFinalDialog.removeFromSuperview()
    }
    
}

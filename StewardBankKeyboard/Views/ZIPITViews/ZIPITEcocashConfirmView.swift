//
//  ZIPITEcocashConfirmView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/19/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import ParticlesLoadingView

extension KeyboardViewController {
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE NUMERIC KEYBOARD MAIN
    //----------------------------------------------------------------
    
    func makeNumericKeyboardView(){
        
        numericKeyboardView.backgroundColor = Theme.LighterGray
        numericKeyboardView.layer.cornerRadius = 0
        view.addSubview(numericKeyboardView)
        setUpNumericKeyboardViewConstraints()
        makeNumericKeyboardViewTopContainer()
        makeNumericKeyboardViewContainer()
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE NUMERIC KEYBOARD VIEW TOP CONTAINER
    //----------------------------------------------------------------
    
    func makeNumericKeyboardViewTopContainer(){
        
        numericKeyboardTopContainer.backgroundColor = Theme.LighterGray
        numericKeyboardTopContainer.layer.cornerRadius = 0
        numericKeyboardView.addSubview(numericKeyboardTopContainer)
        
        numericKeyboardTopContainer.topAnchor.constraint(equalTo: numericKeyboardView.topAnchor).isActive = true
        numericKeyboardTopContainer.leftAnchor.constraint(equalTo: numericKeyboardView.leftAnchor).isActive = true
        numericKeyboardTopContainer.rightAnchor.constraint(equalTo: numericKeyboardView.rightAnchor).isActive = true
        numericKeyboardTopContainer.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        makeNumericKeyboardTopContainerLabel()
        makeNumericKeyboardViewBackButton()
        makeNumericKeyboardViewRightButton()
//        makeNumericKeyboardTopContainerTextField()
        
        
    }
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE NUMERIC KEYBOARD TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeNumericKeyboardTopContainerLabel(){
        
        numericKeyboardTopContainer.addSubview(numericKeyboardTopContainerLabel)
        numericKeyboardTopContainerLabel.textAlignment = .center
        numericKeyboardTopContainerLabel.numberOfLines = 0
        
        numericKeyboardTopContainerLabel.topAnchor.constraint(equalTo: numericKeyboardTopContainer.topAnchor, constant: 3).isActive = true
        numericKeyboardTopContainerLabel.leftAnchor.constraint(equalTo: numericKeyboardTopContainer.leftAnchor, constant: 40).isActive = true
        numericKeyboardTopContainerLabel.rightAnchor.constraint(equalTo: numericKeyboardTopContainer.rightAnchor, constant: -40).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE NUMERIC KEYBOARD VIEW BACK BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeNumericKeyboardViewBackButton(){
        
        numericKeyboardBackBtn.layer.cornerRadius = 15
        numericKeyboardTopContainer.addSubview(numericKeyboardBackBtn)
        
        
        numericKeyboardBackBtn.addTarget(self, action: #selector(numericKeyboardBackBtnPressed), for: .touchUpInside)
        
        numericKeyboardBackBtn.topAnchor.constraint(equalTo: numericKeyboardTopContainer.topAnchor, constant: 16).isActive = true
        numericKeyboardBackBtn.leftAnchor.constraint(equalTo: numericKeyboardTopContainer.leftAnchor, constant: 8).isActive = true
        numericKeyboardBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        numericKeyboardBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- NUMERIC KEYBOARD BACK BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func numericKeyboardBackBtnPressed(){
        KeyboardSharedPreferences().setEcocashPaymentStatus(ecocashpaymentstatus: "0")
        numericKeyboardView.removeFromSuperview()
        makeTheKeyBoard()
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE NUMERIC KEYBOARD VIEW RIGHT BUTTON VIEW
    //----------------------------------------------------------------
    
    func makeNumericKeyboardViewRightButton(){
        
        numericKeyboardRightBtn.layer.cornerRadius = 15
        numericKeyboardTopContainer.addSubview(numericKeyboardRightBtn)
        //      airtimeAmountViewRightButtonPressed()
        
        numericKeyboardRightBtn.addTarget(self, action: #selector(numericKeyboardRightBtnPressed), for: .touchUpInside)
        
        numericKeyboardRightBtn.topAnchor.constraint(equalTo: numericKeyboardTopContainer.topAnchor, constant: 16).isActive = true
        numericKeyboardRightBtn.rightAnchor.constraint(equalTo: numericKeyboardTopContainer.rightAnchor, constant: -8).isActive = true
        numericKeyboardRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        numericKeyboardRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- NUMERIC KEYBOARD RIGHT BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func numericKeyboardRightBtnPressed(){
//
//        ZIPIT_AMOUNT = ZIPITAmountTextField.text!
//
//        print("ZIPIT_AMOUNT: \(ZIPIT_AMOUNT)")
//
//        makeZIPITPaymentsOptionsView()
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE NUMERIC KEYBOARD TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeNumericKeyboardTopContainerTextField(){
        
        numericKeyboardTopContainer.addSubview(numericKeyboardTextField)
        numericKeyboardTextField.textAlignment = .center
        numericKeyboardTextField.backgroundColor = UIColor.white
        numericKeyboardTextField.layer.cornerRadius = 5
        numericKeyboardTextField.layer.masksToBounds = true
        numericKeyboardTextField.textColor = UIColor.gray
        
        numericKeyboardTextField.centerYAnchor.constraint(equalTo: numericKeyboardBackBtn.centerYAnchor).isActive = true
        numericKeyboardTextField.leftAnchor.constraint(equalTo: numericKeyboardBackBtn.rightAnchor, constant: 30).isActive = true
        numericKeyboardTextField.rightAnchor.constraint(equalTo: numericKeyboardRightBtn.leftAnchor, constant: -30).isActive = true
        numericKeyboardTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE NUMERIC KEYBOARD KEYBOARD CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeNumericKeyboardViewContainer(){
        
        numericKeyboardKeyboardContainer.backgroundColor = Theme.LighterGray
        numericKeyboardKeyboardContainer.layer.cornerRadius = 0
        numericKeyboardView.addSubview(numericKeyboardKeyboardContainer)
        
        numericKeyboardKeyboardContainer.topAnchor.constraint(equalTo: numericKeyboardTopContainer.bottomAnchor, constant: 6).isActive = true
        numericKeyboardKeyboardContainer.leftAnchor.constraint(equalTo: numericKeyboardView.leftAnchor, constant: 6).isActive = true
        numericKeyboardKeyboardContainer.rightAnchor.constraint(equalTo: numericKeyboardView.rightAnchor, constant: -6).isActive = true
        numericKeyboardKeyboardContainer.bottomAnchor.constraint(equalTo: numericKeyboardView.bottomAnchor, constant: -6).isActive = true
        
        makeNumericKeyboardParentStackView()
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE NUMERIC KEYBOARD VIEW KEYBOARD ROW ONE STACKVIEW
    //----------------------------------------------------------------
    
    func makeNumericKeyboardRowOneStackView() -> UIStackView {
        
        numericKeyboardOneButton.layer.cornerRadius = 3
        numericKeyboardOneButton.backgroundColor = UIColor.white
        numericKeyboardOneButton.setTitleColor(UIColor.black, for: .normal)
        numericKeyboardTwoButton.layer.cornerRadius = 3
        numericKeyboardTwoButton.backgroundColor = UIColor.white
        numericKeyboardTwoButton.setTitleColor(UIColor.black, for: .normal)
        numericKeyboardThreeButton.layer.cornerRadius = 3
        numericKeyboardThreeButton.backgroundColor = UIColor.white
        numericKeyboardThreeButton.setTitleColor(UIColor.black, for: .normal)

        numericKeyboardOneButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        numericKeyboardTwoButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        numericKeyboardThreeButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [numericKeyboardOneButton, numericKeyboardTwoButton, numericKeyboardThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE NUMERIC KEYBOARD VIEW KEYBOARD ROW TWO STACKVIEW
    //----------------------------------------------------------------
    
    func makeNumericKeyboardRowTwoStackView() -> UIStackView {
        
        numericKeyboardFourButton.layer.cornerRadius = 3
        numericKeyboardFourButton.backgroundColor = UIColor.white
        numericKeyboardFourButton.setTitleColor(UIColor.black, for: .normal)
        numericKeyboardFiveButton.layer.cornerRadius = 3
        numericKeyboardFiveButton.backgroundColor = UIColor.white
        numericKeyboardFiveButton.setTitleColor(UIColor.black, for: .normal)
        numericKeyboardSixButton.layer.cornerRadius = 3
        numericKeyboardSixButton.backgroundColor = UIColor.white
        numericKeyboardSixButton.setTitleColor(UIColor.black, for: .normal)
        
        numericKeyboardFourButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        numericKeyboardFiveButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        numericKeyboardSixButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [numericKeyboardFourButton, numericKeyboardFiveButton, numericKeyboardSixButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    //----------------------------------------------------------------
    
   
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE NUMERIC KEYBOARD VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makeNumericKeyboardRowThreeStackView() -> UIStackView {
        
        numericKeyboardSevenButton.layer.cornerRadius = 3
        numericKeyboardSevenButton.backgroundColor = UIColor.white
        numericKeyboardSevenButton.setTitleColor(UIColor.black, for: .normal)
        numericKeyboardEightButton.layer.cornerRadius = 3
        numericKeyboardEightButton.backgroundColor = UIColor.white
        numericKeyboardEightButton.setTitleColor(UIColor.black, for: .normal)
        numericKeyboardNineButton.layer.cornerRadius = 3
        numericKeyboardNineButton.backgroundColor = UIColor.white
        numericKeyboardNineButton.setTitleColor(UIColor.black, for: .normal)
        
        numericKeyboardSevenButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        numericKeyboardEightButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        numericKeyboardNineButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [numericKeyboardSevenButton, numericKeyboardEightButton, numericKeyboardNineButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    //----------------------------------------------------------------
    
   
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE NUMERIC KEYBOARD VIEW KEYBOARD ROW FOUR STACKVIEW
    //----------------------------------------------------------------
    
    func makeNumericKeyboardRowFourStackView() -> UIStackView {
        
       
        numericKeyboardCheckTransButton.layer.cornerRadius = 3
        numericKeyboardCheckTransButton.backgroundColor = Theme.PrimaryPurple
        numericKeyboardCheckTransButton.titleLabel?.font = .systemFont(ofSize: 10)
        numericKeyboardCheckTransButton.setTitleColor(UIColor.white, for: .normal)
        numericKeyboardZeroButton.layer.cornerRadius = 3
        numericKeyboardZeroButton.backgroundColor = UIColor.white
        numericKeyboardZeroButton.setTitleColor(UIColor.black, for: .normal)
        numericKeyboardDeleteButton.layer.cornerRadius = 3
        numericKeyboardDeleteButton.backgroundColor = UIColor.white
        numericKeyboardDeleteButton.setTitleColor(UIColor.black, for: .normal)
        
        numericKeyboardCheckTransButton.addTarget(self, action: #selector(numericKeyboardCheckTransButtonPressed), for: .touchUpInside)
        numericKeyboardZeroButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        numericKeyboardDeleteButton.addTarget(self, action: #selector(numericKeyboardDeleteButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [numericKeyboardCheckTransButton, numericKeyboardZeroButton, numericKeyboardDeleteButton])
       
        
        
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- NUMERIC KEYBOARD ROW FOUR BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func numericKeyboardCheckTransButtonPressed(){
        
      print("Check transaction")
        
        if KeyboardSharedPreferences().getAirtimeEcocashPaymentStatus()! == "1" {


            let url = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/ecocashcontainer/secured/ecocash/auth"

            let parameters = Mapper().toJSON(EcocashAuthPostModel(amount: KeyboardSharedPreferences().getEcocashAmount()!, correlater: KeyboardSharedPreferences().getEcocashCorrelater()!, reference: KeyboardSharedPreferences().getEcocashReference()!, status: KeyboardSharedPreferences().getEcocashStatus()!, ecocashReference: KeyboardSharedPreferences().getEcocashEcocashReference()!, ecocashStatus: KeyboardSharedPreferences().getEcocashEcocashStatus()!, phone: KeyboardSharedPreferences().getEcocashEcocashPhone()!, id: KeyboardSharedPreferences().getEcocashId()!, channel: "SOSHO", biller: KeyboardSharedPreferences().getAirtimeNetworkProvider()!))

            ecocashAirtimeAuth(url: url, parameters: parameters)
            
            
        }else if KeyboardSharedPreferences().getEcocashPaymentStatus()! == "1" {
            
            let url = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/ecocashcontainer/secured/ecocash/auth"
            
            let parameters = Mapper().toJSON(EcocashAuthPostModel(amount: KeyboardSharedPreferences().getEcocashAmount()!, correlater: KeyboardSharedPreferences().getEcocashCorrelater()!, reference: KeyboardSharedPreferences().getEcocashReference()!, status: KeyboardSharedPreferences().getEcocashStatus()!, ecocashReference: KeyboardSharedPreferences().getEcocashEcocashReference()!, ecocashStatus: KeyboardSharedPreferences().getEcocashEcocashStatus()!, phone: KeyboardSharedPreferences().getEcocashEcocashPhone()!, id: KeyboardSharedPreferences().getEcocashId()!, channel: "SOSHO", biller: "ZIPIT"))
            
            ecocashZipitAuth(url: url, parameters: parameters)
            
        }else if KeyboardSharedPreferences().getBillPaymentEcocashStatus() == "1" {
            
            let url = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/ecocashcontainer/secured/ecocash/auth"
            
            let parameters = Mapper().toJSON(EcocashAuthPostModel(amount: KeyboardSharedPreferences().getEcocashAmount()!, correlater: KeyboardSharedPreferences().getEcocashCorrelater()!, reference: KeyboardSharedPreferences().getEcocashReference()!, status: KeyboardSharedPreferences().getEcocashStatus()!, ecocashReference: KeyboardSharedPreferences().getEcocashEcocashReference()!, ecocashStatus: KeyboardSharedPreferences().getEcocashEcocashStatus()!, phone: KeyboardSharedPreferences().getEcocashEcocashPhone()!, id: KeyboardSharedPreferences().getEcocashId()!, channel: "SOSHO", biller: KeyboardSharedPreferences().getBillerCode()!))
            
            ecocashBillPaymentCheckTransaction(url: url, parameters: parameters)
        }
        
    }
    
  
    
    @objc func numericKeyboardDeleteButtonPressed(){
        
          proxy.deleteBackward()
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE NUMERIC KEYBOARD PARENT STACKVIEW
    //----------------------------------------------------------------
    
    func makeNumericKeyboardParentStackView(){
        
        let pStackView = Controls().theParentStackView(buttons: [makeNumericKeyboardRowOneStackView(), makeNumericKeyboardRowTwoStackView(), makeNumericKeyboardRowThreeStackView(), makeNumericKeyboardRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 6
        numericKeyboardKeyboardContainer.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: numericKeyboardKeyboardContainer.leftAnchor).isActive = true
        pStackView.rightAnchor.constraint(equalTo: numericKeyboardKeyboardContainer.rightAnchor).isActive = true
        pStackView.topAnchor.constraint(equalTo: numericKeyboardKeyboardContainer.topAnchor).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: numericKeyboardKeyboardContainer.bottomAnchor).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET UP NUMERIC KEYBOARD VIEW CONSTRAINTS
    //----------------------------------------------------------------
    
    func  setUpNumericKeyboardViewConstraints(){
        
        numericKeyboardView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        numericKeyboardView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        numericKeyboardView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        numericKeyboardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ECOCASH ZIPIT AUTH REQUEST METHOD
    //---------------------------------------------------------------
    
    
    func ecocashZipitAuth(url: String, parameters: [String: Any]){
        
        print("ECOCASH AUTH ZIPIT URL: \(url)")
        print("ECOCASH AUTH ZIPIT PARAMETERS: \(parameters)")
        
        makeProgressParticleProgressBar(containingView: ZIPITPaymentOptionsView)
        
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: EcocashAuthModel?, error) in
            
            if error != nil {
                
                print(error.debugDescription)
                
                self.stopParticleProgressDialog(generalProgressLabel: "Error", generalProgressConfirmLabel: "Error occured.", generalBtnVisibility: false)
                
            }else {
                
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message == "SUCCESS" {
                    
                   self.dismissParticleProgresssDialog()
                    
                    let zipitUrl = BaseEndPoint.LOCAL_BASE_URL + "/api/diaspora/zipitService/secured/zipitTransfer"
                    
                    let amount = KeyboardSharedPreferences().getZIPITAmount()!
                    print(KeyboardSharedPreferences().getZIPITAmount()!)
                    print(KeyboardSharedPreferences().getZIPITDestinationAccount()!)
                    print(KeyboardSharedPreferences().getZIPITBankInstitution()!)
                    print(SharedPreference.getEcocashEcocashPhone()!)
                    print(Channel.transactionChannel())
                    print( response!.responseBody!)
                    
//                    let amnt = Int(KeyboardSharedPreferences().getZIPITAmount()!)! * 100
                    
                    let zipitAmount = Double(amount)! * 100
                    
                    let zipitFinalAmount = Int(zipitAmount)

                    print("ZIPIT FINAL AMOUNT: \(zipitFinalAmount)")
                    
                    let zipitParameters = Mapper().toJSON(ZIPITPostModel(amount: "\(zipitFinalAmount)",  destinationAccount: KeyboardSharedPreferences().getZIPITDestinationAccount()!, accountNumber: KeyboardSharedPreferences().getZIPITDestinationAccount()!,  destinationInstitution: KeyboardSharedPreferences().getZIPITBankInstitution()!, mobileNumber: SharedPreference.getEcocashEcocashPhone()!, channel: Channel.transactionChannel(), debitCurrency: "USD", token: response!.responseBody!, provider: "ZIPIT"))
                    
                    self.sendZIPIT(url: zipitUrl, parameters: zipitParameters)
                    
                }else {
                    
                    print(response!.message!)
                    print(response!.responseBody!)
                    
                    self.stopParticleProgressDialog(generalProgressLabel: response!.message!, generalProgressConfirmLabel: response!.responseBody!, generalBtnVisibility: false)
                    
                }
                
    
            }
            
        }
        
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SEND ZIPIT REQUEST METHOD
    //----------------------------------------------------------------
    
    func sendZIPIT(url: String, parameters: [String: Any]){
        
        self.makeProgressParticleProgressBar(containingView: numericKeyboardView)
        print("SEND ZIPIT URL: \(url)")
        print("SEND ZIPIT PARAMETERS: \(parameters)")
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: ZIPITModel?, error) in
            
            
            if error != nil {
                
                print(error.debugDescription)
                self.dismissParticleProgresssDialog()
                self.makeZIPITTransferFinalDialog(transactionMessage: "Oops. That didn't go as planned. The problem is: FAILED", icon: "oops")
                
            }else {
                
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message == "SUCCESS" {
                    
                    self.dismissParticleProgresssDialog()
                    
                    self.makeZIPITTransferFinalDialog(transactionMessage: "Yaay. Your ZIPIT transfer was successful.", icon: "sosho_icon")
                    
                    SharedPreference.setEcocashPaymentStatus(ecocashpaymentstatus: "0")
                    SharedPreference.clearEcocashPreferences()
                    
                }else{
                    
                    self.makeZIPITTransferFinalDialog(transactionMessage: "Oops. That didn't go as planned. The problem is: FAILED", icon: "oops")
                }
            }
        }
        
        
    }
    
    
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ECOCASH AIRTIME AUTH REQUEST METHOD
    //---------------------------------------------------------------
    
    
    func ecocashAirtimeAuth(url: String, parameters: [String: Any]){
        
        print("ECOCASH AUTH AIRTIME URL: \(url)")
        print("ECOCASH AUTH AIRTIME PARAMETERS: \(parameters)")
        
        makeProgressParticleProgressBar(containingView: numericKeyboardView)
        
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: EcocashAuthModel?, error) in
            
            if error != nil {
                
                print(error.debugDescription)
                
                self.stopParticleProgressDialog(generalProgressLabel: "Error", generalProgressConfirmLabel: "Error occured.", generalBtnVisibility: false)
                
            }else {
                
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message == "SUCCESS" {
                    
                    self.dismissParticleProgresssDialog()
                    
                    let airtimeUrl = BaseEndPoint.LOCAL_BASE_URL + "/api/billpayengine/secured/thirdParty/payBill"
                    
                    
                     print(SharedPreference.getEcocashEcocashPhone()!)
                     print(KeyboardSharedPreferences().getAirtimeRecipient()!)
                     print(FormatMoney.changeFromStringToInt(amount: KeyboardSharedPreferences().getAirtimeAmount()!))
                     print(KeyboardSharedPreferences().getAirtimeNetworkProvider()!)
                     print(KeyboardSharedPreferences().getAirtimeNetworkProvider()!)
                     print(KeyboardSharedPreferences().getAirtimeAuthToken()!)
                   
                    
                    
                    let airtimeParameters = Mapper().toJSON(AirtimePayPostModel(cardReference: "1234560000000001", payerMsisdn: SharedPreference.getEcocashEcocashPhone()!, payerName: "Soshaloza", billAccount: KeyboardSharedPreferences().getAirtimeRecipient()!, billAmount: FormatMoney.changeFromStringToInt(amount: KeyboardSharedPreferences().getAirtimeAmount()!), billProvider: KeyboardSharedPreferences().getAirtimeNetworkProvider()!, channel: "MobileWorld", debitAccountnumber: "1007000000", debitCurrency: "USD", token: response!.responseBody!, provider: KeyboardSharedPreferences().getAirtimeNetworkProvider()!, providerProduct: "AIRTIME", participantReference: KeyboardSharedPreferences().getAirtimeAuthToken()!))
                    
                    self.buyAirtime(url: airtimeUrl, parameters: airtimeParameters)
                    

                }else {
                    
                    print(response!.message!)
                    print(response!.responseBody!)
                    
                    self.stopParticleProgressDialog(generalProgressLabel: response!.message!, generalProgressConfirmLabel: response!.responseBody!, generalBtnVisibility: false)
                    
                }
                
                
            }
            
        }
        
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ECOCASH BILL PAYMENT  CHECK TRANSACTION REQUEST METHOD
    //---------------------------------------------------------------
    
    
    func ecocashBillPaymentCheckTransaction(url: String, parameters: [String: Any]){
        
        print("BILL PAYMENT CHECK TRANSACTION URL: \(url)")
        print("BILL PAYMENT CHECK TRANSACTION PARAMETERS: \(parameters)")
        
        makeProgressParticleProgressBar(containingView: numericKeyboardView)
        
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: EcocashAuthModel?, error) in
            
            if error != nil {
                
                print(error.debugDescription)
                
                self.stopParticleProgressDialog(generalProgressLabel: "Error", generalProgressConfirmLabel: "Error occured.", generalBtnVisibility: false)
                
            }else {
                
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message == "SUCCESS" {
                    
                    self.dismissParticleProgresssDialog()
                    
                    let billUrl = BaseEndPoint.LOCAL_BASE_URL + "/api/billpayengine/secured/thirdParty/payBill"
                    
                    let billParameters = Mapper().toJSON(AirtimePayPostModel(cardReference: "1234560000000001", payerMsisdn: SharedPreference.getEcocashEcocashPhone()!, payerName: "Soshaloza", billAccount: KeyboardSharedPreferences().getBillAccountNumber()!, billAmount: FormatMoney.changeFromStringToInt(amount: KeyboardSharedPreferences().getBillPaymentAmount()!), billProvider: KeyboardSharedPreferences().getBillerCode()!, channel: "MobileWorld", debitAccountnumber: "1007000000", debitCurrency: "USD", token: response!.responseBody!, provider: KeyboardSharedPreferences().getBillerCode()!, providerProduct: KeyboardSharedPreferences().getBillerCode()!, participantReference: KeyboardSharedPreferences().getBillAuthToken()!))
                    
                    self.billPaymentWithEcocash(url: billUrl, parameters: billParameters)
                    
                    
                }else {
                    
                    print(response!.message!)
                    print(response!.responseBody!)
                    
                    self.stopParticleProgressDialog(generalProgressLabel: response!.message!, generalProgressConfirmLabel: response!.responseBody!, generalBtnVisibility: false)
                    
                }
                
                
            }
            
        }
        
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENT WITH ECOCASH PAYMENT OPTION
    //----------------------------------------------------------------
    
    func billPaymentWithEcocash(url: String, parameters: [String: Any]){
        
        print("BILL PAYMENT WITH ECOCASH URL: \(url)")
        print("BILL PAYMENT WITH ECOCASH PARAMETERS: \(parameters)")
        
        self.makeProgressParticleProgressBar(containingView: numericKeyboardView)
        
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
                    KeyboardSharedPreferences().setBillPaymentEcocashStatus(billPaymentEcocashStatus: "0")
                    
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
    // MARK:- ECOCASH AIRTIME PAY
    //----------------------------------------------------------------
    
    func buyAirtime(url: String, parameters: [String: Any]){
        
        print("BUY AIRTIME URL: \(url)")
        print("BUY AIRTIME PARAMETERS: \(parameters)")
        
        self.makeProgressParticleProgressBar(containingView: numericKeyboardView)
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: AirtimePayModel?, error) in
            
            if error != nil {
                
                print("Error")
                
                self.dismissParticleProgresssDialog()
                
                self.makeAirtimeFinalDialog(transactionMessage: "Oops. That didn't go as planned. The problem is : FAILED.", icon: "oops")
                
            }else {
                
                print(response!.toJSONString(prettyPrint: true)!)
                
                
                if response!.message == "SUCCESS" {
                    KeyboardSharedPreferences().setAirtimeEcocashPaymentStatus(ecocashPaymentStatus: "0")
                   self.dismissParticleProgresssDialog()
                self.makeAirtimeFinalDialog(transactionMessage: "Yaay. Your airtime purchase was successful.", icon: "sosho_icon")
                    
    
                }else {
                    
                    self.dismissParticleProgresssDialog()
                    self.makeAirtimeFinalDialog(transactionMessage: "Oops. That didn't go as planned. The problem is : \(response!.airtimeResponseBody!)", icon: "oops")
                    
                }
            }
            
        }
        
        
        
    }

    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT TRANSFER FINAL DIALOG
    //----------------------------------------------------------------
    
    func makeZIPITTransferFinalDialog(transactionMessage: String, icon: String){
        
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
        
        
        
        balanceFinalDialogMsgBtn.addTarget(self, action: #selector(zipitFinalDialogMsgBtnPressed), for: .touchUpInside)
        
        balanceFinalDialogCloseBtn.addTarget(self, action: #selector(zipitFinalDialogCloseBtnPressed), for: .touchUpInside)
        
    }
    
    //----------------------------------------------------------------
    
    @objc func zipitFinalDialogMsgBtnPressed(){
        
        let proxy = textDocumentProxy
        proxy.insertText("I have just sent you an Internal Transfer of $\(Double(INTERNAL_TRANSFER_AMOUNT)!) to Your account: \(INTERNAL_TRANSFER_DESTINATION_ACNT)")
        
    }
    
    
    @objc func zipitFinalDialogCloseBtnPressed() {
        
        balanceFinalDialog.removeFromSuperview()
    }
    

    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BUY AIRTIME  FINAL DIALOG
    //----------------------------------------------------------------
    
    func makeAirtimeFinalDialog(transactionMessage: String, icon: String){
        
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
        
        
        
        balanceFinalDialogMsgBtn.addTarget(self, action: #selector(airtimeEcocashFinalDialogMsgBtnPressed), for: .touchUpInside)
        
        balanceFinalDialogCloseBtn.addTarget(self, action: #selector(airtimeEcocashFinalDialogCloseBtnPressed), for: .touchUpInside)
        
    }
    
    //----------------------------------------------------------------
    
    @objc func airtimeEcocashFinalDialogMsgBtnPressed(){
        
        let proxy = textDocumentProxy
        proxy.insertText("I have just bought you airtime worth $\(Double(KeyboardSharedPreferences().getAirtimeAmount()!)!)")
        
    }
    
    
    @objc func airtimeEcocashFinalDialogCloseBtnPressed() {
        
        balanceFinalDialog.removeFromSuperview()
    }
    
}

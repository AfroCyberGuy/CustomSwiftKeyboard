//
//  AirtimePaymentOptionView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 9/3/18.
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
    // MARK:- MAKE AIRTIME PAYMENT OPTIONS VIEW.
    //----------------------------------------------------------------
    
    func makeEcocashPaymentsOptionsView(){
        
        AirtimePaymentAirtimeOptionsView.backgroundColor = UIColor.lightGray
        AirtimePaymentAirtimeOptionsView.layer.cornerRadius = 0
        view.addSubview(AirtimePaymentAirtimeOptionsView)
        setupAirtimePaymentsOptionsConstraints()
        
        makeAirtimePaymentsOptionBackBtn()
        makeAirtimePaymentsOptionLabel()
        makeAirtimePaymentsOptionContainerView()
        makeAirtimePaymentOptionsRowOneStackView()
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME PAYMENTS OPTIONS LABEL
    //----------------------------------------------------------------
    
    
    func makeAirtimePaymentsOptionLabel(){
        
        AirtimePaymentAirtimeOptionsView.addSubview(AirtimePaymentsOptionLabel)
        AirtimePaymentsOptionLabel.textAlignment = .center
        
        
        AirtimePaymentsOptionLabel.centerYAnchor.constraint(equalTo: AirtimePaymentsOptionBackBtn.centerYAnchor).isActive = true
        AirtimePaymentsOptionLabel.leftAnchor.constraint(equalTo: AirtimePaymentsOptionBackBtn.leftAnchor, constant: 3).isActive = true
        AirtimePaymentsOptionLabel.rightAnchor.constraint(equalTo: AirtimePaymentAirtimeOptionsView.rightAnchor, constant: 3).isActive = true
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME PAYMENTS OPTIONS BACK BUTTON
    //----------------------------------------------------------------
    
    func makeAirtimePaymentsOptionBackBtn(){
        
        AirtimePaymentAirtimeOptionsView.addSubview(AirtimePaymentsOptionBackBtn)
        AirtimePaymentsOptionBackBtn.layer.cornerRadius = 15
        
        
        AirtimePaymentsOptionBackBtn.addTarget(self, action: #selector(airtimePaymentsOptionBackBtnPressed), for: .touchUpInside)
        
        AirtimePaymentsOptionBackBtn.topAnchor.constraint(equalTo: AirtimePaymentAirtimeOptionsView.topAnchor, constant: 20).isActive = true
        AirtimePaymentsOptionBackBtn.leftAnchor.constraint(equalTo: AirtimePaymentAirtimeOptionsView.leftAnchor, constant: 20).isActive = true
        AirtimePaymentsOptionBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        AirtimePaymentsOptionBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME PAYMENTS BACK BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func airtimePaymentsOptionBackBtnPressed(){
        
        
         KeyboardSharedPreferences().setSquareAirtimePaymentOption(squareAirtimePayment: "0")
        AirtimePaymentAirtimeOptionsView.removeFromSuperview()
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME PAYMENT OPTIONS CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeAirtimePaymentsOptionContainerView(){
        
        AirtimePaymentAirtimeOptionsView.addSubview(AirtimePaymentOptionContainerView)
        AirtimePaymentOptionContainerView.layer.cornerRadius = 3
        AirtimePaymentOptionContainerView.backgroundColor = UIColor.white
        AirtimePaymentOptionContainerView.layer.shadowColor = UIColor.black.cgColor
        AirtimePaymentOptionContainerView.layer.shadowOpacity = 0.4
        AirtimePaymentOptionContainerView.layer.shadowOffset =  CGSize(width: -1, height: 1)
        AirtimePaymentOptionContainerView.layer.shadowRadius = 1
        
        
        AirtimePaymentOptionContainerView.topAnchor.constraint(equalTo: AirtimePaymentsOptionLabel.bottomAnchor, constant: 20).isActive = true
        AirtimePaymentOptionContainerView.rightAnchor.constraint(equalTo: AirtimePaymentAirtimeOptionsView.rightAnchor, constant: -20).isActive = true
        AirtimePaymentOptionContainerView.leftAnchor.constraint(equalTo: AirtimePaymentAirtimeOptionsView.leftAnchor, constant: 20).isActive = true
        AirtimePaymentOptionContainerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME PAYMENT OPTIONS STACK VIEW
    //----------------------------------------------------------------
    
    func makeAirtimePaymentOptionsRowOneStackView() {
        
        //        airtimePaymentsOptionsStewardImgView.contentMode = .scaleAspectFit
        //        airtimePaymentOptionsairtimeImgView.contentMode = .scaleAspectFit
        
        AirtimePaymentOptionsEcocash.contentMode = .scaleAspectFit
        AirtimePaymentOptionsStewardBank.contentMode = .scaleAspectFit
        AirtimePaymentOptionsZimSwitch.contentMode = .scaleAspectFit
        
        
        
        let hstackView = Controls().theHorizontalImageViewStackView(imageViews: [AirtimePaymentOptionsEcocash, AirtimePaymentOptionsStewardBank, AirtimePaymentOptionsZimSwitch])
        hstackView.axis = .horizontal
        hstackView.distribution = .fillEqually
        hstackView.spacing = 5
        
        AirtimePaymentOptionContainerView.addSubview(hstackView)
        hstackView.topAnchor.constraint(equalTo: AirtimePaymentOptionContainerView.topAnchor, constant: 3).isActive = true
        hstackView.leftAnchor.constraint(equalTo: AirtimePaymentOptionContainerView.leftAnchor, constant: 3).isActive = true
        hstackView.rightAnchor.constraint(equalTo: AirtimePaymentOptionContainerView.rightAnchor, constant: -3).isActive = true
        hstackView.bottomAnchor.constraint(equalTo: AirtimePaymentOptionContainerView.bottomAnchor, constant: -3).isActive = true
        
        airtimePaymentEcocashClicked()
        airtimePaymentStewardClicked()
        airtimePaymentZimswitchClicked()
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME airtime CLICKED
    //----------------------------------------------------------------
    
    func airtimePaymentEcocashClicked(){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.airtimEcocashPaymentPressed(_:)))
        AirtimePaymentOptionsEcocash.isUserInteractionEnabled = true
        AirtimePaymentOptionsEcocash.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func airtimEcocashPaymentPressed(_ sender: AnyObject){
        
        print("Airtime pressed....")
        
        
        let url =  BaseEndPoint.LOCAL_BASE_URL + "/api/billpayengine/secured/thirdParty/billAuth"
        
       
        let parameters = Mapper().toJSON(AirtimeAuthPostModel(cardReference: "1234560000000001", payerMsisdn: SharedPreference.getEcocashEcocashPhone()!, payerName: "Soshaloza", billAccount: KeyboardSharedPreferences().getAirtimeRecipient()!, billAmount: FormatMoney.changeFromStringToDouble(amount: KeyboardSharedPreferences().getAirtimeAmount()! ) , billProvider: KeyboardSharedPreferences().getAirtimeNetworkProvider()!, channel: "MobileWorld", debitAccountnumber: "1000000000", debitCurrency: "USD", provider: KeyboardSharedPreferences().getAirtimeNetworkProvider()!, providerProduct:"AIRTIME"))
        

        airtimeAuth(url: url, parameters: parameters)
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME STEWARD BANK CLICKED
    //----------------------------------------------------------------
    
    func airtimePaymentStewardClicked(){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.airtimePaymentStewardPressed(_:)))
        AirtimePaymentOptionsStewardBank.isUserInteractionEnabled = true
        AirtimePaymentOptionsStewardBank.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func airtimePaymentStewardPressed(_ sender: AnyObject){
        
//          KeyboardSharedPreferences().setInternalTransferStatus(internalStatus: "1")
          KeyboardSharedPreferences().setSquareAirtimePaymentOption(squareAirtimePayment: "1")
        
        
        
        let url =  BaseEndPoint.LOCAL_BASE_URL + "/api/billpayengine/secured/thirdParty/billAuth"
        
        let parameters = Mapper().toJSON(AirtimeAuthPostModel(cardReference: "1234560000000001", payerMsisdn: KeyboardSharedPreferences().getEcocashEcocashPhone()!, payerName: "Soshaloza", billAccount: KeyboardSharedPreferences().getAirtimeRecipient()!, billAmount: FormatMoney.changeFromStringToDouble(amount: KeyboardSharedPreferences().getAirtimeAmount()! ) , billProvider: KeyboardSharedPreferences().getAirtimeNetworkProvider()!, channel: "MobileWorld", debitAccountnumber: "1000000000", debitCurrency: "USD", provider: KeyboardSharedPreferences().getAirtimeNetworkProvider()!, providerProduct:"AIRTIME"))
        

            airtimeAuth(url: url, parameters: parameters)
        
//        GLOBAL_SQUARE_PAYMENT_OPTION = "1"
//        makeZIPITPinView()
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT ZIMSWITCH BANK CLICKED
    //----------------------------------------------------------------
    
    func airtimePaymentZimswitchClicked(){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.airtimePaymentZimswitchPressed(_:)))
        AirtimePaymentOptionsZimSwitch.isUserInteractionEnabled = true
        AirtimePaymentOptionsZimSwitch.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func airtimePaymentZimswitchPressed(_ sender: AnyObject){
       
//        KeyboardSharedPreferences().setAirtimeEcocashPaymentStatus(ecocashPaymentStatus: "0")
//        KeyboardSharedPreferences().setEcocashPaymentStatus(ecocashpaymentstatus: "1")
        
        KeyboardSharedPreferences().setAirtimeZimswitchPurchase(airtimezimswitch: "1")
        
        makeZIPITPaymentsZimSwitchPanView()
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET UP ZIPIT PAYMENT OPTIONS
    //----------------------------------------------------------------
    
    func setupAirtimePaymentsOptionsConstraints(){
        
        AirtimePaymentAirtimeOptionsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        AirtimePaymentAirtimeOptionsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        AirtimePaymentAirtimeOptionsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        AirtimePaymentAirtimeOptionsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME ECOCASH PAY REQUEST METHOD
    //----------------------------------------------------------------
    
    
    func airtimeEcocashPay(url: String, parameters: [String: Any]){
        
        print("airtime PAY ZIPIT URL: \(url)")
        print("airtime PAY ZIPIT PARAMETERS: \(parameters)")
        
        makeProgressParticleProgressBar(containingView: AirtimePaymentAirtimeOptionsView)
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: EcocashPayModel?, error) in
            
            if error != nil {

                print("ERROR")
                self.stopParticleProgressDialog(generalProgressLabel: "Error", generalProgressConfirmLabel: "An error ocurred", generalBtnVisibility: false)
                
            }else {
                
                
                if response!.message == "SUCCESS" {
                    
                    print(response!.toJSONString(prettyPrint: true)!)
                    

//                    self.ASSOCIATEDCODE = response!.responseBody!.associatedCode!
//                    self.ECOCASHSTATUS = response!.responseBody!.ecocashStatus!
//                    self.ID = response!.responseBody!.id!
//                    self.STATUS = response!.responseBody!.status!
//                    self.AMOUNT = response!.responseBody!.amount!
//                    self.CORRELATER = response!.responseBody!.correlater!
//                    self.REFERENCE = response!.responseBody!.reference!
//                    self.ECOCASHREFERENCE = response!.responseBody!.ecocashReference!
//                    self.PHONE = response!.responseBody!.phone!
                    
                    
                    KeyboardSharedPreferences().setEcocashPaymentParams(
                        amount: response!.responseBody!.amount!,
                        associatedCode: "",
                        correlater: response!.responseBody!.correlater!,
                        reference: response!.responseBody!.reference!,
                        status: response!.responseBody!.status!,
                        ecocashReference: response!.responseBody!.ecocashReference!,
                        ecocashStatus: response!.responseBody!.ecocashStatus!,
                        phone: response!.responseBody!.phone!,
                        id: response!.responseBody!.id!)
                    
                    KeyboardSharedPreferences().setAirtimeEcocashPaymentStatus(ecocashPaymentStatus: "1")
                    
                    self.stopParticleProgressDialog(generalProgressLabel: response!.message!, generalProgressConfirmLabel: "SUCCESS", generalBtnVisibility: false)
                    self.dismissParticleProgresssDialog()
                    
                    self.makeNumericKeyboardView()
                    
                }else {
                    
                    print(response!.message!)
                    self.stopParticleProgressDialog(generalProgressLabel: "Error occured.", generalProgressConfirmLabel: "FAILED", generalBtnVisibility: false)
                    
                }
            }
            
        }
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME AUTH
    //----------------------------------------------------------------
    
    func airtimeAuth(url: String, parameters: [String: Any]){
        
         self.makeProgressParticleProgressBar(containingView: self.AirtimePaymentAirtimeOptionsView)
        
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
                    
                            let url = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/ecocashcontainer/secured/ecocash/pay"
                    
                            let parameters = Mapper().toJSON(EcocashPayPostModel(amount: "\(Double(KeyboardSharedPreferences().getAirtimeAmount()!)!)", channel: "SOSHO", biller: "ECONET", phone: SharedPreference.getEcocashEcocashPhone()!))
                    
                    KeyboardSharedPreferences().setAirtimeAuthToken(token: response!.airtimeResponseBody!)
                    
                    
                    if KeyboardSharedPreferences().getSquareAirtimePaymentOption() == "1" {
                        
                         self.makeAirtimePinView()
                        
                    }else {
                        
                         self.airtimeEcocashPay(url: url, parameters: parameters)
                        
                    }
                            
                    
                }else {
                    
                    self.stopParticleProgressDialog(generalProgressLabel: response!.message!, generalProgressConfirmLabel: response!.airtimeResponseBody!, generalBtnVisibility: false)
                
                }
                
            }
            
        }
        
    }
    
    //----------------------------------------------------------------
    
    
    
}

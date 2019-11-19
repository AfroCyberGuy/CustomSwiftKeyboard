//
//  airtimePinView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 9/11/18.
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
    // MARK:- MAKE AIRTIME PIN VIEW
    //----------------------------------------------------------------
    
    func makeAirtimePinView(){
        
        airtimePinView.backgroundColor = Theme.LighterGray
        airtimePinView.layer.cornerRadius = 0
        view.addSubview(airtimePinView)
        
        airtimePinView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        airtimePinView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        airtimePinView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        airtimePinView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        makeAirtimePinTopContainer()
        makeAirtimePinKeyboardContainer()
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME PIN VIEW TOP CONTAINER
    //----------------------------------------------------------------
    
    func makeAirtimePinTopContainer(){
        
        airtimePinViewTopContainer.backgroundColor = Theme.LighterGray
        airtimePinViewTopContainer.layer.cornerRadius = 0
        airtimePinView.addSubview(airtimePinViewTopContainer)
        
        airtimePinViewTopContainer.topAnchor.constraint(equalTo: airtimePinView.topAnchor).isActive = true
        airtimePinViewTopContainer.leftAnchor.constraint(equalTo: airtimePinView.leftAnchor).isActive = true
        airtimePinViewTopContainer.rightAnchor.constraint(equalTo: airtimePinView.rightAnchor).isActive = true
        airtimePinViewTopContainer.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        makeAirtimePinTopContainerLabel()
        makeAirTimePinViewBackButton()
        makeAirTimePinViewRightButton()
        makeAirtimePinStackView()
    }
    
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME PIN KEYBOARD CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeAirtimePinKeyboardContainer(){
        
        airtimePinViewKeyboardContainer.backgroundColor = Theme.LighterGray
        airtimePinViewKeyboardContainer.layer.cornerRadius = 0
        airtimePinView.addSubview(airtimePinViewKeyboardContainer)
        
        airtimePinViewKeyboardContainer.topAnchor.constraint(equalTo: airtimePinViewTopContainer.bottomAnchor, constant: 5).isActive = true
        airtimePinViewKeyboardContainer.leftAnchor.constraint(equalTo: airtimePinView.leftAnchor, constant: 5).isActive = true
        airtimePinViewKeyboardContainer.rightAnchor.constraint(equalTo: airtimePinView.rightAnchor, constant: -5).isActive = true
        airtimePinViewKeyboardContainer.bottomAnchor.constraint(equalTo: airtimePinView.bottomAnchor, constant: -5).isActive = true
        
        makeAirtimePinviewKeyBoardParentStackView()

    }
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeAirtimePinTopContainerLabel(){
        
        airtimePinViewTopContainer.addSubview(airtimePinLabel)
        airtimePinLabel.textAlignment = .center
        
        airtimePinLabel.topAnchor.constraint(equalTo: airtimePinViewTopContainer.topAnchor, constant: 3).isActive = true
        airtimePinLabel.leftAnchor.constraint(equalTo: airtimePinViewTopContainer.leftAnchor, constant: 3).isActive = true
        airtimePinLabel.rightAnchor.constraint(equalTo: airtimePinViewTopContainer.rightAnchor, constant: 3).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME PIN VIEW BACK BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeAirTimePinViewBackButton(){

        airtimePinViewBackBtn.layer.cornerRadius = 15
        airtimePinViewTopContainer.addSubview(airtimePinViewBackBtn)
        
        airtimePinViewBackBtn.addTarget(self, action: #selector(closeAirtimePinView), for: .touchUpInside)
        
        
        airtimePinViewBackBtn.topAnchor.constraint(equalTo: airtimePinLabel.bottomAnchor, constant: 2).isActive = true
        airtimePinViewBackBtn.leftAnchor.constraint(equalTo: airtimePinViewTopContainer.leftAnchor, constant: 8).isActive = true
        airtimePinViewBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        airtimePinViewBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CLOSE AIRTIME PIN VIEW
    //----------------------------------------------------------------
    
    @objc func closeAirtimePinView() {
        
        airtimePinView.removeFromSuperview()
    }

    //----------------------------------------------------------------
    
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME PIN VIEW RIGHT BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeAirTimePinViewRightButton(){
        
        airtimePinViewRightBtn.layer.cornerRadius = 15
        airtimePinViewTopContainer.addSubview(airtimePinViewRightBtn)
        airtimePinViewRightBtn.addTarget(self, action: #selector(airtimePinConfirmPin), for: .touchUpInside)
        
        
        airtimePinViewRightBtn.topAnchor.constraint(equalTo: airtimePinLabel.bottomAnchor, constant: 2).isActive = true
        airtimePinViewRightBtn.rightAnchor.constraint(equalTo: airtimePinViewTopContainer.rightAnchor, constant: -8).isActive = true
        airtimePinViewRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        airtimePinViewRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME PIN CONFIRM PIN BTN PRESSED
    //----------------------------------------------------------------
    
    @objc func airtimePinConfirmPin () {
        
//        airtimePinView.removeFromSuperview()
        
        if pinString == "" {
            
            showValidationView(message: "Please enter a valid pin number")
        }else if pinString.count < 4 {
            
             showValidationView(message: "Please enter a valid pin number. Your pin number should be 4 charecters long.")
            
        }else {
        
        
        let url = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/socialMedia/secured/sosho/squarePurchase"
        
//          let billPaymentSquarePurchaseParameters = Mapper().toJSON(SquarePurchaseModel(username: SharedPreference.getSquareMobileNumber()!, password: self.pinString, phone: SharedPreference.getSquareMobileNumber()!, amount: Double(self.BILLBILLAMOUNT)!, biller: KeyboardSharedPreferences().getBillerCode()!))
        
//        let parameters = Mapper().toJSON(InternalTransferPostModel(username: SharedPreference.getSquareMobileNumber()!, password: pinString, phone: SharedPreference.getSquareMobileNumber()!, amount: Double(KeyboardSharedPreferences().getAirtimeAmount()!)!, biller: KeyboardSharedPreferences().getAirtimeNetworkProvider()!))
        
        let params = Mapper().toJSON(SquarePurchaseModel(username: SharedPreference.getSquareMobileNumber()!, password: pinString, phone: SharedPreference.getSquareMobileNumber()!, amount: Double(KeyboardSharedPreferences().getAirtimeAmount()!)!, biller: KeyboardSharedPreferences().getAirtimeNetworkProvider()!))
        
        takeMoneyFromSquare(url: url, parameters: params)
            
        }
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE P1 LABEL
    //----------------------------------------------------------------
    
    func makeAirtimePinStackView(){
        
        airtimePinP1Label.backgroundColor = UIColor.white
        airtimePinP2Label.backgroundColor = UIColor.white
        airtimePinP3Label.backgroundColor = UIColor.white
        airtimePinP4Label.backgroundColor = UIColor.white
        
        airtimePinP1Label.textAlignment = .center
        airtimePinP2Label.textAlignment = .center
        airtimePinP3Label.textAlignment = .center
        airtimePinP4Label.textAlignment = .center
        
        airtimePinP1Label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        let hstackView = Controls().theHorizontalLabelStackView(labels: [airtimePinP1Label, airtimePinP2Label, airtimePinP3Label, airtimePinP4Label])
        hstackView.axis = .horizontal
        hstackView.distribution = .fillEqually
        hstackView.spacing = 2
        
        airtimePinViewTopContainer.addSubview(hstackView)
        
        hstackView.leftAnchor.constraint(equalTo: airtimePinViewBackBtn.rightAnchor, constant: 40).isActive = true
        hstackView.rightAnchor.constraint(equalTo: airtimePinViewRightBtn.leftAnchor, constant: -40).isActive = true
        hstackView.centerYAnchor.constraint(equalTo: airtimePinViewBackBtn.centerYAnchor).isActive = true
    
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME PIN VIEW KEYBOARD ROW ONE STACKVIEW
    //----------------------------------------------------------------
    
    func makeAirtimePinViewRowOneStackView() -> UIStackView {
        
        airtimePinViewOneButton.layer.cornerRadius = 3
        airtimePinViewOneButton.backgroundColor = UIColor.white
        airtimePinViewOneButton.setTitleColor(UIColor.black, for: .normal)
        airtimePinViewTwoButton.layer.cornerRadius = 3
        airtimePinViewTwoButton.backgroundColor = UIColor.white
        airtimePinViewTwoButton.setTitleColor(UIColor.black, for: .normal)
        airtimePinViewThreeButton.layer.cornerRadius = 3
        airtimePinViewThreeButton.backgroundColor = UIColor.white
        airtimePinViewThreeButton.setTitleColor(UIColor.black, for: .normal)
        
        airtimePinViewOneButton.addTarget(self, action: #selector(airtimePinBtn1Pressed), for: .touchUpInside)
        airtimePinViewTwoButton.addTarget(self, action: #selector(airtimePinBtn2Pressed), for: .touchUpInside)
        airtimePinViewThreeButton.addTarget(self, action: #selector(airtimePinBtn3Pressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [airtimePinViewOneButton, airtimePinViewTwoButton, airtimePinViewThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME PIN VIEW ROW ONE BUTTON ACTIONS
    //----------------------------------------------------------------
    
    @objc func airtimePinBtn1Pressed(){
        
        handlePin(txt1: airtimePinP1Label, txt2: airtimePinP2Label, txt3: airtimePinP3Label, txt4: airtimePinP4Label, button: airtimePinViewOneButton)
    }
    
    @objc func airtimePinBtn2Pressed(){
        
        handlePin(txt1: airtimePinP1Label, txt2: airtimePinP2Label, txt3: airtimePinP3Label, txt4: airtimePinP4Label, button: airtimePinViewTwoButton)
    }
    
    @objc func airtimePinBtn3Pressed(){
        
        handlePin(txt1: airtimePinP1Label, txt2: airtimePinP2Label, txt3: airtimePinP3Label, txt4: airtimePinP4Label, button: airtimePinViewThreeButton)
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME PIN VIEW KEYBOARD ROW TWO STACKVIEW
    //----------------------------------------------------------------
    
    func makeAirtimePinViewRowTwoStackView() -> UIStackView {
        
        airtimePinViewFourButton.layer.cornerRadius = 3
        airtimePinViewFourButton.backgroundColor = UIColor.white
        airtimePinViewFourButton.setTitleColor(UIColor.black, for: .normal)
        airtimePinViewFiveButton.layer.cornerRadius = 3
        airtimePinViewFiveButton.backgroundColor = UIColor.white
        airtimePinViewFiveButton.setTitleColor(UIColor.black, for: .normal)
        airtimePinViewSixButton.layer.cornerRadius = 3
        airtimePinViewSixButton.backgroundColor = UIColor.white
        airtimePinViewSixButton.setTitleColor(UIColor.black, for: .normal)
        
        airtimePinViewFourButton.addTarget(self, action: #selector(airtimePinBtn4Pressed), for: .touchUpInside)
        airtimePinViewFiveButton.addTarget(self, action: #selector(airtimePinBtn5Pressed), for: .touchUpInside)
        airtimePinViewSixButton.addTarget(self, action: #selector(airtimePinBtn6Pressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [airtimePinViewFourButton, airtimePinViewFiveButton, airtimePinViewSixButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME PIN VIEW ROW TWO BUTTON ACTIONS
    //----------------------------------------------------------------
    
    
    @objc func airtimePinBtn4Pressed() {
        
         handlePin(txt1: airtimePinP1Label, txt2: airtimePinP2Label, txt3: airtimePinP3Label, txt4: airtimePinP4Label, button: airtimePinViewFourButton)
        
    }
    
    @objc func airtimePinBtn5Pressed() {
        
        handlePin(txt1: airtimePinP1Label, txt2: airtimePinP2Label, txt3: airtimePinP3Label, txt4: airtimePinP4Label, button: airtimePinViewFiveButton)
        
    }
    
    @objc func airtimePinBtn6Pressed() {
        
        handlePin(txt1: airtimePinP1Label, txt2: airtimePinP2Label, txt3: airtimePinP3Label, txt4: airtimePinP4Label, button: airtimePinViewSixButton)
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME PIN VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makeAirtimePinViewRowThreeStackView() -> UIStackView {
        
        airtimePinViewSevenButton.layer.cornerRadius = 3
        airtimePinViewSevenButton.backgroundColor = UIColor.white
        airtimePinViewSevenButton.setTitleColor(UIColor.black, for: .normal)
        airtimePinViewEightButton.layer.cornerRadius = 3
        airtimePinViewEightButton.backgroundColor = UIColor.white
        airtimePinViewEightButton.setTitleColor(UIColor.black, for: .normal)
        airtimePinViewNineButton.layer.cornerRadius = 3
        airtimePinViewNineButton.backgroundColor = UIColor.white
        airtimePinViewNineButton.setTitleColor(UIColor.black, for: .normal)
        
        airtimePinViewSevenButton.addTarget(self, action: #selector(airtimePinBtn7Pressed), for: .touchUpInside)
        airtimePinViewEightButton.addTarget(self, action: #selector(airtimePinBtn8Pressed), for: .touchUpInside)
        airtimePinViewNineButton.addTarget(self, action: #selector(airtimePinBtn9Pressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [airtimePinViewSevenButton, airtimePinViewEightButton, airtimePinViewNineButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME PIN VIEW ROW THREE BUTTON ACTIONS
    //----------------------------------------------------------------
    
    
    @objc func airtimePinBtn7Pressed(){
        
        handlePin(txt1: airtimePinP1Label, txt2: airtimePinP2Label, txt3: airtimePinP3Label, txt4: airtimePinP4Label, button: airtimePinViewSevenButton)
    }
    
    @objc func airtimePinBtn8Pressed(){
        
        handlePin(txt1: airtimePinP1Label, txt2: airtimePinP2Label, txt3: airtimePinP3Label, txt4: airtimePinP4Label, button: airtimePinViewEightButton)
    }
    
    @objc func airtimePinBtn9Pressed(){
        
        handlePin(txt1: airtimePinP1Label, txt2: airtimePinP2Label, txt3: airtimePinP3Label, txt4: airtimePinP4Label, button: airtimePinViewNineButton)
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME PIN VIEW KEYBOARD ROW FOUR STACKVIEW
    //----------------------------------------------------------------
    
    func makeAirtimePinViewRowFourStackView() -> UIStackView {
        
        airtimePinViewZeroButton.layer.cornerRadius = 3
        airtimePinViewZeroButton.backgroundColor = UIColor.white
        airtimePinViewZeroButton.setTitleColor(UIColor.black, for: .normal)
        airtimePinViewDecimalButton.layer.cornerRadius = 3
        airtimePinViewDecimalButton.backgroundColor = UIColor.white
        airtimePinViewDecimalButton.setTitleColor(UIColor.black, for: .normal)
        airtimePinViewDeleteButton.layer.cornerRadius = 3
        airtimePinViewDeleteButton.backgroundColor = UIColor.white
        airtimePinViewDeleteButton.setTitleColor(UIColor.black, for: .normal)
        
        airtimePinViewZeroButton.addTarget(self, action: #selector(airtimePinBtnZeroPressed), for: .touchUpInside)
        airtimePinViewDeleteButton.addTarget(self, action: #selector(airtimePinBtnDeletePressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [airtimePinViewZeroButton, airtimePinViewDeleteButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
        
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME PIN VIEW ROW FOUR BUTTON ACTIONS
    //----------------------------------------------------------------
    
    @objc func airtimePinBtnZeroPressed(){
        
        handlePin(txt1: airtimePinP1Label, txt2: airtimePinP2Label, txt3: airtimePinP3Label, txt4: airtimePinP4Label, button: airtimePinViewZeroButton)
    }
    
    @objc func airtimePinBtnDeletePressed(){
        
        clearPin(txt1: airtimePinP1Label, txt2: airtimePinP2Label, txt3: airtimePinP3Label, txt4: airtimePinP4Label)
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE AIRTIME PIN VIEW KEYBOARD PARENT STACKVIEW
    //----------------------------------------------------------------
    
    func makeAirtimePinviewKeyBoardParentStackView(){
        
        let pStackView = Controls().theParentStackView(buttons: [makeAirtimePinViewRowOneStackView(), makeAirtimePinViewRowTwoStackView(), makeAirtimePinViewRowThreeStackView(), makeAirtimePinViewRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 1
        airtimePinViewKeyboardContainer.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: airtimePinViewKeyboardContainer.leftAnchor).isActive = true
        pStackView.rightAnchor.constraint(equalTo: airtimePinViewKeyboardContainer.rightAnchor).isActive = true
        pStackView.topAnchor.constraint(equalTo: airtimePinViewKeyboardContainer.topAnchor).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: airtimePinViewKeyboardContainer.bottomAnchor).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BUY AIRTIME USING SQUARE
    //----------------------------------------------------------------
    
    func takeMoneyFromSquare(url: String, parameters: [String: Any]){
        
        makeProgressParticleProgressBar(containingView: airtimePinView)
        
        print("SQUARE PURCHASE URL: \(url)")
        print("SQUARE PURCHASE PARAMETERS: \(parameters)")
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: InternalTransferModel?, error) in
            
            if error != nil {
                
                print("ERROR")
                
                self.stopParticleProgressDialog(generalProgressLabel: "ERROR", generalProgressConfirmLabel: "An error occurred", generalBtnVisibility: false)
                
            }else{
                
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message == "SUCCESS" {
                    
                    print(response!.responseBody!)
                    
                    self.dismissParticleProgresssDialog()
                    
                     let airtimeUrl = BaseEndPoint.LOCAL_BASE_URL + "/api/billpayengine/secured/thirdParty/payBill"
                    
                    
                    
//                    let airtimeParameters = Mapper().toJSON(AirtimePayPostModel(cardReference: "1234560000000001", payerMsisdn: SharedPreference.getEcocashEcocashPhone()!, payerName: "Soshaloza", billAccount: KeyboardSharedPreferences().getAirtimeRecipient()!, billAmount: FormatMoney.changeFromStringToInt(amount: KeyboardSharedPreferences().getAirtimeAmount()!), billProvider: KeyboardSharedPreferences().getAirtimeNetworkProvider()!, channel: "MobileWorld", debitAccountnumber: "1007000000", debitCurrency: "USD", token: response!.responseBody!, provider: KeyboardSharedPreferences().getAirtimeNetworkProvider()!, providerProduct: "AIRTIME", participantReference: KeyboardSharedPreferences().getAirtimeAuthToken()!))
                    
                    
                    let airtimeParameters = Mapper().toJSON(AirtimePayPostModel(cardReference: "1234560000000001", payerMsisdn: SharedPreference.getEcocashEcocashPhone()!, payerName: "Soshaloza", billAccount: KeyboardSharedPreferences().getAirtimeRecipient()!, billAmount: FormatMoney.changeFromStringToInt(amount: KeyboardSharedPreferences().getAirtimeAmount()!), billProvider: KeyboardSharedPreferences().getAirtimeNetworkProvider()!, channel: "MobileWorld", debitAccountnumber: "1007000000", debitCurrency: "USD", token: response!.responseBody!, provider: KeyboardSharedPreferences().getAirtimeNetworkProvider()!, providerProduct: "AIRTIME", participantReference: KeyboardSharedPreferences().getAirtimeAuthToken()!))
                    
                    self.buyAirtimeViaSquare(url: airtimeUrl, parameters: airtimeParameters)
                    
                }else{
                    
                     self.stopParticleProgressDialog(generalProgressLabel: response!.message!, generalProgressConfirmLabel: response!.responseBody!, generalBtnVisibility: false)
                }
                
            }
        }
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BUY AIRTIME WITH SQUARE
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ECOCASH AIRTIME PAY
    //----------------------------------------------------------------
    
    func buyAirtimeViaSquare(url: String, parameters: [String: Any]){
        
        print("BUY AIRTIME VIA SQUARE URL: \(url)")
        print("BUY AIRTIME VIA SQUARE PARAMETERS: \(parameters)")
        
        self.makeProgressParticleProgressBar(containingView: airtimePinView)
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: AirtimePayModel?, error) in
            
            if error != nil {
                
                print("Error")
                
                self.stopParticleProgressDialog(generalProgressLabel: "Error", generalProgressConfirmLabel: "An error occured", generalBtnVisibility: false)
                
            }else {
                
                print(response!.toJSONString(prettyPrint: true)!)
                
                
                if response!.message == "SUCCESS" {
                    KeyboardSharedPreferences().setAirtimeEcocashPaymentStatus(ecocashPaymentStatus: "0")
                     KeyboardSharedPreferences().setSquareAirtimePaymentOption(squareAirtimePayment: "1")
                    self.dismissParticleProgresssDialog()
                    
                self.makeAirtimeViaSquareFinalDialog(transactionMessage: "Yaay, your airtime purchase was successful.", icon: "sosho_icon")
                    
                }else {
                    
                    self.stopParticleProgressDialog(generalProgressLabel: response!.message!, generalProgressConfirmLabel: response!.airtimeResponseBody!, generalBtnVisibility: false)
                    
                }
            }
            
        }
        
        
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME PURCHASE  FINAL DIALOG
    //----------------------------------------------------------------
    
    func makeAirtimeViaSquareFinalDialog(transactionMessage: String, icon: String){
        
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
        
        
        
        balanceFinalDialogMsgBtn.addTarget(self, action: #selector(airtimeFinalDialogMsgBtnPressed), for: .touchUpInside)
        
        balanceFinalDialogCloseBtn.addTarget(self, action: #selector(airtimeFinalDialogCloseBtnPressed), for: .touchUpInside)
        
    }
    
    //----------------------------------------------------------------
    
    @objc func airtimeFinalDialogMsgBtnPressed(){
        
        let proxy = textDocumentProxy
        proxy.insertText("I have just bought you airtime worth $\(Double(KeyboardSharedPreferences().getAirtimeAmount()!)!)")
        
    }
    
    
    @objc func airtimeFinalDialogCloseBtnPressed() {
        
        balanceFinalDialog.removeFromSuperview()
    }
    
    
}

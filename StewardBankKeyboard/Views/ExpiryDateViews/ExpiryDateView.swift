//
//  ExpiryDateView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 12/11/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

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
    // MARK:- MAKE EXPIRY PIN VIEW
    //----------------------------------------------------------------
    
    func makeExpiryView(){
        
        expiryView.backgroundColor = Theme.LighterGray
        expiryView.layer.cornerRadius = 0
        view.addSubview(expiryView)
        
        expiryView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        expiryView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        expiryView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        expiryView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        makeExpiryTopContainer()
        makeExpiryKeyboardContainer()
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE EXPIRY  VIEW TOP CONTAINER
    //----------------------------------------------------------------
    
    func makeExpiryTopContainer(){
        
        expiryViewTopContainer.backgroundColor = Theme.LighterGray
        expiryViewTopContainer.layer.cornerRadius = 0
        expiryView.addSubview(expiryViewTopContainer)
        
        expiryViewTopContainer.topAnchor.constraint(equalTo: expiryView.topAnchor).isActive = true
        expiryViewTopContainer.leftAnchor.constraint(equalTo: expiryView.leftAnchor).isActive = true
        expiryViewTopContainer.rightAnchor.constraint(equalTo: expiryView.rightAnchor).isActive = true
        expiryViewTopContainer.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        makeExpiryViewTopContainerLabel()
        makeExpiryViewBackButton()
        makeExpiryViewRightButton()
        makeExpiryViewExpiryDateContainer()
        makeDateLabel()
        makeYearLabel()
    }
    
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- EXPIRY VIEW KEYBOARD CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeExpiryKeyboardContainer(){
        
        expiryViewKeyboardContainer.backgroundColor = Theme.LighterGray
        expiryViewKeyboardContainer.layer.cornerRadius = 0
        expiryView.addSubview(expiryViewKeyboardContainer)
        
        expiryViewKeyboardContainer.topAnchor.constraint(equalTo: expiryViewTopContainer.bottomAnchor, constant: 5).isActive = true
        expiryViewKeyboardContainer.leftAnchor.constraint(equalTo: expiryView.leftAnchor, constant: 5).isActive = true
        expiryViewKeyboardContainer.rightAnchor.constraint(equalTo: expiryView.rightAnchor, constant: -5).isActive = true
        expiryViewKeyboardContainer.bottomAnchor.constraint(equalTo: expiryView.bottomAnchor, constant: -5).isActive = true
        
       makeExpiryKeyboardParentStackView()
        
    }
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE EXPIRY VIEW TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeExpiryViewTopContainerLabel(){
        
        expiryViewTopContainer.addSubview(expiryLabel)
        expiryLabel.textAlignment = .center
        
        expiryLabel.topAnchor.constraint(equalTo: expiryViewTopContainer.topAnchor, constant: 3).isActive = true
        expiryLabel.leftAnchor.constraint(equalTo: expiryViewTopContainer.leftAnchor, constant: 3).isActive = true
        expiryLabel.rightAnchor.constraint(equalTo: expiryViewTopContainer.rightAnchor, constant: 3).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE EXPIRY VIEW BACK BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeExpiryViewBackButton(){
        
        expiryViewBackBtn.layer.cornerRadius = 15
        expiryViewTopContainer.addSubview(expiryViewBackBtn)
        
        expiryViewBackBtn.addTarget(self, action: #selector(closeExpiryPinView), for: .touchUpInside)
        
        
        expiryViewBackBtn.topAnchor.constraint(equalTo: expiryLabel.bottomAnchor, constant: 2).isActive = true
        expiryViewBackBtn.leftAnchor.constraint(equalTo: expiryViewTopContainer.leftAnchor, constant: 8).isActive = true
        expiryViewBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        expiryViewBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CLOSE EXPIRY  VIEW
    //----------------------------------------------------------------
    
    @objc func closeExpiryPinView() {
        
        expiryView.removeFromSuperview()
    }
    
    //----------------------------------------------------------------
    
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE EXPIRY VIEW RIGHT BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeExpiryViewRightButton(){
        
        expiryViewRightBtn.layer.cornerRadius = 15
        expiryViewTopContainer.addSubview(expiryViewRightBtn)
        expiryViewRightBtn.addTarget(self, action: #selector(expiryViewRightBtnPressed), for: .touchUpInside)
        
        
        expiryViewRightBtn.topAnchor.constraint(equalTo: expiryLabel.bottomAnchor, constant: 2).isActive = true
        expiryViewRightBtn.rightAnchor.constraint(equalTo: expiryViewTopContainer.rightAnchor, constant: -8).isActive = true
        expiryViewRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        expiryViewRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME PIN CONFIRM PIN BTN PRESSED
    //----------------------------------------------------------------
    
    @objc func expiryViewRightBtnPressed () {
      
        KeyboardSharedPreferences().setExpiryDate(expiryDate: expiryExpiryMonthLabel.text! + expiryExpiryYearLabel.text!)
        
        if KeyboardSharedPreferences().getBillPaymentZimswitchStatus()! == "1" {
            
            makebillPaymentsPinView()
            
            KeyboardSharedPreferences().setBillPaymentZimswitchStatus(billZimStatus: "0")
        
        }else{
            
            makeZIPITPinView()
        }
        
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE EXPIRY DATE LABEL
    //----------------------------------------------------------------
    
    func makeExpiryViewExpiryDateContainer(){
    
        expiryViewExpiryDateContainer.backgroundColor = UIColor.clear
        expiryViewTopContainer.addSubview(expiryViewExpiryDateContainer)
        
        expiryViewExpiryDateContainer.leftAnchor.constraint(equalTo: expiryViewBackBtn.rightAnchor, constant: 50).isActive = true
        expiryViewExpiryDateContainer.rightAnchor.constraint(equalTo: expiryViewRightBtn.leftAnchor, constant: -50).isActive = true
        expiryViewExpiryDateContainer.topAnchor.constraint(equalTo: expiryLabel.bottomAnchor, constant: 3).isActive = true
        expiryViewExpiryDateContainer.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        expiryViewExpiryDateContainer.centerYAnchor.constraint(equalTo: expiryViewBackBtn.centerYAnchor).isActive = true
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE DATE LABEL
    //----------------------------------------------------------------
    
    func makeDateLabel(){
        
        expiryViewExpiryDateContainer.addSubview(expiryExpiryMonthLabel)
        expiryExpiryMonthLabel.textAlignment = .center
        expiryExpiryMonthLabel.backgroundColor = UIColor.white
        expiryExpiryMonthLabel.layer.cornerRadius = 5
        
        expiryExpiryMonthLabel.topAnchor.constraint(equalTo: expiryViewExpiryDateContainer.topAnchor, constant: 3).isActive = true
        expiryExpiryMonthLabel.leftAnchor.constraint(equalTo: expiryViewExpiryDateContainer.leftAnchor, constant: 3).isActive = true
        expiryExpiryMonthLabel.bottomAnchor.constraint(equalTo: expiryViewExpiryDateContainer.bottomAnchor, constant: 3).isActive = true
        expiryExpiryMonthLabel.widthAnchor.constraint(equalTo: expiryViewExpiryDateContainer.widthAnchor, multiplier: 0.4).isActive = true
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE YEAR LABEL
    //----------------------------------------------------------------
    
    func makeYearLabel(){
        
        expiryViewExpiryDateContainer.addSubview(expiryExpiryYearLabel)
        expiryExpiryYearLabel.textAlignment = .center
        expiryExpiryYearLabel.backgroundColor = UIColor.white
        expiryExpiryYearLabel.layer.cornerRadius = 5
        
        expiryExpiryYearLabel.topAnchor.constraint(equalTo: expiryViewExpiryDateContainer.topAnchor, constant: 3).isActive = true
        expiryExpiryYearLabel.leftAnchor.constraint(equalTo: expiryExpiryMonthLabel.rightAnchor, constant: 3).isActive = true
        expiryExpiryYearLabel.bottomAnchor.constraint(equalTo: expiryViewExpiryDateContainer.bottomAnchor, constant: 3).isActive = true
        expiryExpiryYearLabel.widthAnchor.constraint(equalTo: expiryViewExpiryDateContainer.widthAnchor, multiplier: 0.6).isActive = true
        
        
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
//    //----------------------------------------------------------------
//    // MARK:-
//    // MARK:- MAKE EXPIRY VIEW KEYBOARD ROW ONE STACKVIEW
//    //----------------------------------------------------------------

    func makeExpiryViewRowOneStackView() -> UIStackView {

        expiryViewOneButton.layer.cornerRadius = 3
        expiryViewOneButton.backgroundColor = UIColor.white
        expiryViewOneButton.setTitleColor(UIColor.black, for: .normal)
        expiryViewTwoButton.layer.cornerRadius = 3
        expiryViewTwoButton.backgroundColor = UIColor.white
        expiryViewTwoButton.setTitleColor(UIColor.black, for: .normal)
        expiryViewThreeButton.layer.cornerRadius = 3
        expiryViewThreeButton.backgroundColor = UIColor.white
        expiryViewThreeButton.setTitleColor(UIColor.black, for: .normal)

        expiryViewOneButton.addTarget(self, action: #selector(expiryOneButtonPressed), for: .touchUpInside)
        expiryViewTwoButton.addTarget(self, action: #selector(expiryTwoButtonPressed), for: .touchUpInside)
        expiryViewThreeButton.addTarget(self, action: #selector(expiryThreeButtonPressed), for: .touchUpInside)


        let hStackView = Controls().theHorizontalStackView(buttons: [expiryViewOneButton, expiryViewTwoButton, expiryViewThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6

        return hStackView

    }


    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- EXPIRY VIEW ROW ONE BUTTON ACTIONS
    //----------------------------------------------------------------
    
    @objc func expiryOneButtonPressed(){
        
        handleExpiryDate(monthLabel: expiryExpiryMonthLabel, yearLabel: expiryExpiryYearLabel, button: expiryViewOneButton)
    }
    
    @objc func expiryTwoButtonPressed(){
        
         handleExpiryDate(monthLabel: expiryExpiryMonthLabel, yearLabel: expiryExpiryYearLabel, button: expiryViewTwoButton)
    }
    
    @objc func expiryThreeButtonPressed(){
        
         handleExpiryDate(monthLabel: expiryExpiryMonthLabel, yearLabel: expiryExpiryYearLabel, button: expiryViewThreeButton)
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE EXPIRY VIEW KEYBOARD ROW TWO STACKVIEW
    //----------------------------------------------------------------
    
    func makeExpiryViewRowTwoStackView() -> UIStackView {
        
        expiryViewFourButton.layer.cornerRadius = 3
        expiryViewFourButton.backgroundColor = UIColor.white
        expiryViewFourButton.setTitleColor(UIColor.black, for: .normal)
        expiryViewFiveButton.layer.cornerRadius = 3
        expiryViewFiveButton.backgroundColor = UIColor.white
        expiryViewFiveButton.setTitleColor(UIColor.black, for: .normal)
        expiryViewSixButton.layer.cornerRadius = 3
        expiryViewSixButton.backgroundColor = UIColor.white
        expiryViewSixButton.setTitleColor(UIColor.black, for: .normal)
        
        expiryViewFourButton.addTarget(self, action: #selector(expiryViewFourButtonPressed), for: .touchUpInside)
        expiryViewFiveButton.addTarget(self, action: #selector(expiryViewFiveButtonPressed), for: .touchUpInside)
        expiryViewSixButton.addTarget(self, action: #selector(expiryViewSixButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [expiryViewFourButton, expiryViewFiveButton, expiryViewSixButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- EXPIRY  VIEW ROW TWO BUTTON ACTIONS
    //----------------------------------------------------------------
    
    
    @objc func expiryViewFourButtonPressed() {
        
        handleExpiryDate(monthLabel: expiryExpiryMonthLabel, yearLabel: expiryExpiryYearLabel, button: expiryViewFourButton)
        
    }
    
    @objc func expiryViewFiveButtonPressed() {
        
         handleExpiryDate(monthLabel: expiryExpiryMonthLabel, yearLabel: expiryExpiryYearLabel, button: expiryViewFiveButton)
        
    }
    
    @objc func expiryViewSixButtonPressed() {
        
         handleExpiryDate(monthLabel: expiryExpiryMonthLabel, yearLabel: expiryExpiryYearLabel, button: expiryViewSixButton)
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE EXPIRY  VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makeExpiryViewRowThreeStackView() -> UIStackView {
        
        expiryViewSevenButton.layer.cornerRadius = 3
        expiryViewSevenButton.backgroundColor = UIColor.white
        expiryViewSevenButton.setTitleColor(UIColor.black, for: .normal)
        expiryViewEightButton.layer.cornerRadius = 3
        expiryViewEightButton.backgroundColor = UIColor.white
        expiryViewEightButton.setTitleColor(UIColor.black, for: .normal)
        expiryViewNineButton.layer.cornerRadius = 3
        expiryViewNineButton.backgroundColor = UIColor.white
        expiryViewNineButton.setTitleColor(UIColor.black, for: .normal)
        
        expiryViewSevenButton.addTarget(self, action: #selector(expiryViewSevenButtonPressed), for: .touchUpInside)
        expiryViewEightButton.addTarget(self, action: #selector(expiryViewEightButtonPressed), for: .touchUpInside)
        expiryViewNineButton.addTarget(self, action: #selector(expiryViewNineButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [expiryViewSevenButton, expiryViewEightButton, expiryViewNineButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- EXPIRY VIEW ROW THREE BUTTON ACTIONS
    //----------------------------------------------------------------
    
    
    @objc func expiryViewSevenButtonPressed(){
        
         handleExpiryDate(monthLabel: expiryExpiryMonthLabel, yearLabel: expiryExpiryYearLabel, button: expiryViewSevenButton)
    }
    
    @objc func expiryViewEightButtonPressed(){
        
         handleExpiryDate(monthLabel: expiryExpiryMonthLabel, yearLabel: expiryExpiryYearLabel, button: expiryViewEightButton)
    }
    
    @objc func expiryViewNineButtonPressed(){
        
         handleExpiryDate(monthLabel: expiryExpiryMonthLabel, yearLabel: expiryExpiryYearLabel, button: expiryViewNineButton)
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE EXPIRY VIEW KEYBOARD ROW FOUR STACKVIEW
    //----------------------------------------------------------------
    
    func makeExpiryViewRowFourStackView() -> UIStackView {
        
        expiryViewZeroButton.layer.cornerRadius = 3
        expiryViewZeroButton.backgroundColor = UIColor.white
        expiryViewZeroButton.setTitleColor(UIColor.black, for: .normal)
        expiryViewDecimalButton.layer.cornerRadius = 3
        expiryViewDecimalButton.backgroundColor = UIColor.white
        expiryViewDecimalButton.setTitleColor(UIColor.black, for: .normal)
        expiryViewDeleteButton.layer.cornerRadius = 3
        expiryViewDeleteButton.backgroundColor = UIColor.white
        expiryViewDeleteButton.setTitleColor(UIColor.black, for: .normal)
        
        expiryViewZeroButton.addTarget(self, action: #selector(expiryViewZeroButtonPressed), for: .touchUpInside)
        expiryViewDeleteButton.addTarget(self, action: #selector(expiryViewDeleteButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [expiryViewZeroButton, expiryViewDeleteButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- EXPIRY VIEW ROW FOUR BUTTON ACTIONS
    //----------------------------------------------------------------
    
    @objc func expiryViewZeroButtonPressed(){
        
         handleExpiryDate(monthLabel: expiryExpiryMonthLabel, yearLabel: expiryExpiryYearLabel, button: expiryViewZeroButton)
    }
    
    @objc func expiryViewDeleteButtonPressed(){
        
        clearExpiryDetails(monthLabel: expiryExpiryMonthLabel, yearLabel: expiryExpiryYearLabel)
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE EXPIRY VIEW KEYBOARD PARENT STACKVIEW
    //----------------------------------------------------------------
    
    func makeExpiryKeyboardParentStackView(){
        
        let pStackView = Controls().theParentStackView(buttons: [makeExpiryViewRowOneStackView(), makeExpiryViewRowTwoStackView(), makeExpiryViewRowThreeStackView(), makeExpiryViewRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 6
        expiryViewKeyboardContainer.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: expiryViewKeyboardContainer.leftAnchor).isActive = true
        pStackView.rightAnchor.constraint(equalTo: expiryViewKeyboardContainer.rightAnchor).isActive = true
        pStackView.topAnchor.constraint(equalTo: expiryViewKeyboardContainer.topAnchor).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: expiryViewKeyboardContainer.bottomAnchor).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BUY AIRTIME USING SQUARE
    //----------------------------------------------------------------
    
//    func takeMoneyFromSquare(url: String, parameters: [String: Any]){
//
//        makeProgressParticleProgressBar(containingView: airtimePinView)
//
//        print("SQUARE PURCHASE URL: \(url)")
//        print("SQUARE PURCHASE PARAMETERS: \(parameters)")
//
//        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: InternalTransferModel?, error) in
//
//            if error != nil {
//
//                print("ERROR")
//
//                self.stopParticleProgressDialog(generalProgressLabel: "ERROR", generalProgressConfirmLabel: "An error occurred", generalBtnVisibility: false)
//
//            }else{
//
//                print(response!.toJSONString(prettyPrint: true)!)
//
//                if response!.message == "SUCCESS" {
//
//                    print(response!.responseBody!)
//
//                    self.dismissParticleProgresssDialog()
//
//                    let airtimeUrl = BaseEndPoint.LOCAL_BASE_URL + "/api/billpayengine/secured/thirdParty/payBill"
//
//
//
//                    //                    let airtimeParameters = Mapper().toJSON(AirtimePayPostModel(cardReference: "1234560000000001", payerMsisdn: SharedPreference.getEcocashEcocashPhone()!, payerName: "Soshaloza", billAccount: KeyboardSharedPreferences().getAirtimeRecipient()!, billAmount: FormatMoney.changeFromStringToInt(amount: KeyboardSharedPreferences().getAirtimeAmount()!), billProvider: KeyboardSharedPreferences().getAirtimeNetworkProvider()!, channel: "MobileWorld", debitAccountnumber: "1007000000", debitCurrency: "USD", token: response!.responseBody!, provider: KeyboardSharedPreferences().getAirtimeNetworkProvider()!, providerProduct: "AIRTIME", participantReference: KeyboardSharedPreferences().getAirtimeAuthToken()!))
//
//
//                    let airtimeParameters = Mapper().toJSON(AirtimePayPostModel(cardReference: "1234560000000001", payerMsisdn: SharedPreference.getEcocashEcocashPhone()!, payerName: "Soshaloza", billAccount: KeyboardSharedPreferences().getAirtimeRecipient()!, billAmount: FormatMoney.changeFromStringToInt(amount: KeyboardSharedPreferences().getAirtimeAmount()!), billProvider: KeyboardSharedPreferences().getAirtimeNetworkProvider()!, channel: "MobileWorld", debitAccountnumber: "1007000000", debitCurrency: "USD", token: response!.responseBody!, provider: KeyboardSharedPreferences().getAirtimeNetworkProvider()!, providerProduct: "AIRTIME", participantReference: KeyboardSharedPreferences().getAirtimeAuthToken()!))
//
//                    self.buyAirtimeViaSquare(url: airtimeUrl, parameters: airtimeParameters)
//
//                }else{
//
//                    self.stopParticleProgressDialog(generalProgressLabel: response!.message!, generalProgressConfirmLabel: response!.responseBody!, generalBtnVisibility: false)
//                }
//
//            }
//        }
//
//
//    }
//
//
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BUY AIRTIME WITH SQUARE
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ECOCASH AIRTIME PAY
    //----------------------------------------------------------------
    
//    func buyAirtimeViaSquare(url: String, parameters: [String: Any]){
//
//        print("BUY AIRTIME VIA SQUARE URL: \(url)")
//        print("BUY AIRTIME VIA SQUARE PARAMETERS: \(parameters)")
//
//        self.makeProgressParticleProgressBar(containingView: airtimePinView)
//
//        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: AirtimePayModel?, error) in
//
//            if error != nil {
//
//                print("Error")
//
//                self.stopParticleProgressDialog(generalProgressLabel: "Error", generalProgressConfirmLabel: "An error occured", generalBtnVisibility: false)
//
//            }else {
//
//                print(response!.toJSONString(prettyPrint: true)!)
//
//
//                if response!.message == "SUCCESS" {
//                    KeyboardSharedPreferences().setAirtimeEcocashPaymentStatus(ecocashPaymentStatus: "0")
//                    KeyboardSharedPreferences().setSquareAirtimePaymentOption(squareAirtimePayment: "1")
//                    self.dismissParticleProgresssDialog()
//
//                    self.makeAirtimeViaSquareFinalDialog(transactionMessage: "Yaay, your airtime purchase was successful.", icon: "sosho_icon")
//
//                }else {
//
//                    self.stopParticleProgressDialog(generalProgressLabel: response!.message!, generalProgressConfirmLabel: response!.airtimeResponseBody!, generalBtnVisibility: false)
//
//                }
//            }
//
//        }
//
//
//
//    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME PURCHASE  FINAL DIALOG
    //----------------------------------------------------------------
    
//    func makeAirtimeViaSquareFinalDialog(transactionMessage: String, icon: String){
//
//        view.addSubview(balanceFinalDialog)
//        balanceFinalDialog.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
//        balanceFinalDialog.layer.cornerRadius = 0
//
//        balanceFinalDialog.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
//        balanceFinalDialog.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
//        balanceFinalDialog.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
//        balanceFinalDialog.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//
//        balanceFinalDialog.addSubview(balanceFinalDialogIcon)
//        balanceFinalDialogIcon.image = UIImage(named: icon)
//        balanceFinalDialogIcon.contentMode = .scaleAspectFit
//
//        balanceFinalDialogIcon.topAnchor.constraint(equalTo: balanceFinalDialog.topAnchor, constant: 20).isActive = true
//        balanceFinalDialogIcon.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        balanceFinalDialogIcon.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        balanceFinalDialogIcon.centerXAnchor.constraint(equalTo: balanceFinalDialog.centerXAnchor).isActive = true
//
//        balanceFinalDialog.addSubview(balanceFinalDialogLabel)
//        balanceFinalDialogLabel.text = transactionMessage
//        balanceFinalDialogLabel.textAlignment = .center
//
//
//        balanceFinalDialogLabel.text = transactionMessage
//        balanceFinalDialogLabel.numberOfLines = 0
//
//        balanceFinalDialogLabel.topAnchor.constraint(equalTo: balanceFinalDialogIcon.bottomAnchor, constant: 16).isActive = true
//        balanceFinalDialogLabel.leftAnchor.constraint(equalTo: balanceFinalDialog.leftAnchor, constant: 30).isActive = true
//        balanceFinalDialogLabel.rightAnchor.constraint(equalTo: balanceFinalDialog.rightAnchor, constant: -30).isActive = true
//
//        balanceFinalDialogMsgBtn.heightAnchor.constraint(equalToConstant: 40).isActive  = true
//
//        balanceFinalDialogMsgBtn.layer.cornerRadius = 5
//        balanceFinalDialogMsgBtn.backgroundColor =  #colorLiteral(red: 0.3921568627, green: 0.09411764706, blue: 0.4862745098, alpha: 1)
//        balanceFinalDialogCloseBtn.layer.cornerRadius = 5
//        balanceFinalDialogCloseBtn.backgroundColor = #colorLiteral(red: 0.6274509804, green: 0.007843137255, blue: 0.007843137255, alpha: 1)
//
//        let hStackView = Controls().theHorizontalStackView(buttons: [balanceFinalDialogMsgBtn, balanceFinalDialogCloseBtn])
//        hStackView.axis = .horizontal
//        hStackView.distribution = .fillEqually
//        hStackView.spacing = 20
//
//        balanceFinalDialog.addSubview(hStackView)
//
//        hStackView.topAnchor.constraint(equalTo: balanceFinalDialogLabel.bottomAnchor, constant: 10).isActive = true
//        hStackView.leftAnchor.constraint(equalTo: balanceFinalDialog.leftAnchor, constant: 30).isActive = true
//        hStackView.rightAnchor.constraint(equalTo: balanceFinalDialog.rightAnchor, constant: -30).isActive = true
//
//
//
//        balanceFinalDialogMsgBtn.addTarget(self, action: #selector(airtimeFinalDialogMsgBtnPressed), for: .touchUpInside)
//
//        balanceFinalDialogCloseBtn.addTarget(self, action: #selector(airtimeFinalDialogCloseBtnPressed), for: .touchUpInside)
//
//    }
    
    //----------------------------------------------------------------
    
//    @objc func airtimeFinalDialogMsgBtnPressed(){
//
//        let proxy = textDocumentProxy
//        proxy.insertText("I have just bought you airtime worth $\(Double(KeyboardSharedPreferences().getAirtimeAmount()!)!)")
//
//    }
//
//
//    @objc func airtimeFinalDialogCloseBtnPressed() {
//
//        balanceFinalDialog.removeFromSuperview()
//    }
//
    
}


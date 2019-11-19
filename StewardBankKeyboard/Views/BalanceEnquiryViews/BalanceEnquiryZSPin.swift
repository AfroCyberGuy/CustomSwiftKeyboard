//
//  BalanceEnquiryZSPin.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/16/18.
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
    // MARK:- BALANCE ENQUIRY ZS PIN
    //----------------------------------------------------------------
    
    func makebalanceEquiryZSPinView(){
        
        balanceEnquiryZSPinView.backgroundColor = Theme.LighterGray
        balanceEnquiryZSPinView.layer.cornerRadius = 0
        view.addSubview(balanceEnquiryZSPinView)
        
        balanceEnquiryZSPinView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        balanceEnquiryZSPinView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        balanceEnquiryZSPinView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        balanceEnquiryZSPinView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        makeBalanceEnquiryZSPinTopContainer()
        makeBalanceEnquiryZBPinKeyboardContainer()
        
        
    }
    
    //----------------------------------------------------------------
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZS PIN VIEW TOP CONTAINER
    //----------------------------------------------------------------
    
    func makeBalanceEnquiryZSPinTopContainer(){
        
        balanceEnquiryZSPinTopContainer.backgroundColor = Theme.LighterGray
        balanceEnquiryZSPinTopContainer.layer.cornerRadius = 0
        balanceEnquiryZSPinView.addSubview(balanceEnquiryZSPinTopContainer)
        
        balanceEnquiryZSPinTopContainer.topAnchor.constraint(equalTo: balanceEnquiryZSPinView.topAnchor).isActive = true
        balanceEnquiryZSPinTopContainer.leftAnchor.constraint(equalTo: balanceEnquiryZSPinView.leftAnchor).isActive = true
        balanceEnquiryZSPinTopContainer.rightAnchor.constraint(equalTo: balanceEnquiryZSPinView.rightAnchor).isActive = true
        balanceEnquiryZSPinTopContainer.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        makeBalanceEnquiryZSPinTopContainerLabel()
        makeBalanceEnquiryZSPinViewBackButton()
        makeBalanceEnquiryZSPinViewRightButton()
        makeBalanceEnquiryZSPinStackView()
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZS PIN TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeBalanceEnquiryZSPinTopContainerLabel(){
        
        balanceEnquiryZSPinTopContainer.addSubview(balanceEnquiryZSPinLabel                                                           )
        balanceEnquiryZSPinLabel.textAlignment = .center
        
        balanceEnquiryZSPinLabel.topAnchor.constraint(equalTo: balanceEnquiryZSPinTopContainer.topAnchor, constant: 3).isActive = true
        balanceEnquiryZSPinLabel.leftAnchor.constraint(equalTo: balanceEnquiryZSPinTopContainer.leftAnchor, constant: 3).isActive = true
        balanceEnquiryZSPinLabel.rightAnchor.constraint(equalTo: balanceEnquiryZSPinTopContainer.rightAnchor, constant: 3).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZS PIN VIEW BACK BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeBalanceEnquiryZSPinViewBackButton(){
        
        balanceEnquiryZSPinBackBtn.layer.cornerRadius = 15
        balanceEnquiryZSPinTopContainer.addSubview(balanceEnquiryZSPinBackBtn)
        
        balanceEnquiryZSPinBackBtn.addTarget(self, action: #selector(closeBalanceEnquiryZSPinView), for: .touchUpInside)
        
        
        balanceEnquiryZSPinBackBtn.topAnchor.constraint(equalTo: balanceEnquiryZSPinLabel.bottomAnchor, constant: 2).isActive = true
        balanceEnquiryZSPinBackBtn.leftAnchor.constraint(equalTo: balanceEnquiryZSPinTopContainer.leftAnchor, constant: 8).isActive = true
        balanceEnquiryZSPinBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        balanceEnquiryZSPinBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CLOSE BALANCE ENQUIRY ZS OPTION VIEW
    //----------------------------------------------------------------
    
    @objc func closeBalanceEnquiryZSPinView() {
        
        balanceEnquiryZSPinView.removeFromSuperview()
    }
    
    //----------------------------------------------------------------
    
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZS OPTION RIGHT BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeBalanceEnquiryZSPinViewRightButton(){
        
        balanceEnquiryZSPinRightBtn.layer.cornerRadius = 15
        balanceEnquiryZSPinTopContainer.addSubview(balanceEnquiryZSPinRightBtn)
        balanceEnquiryZSPinRightBtn.addTarget(self, action: #selector(balanceEnquiryZSOptionPinConfirmPin), for: .touchUpInside)
        
        
        balanceEnquiryZSPinRightBtn.topAnchor.constraint(equalTo: balanceEnquiryZSPinLabel.bottomAnchor, constant: 2).isActive = true
        balanceEnquiryZSPinRightBtn.rightAnchor.constraint(equalTo: balanceEnquiryZSPinTopContainer.rightAnchor, constant: -8).isActive = true
        balanceEnquiryZSPinRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        balanceEnquiryZSPinRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BALANCE ENQUIRY ZS OPTION PIN BTN PRESSED
    //----------------------------------------------------------------
    
    @objc func balanceEnquiryZSOptionPinConfirmPin() {
        
        print("ZIMSWITCH_BALANCE_PIN: \(pinString)")
        
        
        let panValue = ZIMSWITCH_BALANCE_CARD_NUMBER.aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let pinBlockValue = pinString.aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let imeiValue = SharedPreference.getIMEI()!.aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let channelValue = Channel.transactionChannel().aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        let customerMsisdnValue = SharedPreference.getPhoneNumber()!.aesEncrypt(AES_KEY: "m3hGBAYW4xftnxES", INIT_VECTOR: "RandomInitVector")
        

        let parameters = Mapper().toJSON(ZimswitchBalancePostModel(pan: panValue, pinBlock: pinBlockValue, imei: imeiValue, channel: channelValue, customerMsisdn: customerMsisdnValue))
        
        let url = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/socialMedia/secured/sosho/purchaseZim"
        
        
        checkZimswitchBalance(url: url, parameters: parameters)
        
        
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZS OPTION P1 LABEL
    //----------------------------------------------------------------
    
    func makeBalanceEnquiryZSPinStackView(){
        
        balanceEnquiryZSPinP1Label.backgroundColor = UIColor.white
        balanceEnquiryZSPinP2Label.backgroundColor = UIColor.white
        balanceEnquiryZSPinP3Label.backgroundColor = UIColor.white
        balanceEnquiryZSPinP4Label.backgroundColor = UIColor.white
        
        balanceEnquiryZSPinP1Label.textAlignment = .center
        balanceEnquiryZSPinP2Label.textAlignment = .center
        balanceEnquiryZSPinP3Label.textAlignment = .center
        balanceEnquiryZSPinP4Label.textAlignment = .center
        
        balanceEnquiryZSPinP1Label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        let hstackView = Controls().theHorizontalLabelStackView(labels: [balanceEnquiryZSPinP1Label, balanceEnquiryZSPinP2Label, balanceEnquiryZSPinP3Label, balanceEnquiryZSPinP4Label])
        hstackView.axis = .horizontal
        hstackView.distribution = .fillEqually
        hstackView.spacing = 2
        
        balanceEnquiryZSPinTopContainer.addSubview(hstackView)
        
        hstackView.leftAnchor.constraint(equalTo: balanceEnquiryZSPinBackBtn.rightAnchor, constant: 40).isActive = true
        hstackView.rightAnchor.constraint(equalTo: balanceEnquiryZSPinRightBtn.leftAnchor, constant: -40).isActive = true
        hstackView.centerYAnchor.constraint(equalTo: balanceEnquiryZSPinBackBtn.centerYAnchor).isActive = true
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZS OPTION VIEW KEYBOARD ROW ONE STACKVIEW
    //----------------------------------------------------------------
    
    func makeBalanceEnquiryZSPinViewRowOneStackView() -> UIStackView {
        
        balanceEnquiryZSPinOneButton.layer.cornerRadius = 3
        balanceEnquiryZSPinOneButton.backgroundColor = UIColor.white
        balanceEnquiryZSPinOneButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquiryZSPinTwoButton.layer.cornerRadius = 3
        balanceEnquiryZSPinTwoButton.backgroundColor = UIColor.white
        balanceEnquiryZSPinTwoButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquiryZSPinThreeButton.layer.cornerRadius = 3
        balanceEnquiryZSPinThreeButton.backgroundColor = UIColor.white
        balanceEnquiryZSPinThreeButton.setTitleColor(UIColor.black, for: .normal)
        
        balanceEnquiryZSPinOneButton.addTarget(self, action: #selector(balanceEnquiryZSPinOneButtonPressed), for: .touchUpInside)
        balanceEnquiryZSPinTwoButton.addTarget(self, action: #selector(balanceEnquiryZSPinTwoButtonPressed), for: .touchUpInside)
        balanceEnquiryZSPinThreeButton.addTarget(self, action: #selector(balanceEnquiryZSPinThreeButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [balanceEnquiryZSPinOneButton, balanceEnquiryZSPinTwoButton, balanceEnquiryZSPinThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL BALANCE ENQUIRY ZS OPTION VIEW ROW ONE BUTTON ACTIONS
    //----------------------------------------------------------------
    
    @objc func balanceEnquiryZSPinOneButtonPressed(){
        
        print("One Pressed......  ")
        
        handlePin(txt1: balanceEnquiryZSPinP1Label, txt2: balanceEnquiryZSPinP2Label, txt3: balanceEnquiryZSPinP3Label, txt4: balanceEnquiryZSPinP4Label, button: balanceEnquiryZSPinOneButton)
    }
    
    @objc func balanceEnquiryZSPinTwoButtonPressed(){
        
         handlePin(txt1: balanceEnquiryZSPinP1Label, txt2: balanceEnquiryZSPinP2Label, txt3: balanceEnquiryZSPinP3Label, txt4: balanceEnquiryZSPinP4Label, button: balanceEnquiryZSPinTwoButton)
    }
    
    @objc func balanceEnquiryZSPinThreeButtonPressed(){
        
        handlePin(txt1: balanceEnquiryZSPinP1Label, txt2: balanceEnquiryZSPinP2Label, txt3: balanceEnquiryZSPinP3Label, txt4: balanceEnquiryZSPinP4Label, button: balanceEnquiryZSPinThreeButton)
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZS OPTION VIEW KEYBOARD ROW TWO STACKVIEW
    //----------------------------------------------------------------
    
    func makeBalanceEnquiryZSPinViewRowTwoStackView() -> UIStackView {
        
        balanceEnquiryZSPinFourButton.layer.cornerRadius = 3
        balanceEnquiryZSPinFourButton.backgroundColor = UIColor.white
        balanceEnquiryZSPinFourButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquiryZSPinFiveButton.layer.cornerRadius = 3
        balanceEnquiryZSPinFiveButton.backgroundColor = UIColor.white
        balanceEnquiryZSPinFiveButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquiryZSPinSixButton.layer.cornerRadius = 3
        balanceEnquiryZSPinSixButton.backgroundColor = UIColor.white
        balanceEnquiryZSPinSixButton.setTitleColor(UIColor.black, for: .normal)
        
        balanceEnquiryZSPinFourButton.addTarget(self, action: #selector(balanceEnquiryZSPinFourButtonPressed), for: .touchUpInside)
        balanceEnquiryZSPinFiveButton.addTarget(self, action: #selector(balanceEnquiryZSPinFiveButtonPressed), for: .touchUpInside)
        balanceEnquiryZSPinSixButton.addTarget(self, action: #selector(balanceEnquiryZSPinSixButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [balanceEnquiryZSPinFourButton, balanceEnquiryZSPinFiveButton, balanceEnquiryZSPinSixButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL BALANCE ENQUIRY ZS OPTION VIEW ROW TWO BUTTON ACTIONS
    //----------------------------------------------------------------
    
    @objc func balanceEnquiryZSPinFourButtonPressed(){
        
        handlePin(txt1: balanceEnquiryZSPinP1Label, txt2: balanceEnquiryZSPinP2Label, txt3: balanceEnquiryZSPinP3Label, txt4: balanceEnquiryZSPinP4Label, button: balanceEnquiryZSPinFourButton)
    }
    
    @objc func balanceEnquiryZSPinFiveButtonPressed(){
        
        handlePin(txt1: balanceEnquiryZSPinP1Label, txt2: balanceEnquiryZSPinP2Label, txt3: balanceEnquiryZSPinP3Label, txt4: balanceEnquiryZSPinP4Label, button: balanceEnquiryZSPinFiveButton)
    }
    
    @objc func balanceEnquiryZSPinSixButtonPressed(){
        
        handlePin(txt1: balanceEnquiryZSPinP1Label, txt2: balanceEnquiryZSPinP2Label, txt3: balanceEnquiryZSPinP3Label, txt4: balanceEnquiryZSPinP4Label, button: balanceEnquiryZSPinSixButton)
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZS OPTION VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makeBalanceEnquiryZSPinViewRowThreeStackView() -> UIStackView {
        
        balanceEnquiryZSPinSevenButton.layer.cornerRadius = 3
        balanceEnquiryZSPinSevenButton.backgroundColor = UIColor.white
        balanceEnquiryZSPinSevenButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquiryZSPinEightButton.layer.cornerRadius = 3
        balanceEnquiryZSPinEightButton.backgroundColor = UIColor.white
        balanceEnquiryZSPinEightButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquiryZSPinNineButton.layer.cornerRadius = 3
        balanceEnquiryZSPinNineButton.backgroundColor = UIColor.white
        balanceEnquiryZSPinNineButton.setTitleColor(UIColor.black, for: .normal)
        
        balanceEnquiryZSPinSevenButton.addTarget(self, action: #selector(balanceEnquiryZSPinSevenButtonPressed), for: .touchUpInside)
        balanceEnquiryZSPinEightButton.addTarget(self, action: #selector(balanceEnquiryZSPinEightButtonPressed), for: .touchUpInside)
        balanceEnquiryZSPinNineButton.addTarget(self, action: #selector(balanceEnquiryZSPinNineButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [balanceEnquiryZSPinSevenButton, balanceEnquiryZSPinEightButton, balanceEnquiryZSPinNineButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BALANCE ENQUIRY ZS OPTION VIEW ROW THREE BUTTON ACTIONS
    //----------------------------------------------------------------
    
    @objc func balanceEnquiryZSPinSevenButtonPressed(){
        
        handlePin(txt1: balanceEnquiryZSPinP1Label, txt2: balanceEnquiryZSPinP2Label, txt3: balanceEnquiryZSPinP3Label, txt4: balanceEnquiryZSPinP4Label, button: balanceEnquiryZSPinSevenButton)
    }
    
    @objc func balanceEnquiryZSPinEightButtonPressed(){
        
        handlePin(txt1: balanceEnquiryZSPinP1Label, txt2: balanceEnquiryZSPinP2Label, txt3: balanceEnquiryZSPinP3Label, txt4: balanceEnquiryZSPinP4Label, button: balanceEnquiryZSPinEightButton)
    }
    
    @objc func balanceEnquiryZSPinNineButtonPressed(){
        
        handlePin(txt1: balanceEnquiryZSPinP1Label, txt2: balanceEnquiryZSPinP2Label, txt3: balanceEnquiryZSPinP3Label, txt4: balanceEnquiryZSPinP4Label, button: balanceEnquiryZSPinNineButton)
    }
    
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZS OPTION VIEW KEYBOARD ROW FOUR STACKVIEW
    //----------------------------------------------------------------
    
    func makeBalanceEnquiryZSPinViewRowFourStackView() -> UIStackView {
        
        balanceEnquiryZSPinZeroButton.layer.cornerRadius = 3
        balanceEnquiryZSPinZeroButton.backgroundColor = UIColor.white
        balanceEnquiryZSPinZeroButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquiryZSPinDecimalButton.layer.cornerRadius = 3
        balanceEnquiryZSPinDecimalButton.backgroundColor = UIColor.white
        balanceEnquiryZSPinDecimalButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquiryZSPinDeleteButton.layer.cornerRadius = 3
        balanceEnquiryZSPinDeleteButton.backgroundColor = UIColor.white
        balanceEnquiryZSPinDeleteButton.setTitleColor(UIColor.black, for: .normal)
        
        balanceEnquiryZSPinZeroButton.addTarget(self, action: #selector(balanceEnquiryZSPinZeroButtonPressed), for: .touchUpInside)
        balanceEnquiryZSPinDecimalButton.addTarget(self, action: #selector(balanceEnquiryZSPinDecimalButtonPressed), for: .touchUpInside)
        balanceEnquiryZSPinDeleteButton.addTarget(self, action: #selector(balanceEnquiryZSPinDeleteButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [balanceEnquiryZSPinZeroButton, balanceEnquiryZSPinDecimalButton, balanceEnquiryZSPinDeleteButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BALANCE ENQUIRY ZS PIN VIEW ROW FOUR BUTTON ACTIONS
    //----------------------------------------------------------------
    
    
    @objc func balanceEnquiryZSPinZeroButtonPressed() {
        
        handlePin(txt1: balanceEnquiryZSPinP1Label, txt2: balanceEnquiryZSPinP2Label, txt3: balanceEnquiryZSPinP3Label, txt4: balanceEnquiryZSPinP4Label, button: balanceEnquiryZSPinZeroButton)

    }
    
    
    
    @objc func balanceEnquiryZSPinDecimalButtonPressed() {
        
        //        clearPin(txt1: billPaymentsPinP1Label, txt2: billPaymentsPinP2Label, txt3: billPaymentsPinP3Label, txt4: billPaymentsPinP4Label)
        
    }
    
    
    @objc func balanceEnquiryZSPinDeleteButtonPressed() {
        
        clearPin(txt1: balanceEnquiryZSPinP1Label, txt2: balanceEnquiryZSPinP2Label, txt3: balanceEnquiryZSPinP3Label, txt4: balanceEnquiryZSPinP4Label)
        ZIMSWITCH_BALANCE_PIN = ""
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZB PIN  KEYBOARD CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeBalanceEnquiryZBPinKeyboardContainer(){
        
        balanceEnquiryZSPinKeyboardContainer.backgroundColor = Theme.LighterGray
        balanceEnquiryZSPinKeyboardContainer.layer.cornerRadius = 0
        balanceEnquiryZSPinView.addSubview(balanceEnquiryZSPinKeyboardContainer)
        
        balanceEnquiryZSPinKeyboardContainer.topAnchor.constraint(equalTo: balanceEnquiryZSPinTopContainer.bottomAnchor, constant: 5).isActive = true
        balanceEnquiryZSPinKeyboardContainer.leftAnchor.constraint(equalTo:   balanceEnquiryZSPinView.leftAnchor, constant: 5).isActive = true
        balanceEnquiryZSPinKeyboardContainer.rightAnchor.constraint(equalTo:  balanceEnquiryZSPinView.rightAnchor, constant: -5).isActive = true
        balanceEnquiryZSPinKeyboardContainer.bottomAnchor.constraint(equalTo: balanceEnquiryZSPinView.bottomAnchor, constant: -5).isActive = true
        
        makeBalanceEnquiryZSPinviewKeyBoardParentStackView()
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY ZS PIN VIEW KEYBOARD PARENT STACKVIEW
    //----------------------------------------------------------------
    
    func makeBalanceEnquiryZSPinviewKeyBoardParentStackView(){
        
        let pStackView = Controls().theParentStackView(buttons: [makeBalanceEnquiryZSPinViewRowOneStackView(), makeBalanceEnquiryZSPinViewRowTwoStackView(), makeBalanceEnquiryZSPinViewRowThreeStackView(), makeBalanceEnquiryZSPinViewRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 1
        balanceEnquiryZSPinKeyboardContainer.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: balanceEnquiryZSPinKeyboardContainer.leftAnchor).isActive = true
        pStackView.rightAnchor.constraint(equalTo: balanceEnquiryZSPinKeyboardContainer.rightAnchor).isActive = true
        pStackView.topAnchor.constraint(equalTo: balanceEnquiryZSPinKeyboardContainer.topAnchor).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: balanceEnquiryZSPinKeyboardContainer.bottomAnchor).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CHECK ZIMSWITCH BALANCE REQUEST
    //----------------------------------------------------------------
    
    func checkZimswitchBalance(url: String, parameters: [String: Any]){
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: ZimswitchBalanceModel?, error) in
            
            print("CHECK ZIMSWITCH BALANCE URL: \(url)")
            print("CHECK ZIMSWITCH BALANCE PARAMETERS: \(parameters)")
            
            if error != nil {
                
                print(error.debugDescription)
                
            }else {
                
                print(response!.toJSONString(prettyPrint: true)!)
                
            }
        }
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY FINAL DIALOG
    //----------------------------------------------------------------
    
   
    
    
    //----------------------------------------------------------------
    
}

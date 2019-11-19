//
//  InternalTransferPinView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/17/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit
import AlamofireObjectMapper
import Alamofire
import ObjectMapper


extension KeyboardViewController {
    

    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL TRANSER  PIN MAIN VIEW
    //----------------------------------------------------------------
    
    func makeInternalTransferPinView(){
        
        internalTransferPinView.backgroundColor = Theme.LighterGray
        internalTransferPinView.layer.cornerRadius = 0
        view.addSubview(internalTransferPinView)
        
        internalTransferPinView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        internalTransferPinView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        internalTransferPinView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        internalTransferPinView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        makeInternalTransferPinTopContainer()
        makeInternalTransferPinKeyboardContainer()
        
        
    }
    
    //----------------------------------------------------------------
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTEERNAL TRANSFER PIN VIEW TOP CONTAINER
    //----------------------------------------------------------------
    
    func makeInternalTransferPinTopContainer(){
        
        internalTransferPinTopContainer.backgroundColor = Theme.LighterGray
        internalTransferPinTopContainer.layer.cornerRadius = 0
        internalTransferPinView.addSubview(internalTransferPinTopContainer)
        
        internalTransferPinTopContainer.topAnchor.constraint(equalTo: internalTransferPinView.topAnchor).isActive = true
        internalTransferPinTopContainer.leftAnchor.constraint(equalTo: internalTransferPinView.leftAnchor).isActive = true
        internalTransferPinTopContainer.rightAnchor.constraint(equalTo: internalTransferPinView.rightAnchor).isActive = true
        internalTransferPinTopContainer.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        makeInternalTransferPinTopContainerLabel()
        makeInternalTransferPinViewBackButton()
        makeInternalTransferPinViewRightButton()
        makeInternalTransferPinStackView()
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL TRANSFER PIN TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeInternalTransferPinTopContainerLabel(){
        
        internalTransferPinTopContainer.addSubview(internalTransferPinLabel)
        internalTransferPinLabel.textAlignment = .center
        
        internalTransferPinLabel.topAnchor.constraint(equalTo: internalTransferPinTopContainer.topAnchor, constant: 3).isActive = true
        internalTransferPinLabel.leftAnchor.constraint(equalTo: internalTransferPinTopContainer.leftAnchor, constant: 3).isActive = true
        internalTransferPinLabel.rightAnchor.constraint(equalTo: internalTransferPinTopContainer.rightAnchor, constant: 3).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL TRANSFER PIN VIEW BACK BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeInternalTransferPinViewBackButton(){
        
        internalTransferPinBackBtn.layer.cornerRadius = 15
        internalTransferPinTopContainer.addSubview(internalTransferPinBackBtn)
        
        internalTransferPinBackBtn.addTarget(self, action: #selector(closeInternalTransferPinView), for: .touchUpInside)
        
        
        internalTransferPinBackBtn.topAnchor.constraint(equalTo: internalTransferPinLabel.bottomAnchor, constant: 2).isActive = true
        internalTransferPinBackBtn.leftAnchor.constraint(equalTo: internalTransferPinTopContainer.leftAnchor, constant: 8).isActive = true
        internalTransferPinBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        internalTransferPinBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CLOSE INTERNAL TRANSFER PIN VIEW
    //----------------------------------------------------------------
    
    @objc func closeInternalTransferPinView() {
        
        print("Back...")
         internalTransferPinView.removeFromSuperview()
    }
    
    //----------------------------------------------------------------
    
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE  INTERNAL TRANSFER PIN RIGHT BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeInternalTransferPinViewRightButton(){
        
            
            internalTransferPinRightBtn.layer.cornerRadius = 15
            internalTransferPinTopContainer.addSubview(internalTransferPinRightBtn)
            internalTransferPinRightBtn.addTarget(self, action: #selector(internalTransferPinRightBtnPressed), for: .touchUpInside)
            
            
            internalTransferPinRightBtn.topAnchor.constraint(equalTo: internalTransferPinLabel.bottomAnchor, constant: 2).isActive = true
            internalTransferPinRightBtn.rightAnchor.constraint(equalTo: internalTransferPinTopContainer.rightAnchor, constant: -8).isActive = true
            internalTransferPinRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
            internalTransferPinRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL TRANSFER PIN RIGHT BTN PRESSED
    //----------------------------------------------------------------
    
    @objc func internalTransferPinRightBtnPressed() {
        
        print("Working.....")
        
        
        
        if internalTransferPinP1Label.text?.isEmpty ?? true || internalTransferPinP2Label.text?.isEmpty ?? true || internalTransferPinP3Label.text?.isEmpty ?? true || internalTransferPinP4Label.text?.isEmpty ?? true {
            
            showValidationView(message: "Incomplete pin number")
            
        }else {
            
            let url = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/socialMedia/secured/sosho/internalTransfer"
            
            //        let parameters = Mapper().toJSON(InternalTransferPostModel(username: SharedPreference.getSquareMobileNumber()!, password: pinString, phone: SharedPreference.getSquareMobileNumber()!, amount: Double(KeyboardSharedPreferences().getAirtimeAmount()!)!))
            
            let internalTransferParams = Mapper().toJSON(InternalTransferPostModel(username: SharedPreference.getSquareMobileNumber()!, password: pinString, imei: SharedPreference.getIMEI()!, phone: SharedPreference.getSquareMobileNumber()!, account: INTERNAL_TRANSFER_DESTINATION_ACNT, amount: Double(INTERNAL_TRANSFER_AMOUNT)!))
            
            sendInternalTransfer(url: url, parameters: internalTransferParams)
        }

        

    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL TRANSFER PIN P1 LABEL
    //----------------------------------------------------------------
    
    func makeInternalTransferPinStackView(){
        
        internalTransferPinP1Label.backgroundColor = UIColor.white
        internalTransferPinP2Label.backgroundColor = UIColor.white
        internalTransferPinP3Label.backgroundColor = UIColor.white
        internalTransferPinP4Label.backgroundColor = UIColor.white
        
        internalTransferPinP1Label.textAlignment = .center
        internalTransferPinP2Label.textAlignment = .center
        internalTransferPinP3Label.textAlignment = .center
        internalTransferPinP4Label.textAlignment = .center
        
        internalTransferPinP1Label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        let hstackView = Controls().theHorizontalLabelStackView(labels: [internalTransferPinP1Label, internalTransferPinP2Label, internalTransferPinP3Label, internalTransferPinP4Label])
        hstackView.axis = .horizontal
        hstackView.distribution = .fillEqually
        hstackView.spacing = 2
        
        internalTransferPinTopContainer.addSubview(hstackView)
        
        hstackView.leftAnchor.constraint(equalTo: internalTransferPinBackBtn.rightAnchor, constant: 40).isActive = true
        hstackView.rightAnchor.constraint(equalTo: internalTransferPinRightBtn.leftAnchor, constant: -40).isActive = true
        hstackView.centerYAnchor.constraint(equalTo: internalTransferPinBackBtn.centerYAnchor).isActive = true
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL TRANSFER PIN VIEW KEYBOARD ROW ONE STACKVIEW
    //----------------------------------------------------------------
    
    func makeInternalTransferPinViewRowOneStackView() -> UIStackView {
        
        internalTransferPinOneButton.layer.cornerRadius = 3
        internalTransferPinOneButton.backgroundColor = UIColor.white
        internalTransferPinOneButton.setTitleColor(UIColor.black, for: .normal)
        internalTransferPinTwoButton.layer.cornerRadius = 3
        internalTransferPinTwoButton.backgroundColor = UIColor.white
        internalTransferPinTwoButton.setTitleColor(UIColor.black, for: .normal)
        internalTransferPinThreeButton.layer.cornerRadius = 3
        internalTransferPinThreeButton.backgroundColor = UIColor.white
        internalTransferPinThreeButton.setTitleColor(UIColor.black, for: .normal)
        
        internalTransferPinOneButton.addTarget(self, action: #selector(internalTransferPinOneButtonPressed), for: .touchUpInside)
        internalTransferPinTwoButton.addTarget(self, action: #selector(internalTransferPinTwoButtonPressed), for: .touchUpInside)
        internalTransferPinThreeButton.addTarget(self, action: #selector(internalTransferPinThreeButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [internalTransferPinOneButton, internalTransferPinTwoButton, internalTransferPinThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL TRANSFER PIN VIEW ROW ONE BUTTON ACTIONS
    //----------------------------------------------------------------
    
    @objc func internalTransferPinOneButtonPressed(){
        
        handlePin(txt1: internalTransferPinP1Label, txt2: internalTransferPinP2Label, txt3: internalTransferPinP3Label, txt4: internalTransferPinP4Label, button: internalTransferPinOneButton)
    }
    
    @objc func internalTransferPinTwoButtonPressed(){
        
         handlePin(txt1: internalTransferPinP1Label, txt2: internalTransferPinP2Label, txt3: internalTransferPinP3Label, txt4: internalTransferPinP4Label, button: internalTransferPinTwoButton)
    }
    
    @objc func internalTransferPinThreeButtonPressed(){
        
        handlePin(txt1: internalTransferPinP1Label, txt2: internalTransferPinP2Label, txt3: internalTransferPinP3Label, txt4: internalTransferPinP4Label, button: internalTransferPinThreeButton)
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL TRANSFER PIN VIEW KEYBOARD ROW TWO STACKVIEW
    //----------------------------------------------------------------
    
    func makeInternalTransferPinViewRowTwoStackView() -> UIStackView {
        
        internalTransferPinFourButton.layer.cornerRadius = 3
        internalTransferPinFourButton.backgroundColor = UIColor.white
        internalTransferPinFourButton.setTitleColor(UIColor.black, for: .normal)
        internalTransferPinFiveButton.layer.cornerRadius = 3
        internalTransferPinFiveButton.backgroundColor = UIColor.white
        internalTransferPinFiveButton.setTitleColor(UIColor.black, for: .normal)
        internalTransferPinSixButton.layer.cornerRadius = 3
        internalTransferPinSixButton.backgroundColor = UIColor.white
        internalTransferPinSixButton.setTitleColor(UIColor.black, for: .normal)
        
        internalTransferPinFourButton.addTarget(self, action: #selector(internalTransferPinFourButtonPressed), for: .touchUpInside)
        internalTransferPinFiveButton.addTarget(self, action: #selector(internalTransferPinFiveButtonPressed), for: .touchUpInside)
        internalTransferPinSixButton.addTarget(self, action: #selector(internalTransferPinSixButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [internalTransferPinFourButton, internalTransferPinFiveButton, internalTransferPinSixButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL TRANSFER PIN VIEW ROW TWO BUTTON ACTIONS
    //----------------------------------------------------------------
    
    @objc func internalTransferPinFourButtonPressed(){
        
        handlePin(txt1: internalTransferPinP1Label, txt2: internalTransferPinP2Label, txt3: internalTransferPinP3Label, txt4: internalTransferPinP4Label, button: internalTransferPinFourButton)
    }
    
    @objc func internalTransferPinFiveButtonPressed(){
        
        handlePin(txt1: internalTransferPinP1Label, txt2: internalTransferPinP2Label, txt3: internalTransferPinP3Label, txt4: internalTransferPinP4Label, button: internalTransferPinFiveButton)
    }
    
    @objc func internalTransferPinSixButtonPressed(){
        
        handlePin(txt1: internalTransferPinP1Label, txt2: internalTransferPinP2Label, txt3: internalTransferPinP3Label, txt4: internalTransferPinP4Label, button: internalTransferPinSixButton)
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL TRANSFER PIN VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makeInternalTransferPinViewRowThreeStackView() -> UIStackView {
        
        internalTransferPinSevenButton.layer.cornerRadius = 3
        internalTransferPinSevenButton.backgroundColor = UIColor.white
        internalTransferPinSevenButton.setTitleColor(UIColor.black, for: .normal)
        internalTransferPinEightButton.layer.cornerRadius = 3
        internalTransferPinEightButton.backgroundColor = UIColor.white
        internalTransferPinEightButton.setTitleColor(UIColor.black, for: .normal)
        internalTransferPinNineButton.layer.cornerRadius = 3
        internalTransferPinNineButton.backgroundColor = UIColor.white
        internalTransferPinNineButton.setTitleColor(UIColor.black, for: .normal)
        
        internalTransferPinSevenButton.addTarget(self, action: #selector(internalTransferPinSevenButtonPressed), for: .touchUpInside)
        internalTransferPinEightButton.addTarget(self, action: #selector(internalTransferPinEightButtonPressed), for: .touchUpInside)
        internalTransferPinNineButton.addTarget(self, action: #selector(internalTransferPinNineButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [internalTransferPinSevenButton, internalTransferPinEightButton, internalTransferPinNineButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL TRANSFER PIN VIEW ROW THREE BUTTON ACTIONS
    //----------------------------------------------------------------
    
    @objc func internalTransferPinSevenButtonPressed(){
        
        handlePin(txt1: internalTransferPinP1Label, txt2: internalTransferPinP2Label, txt3: internalTransferPinP3Label, txt4: internalTransferPinP4Label, button: internalTransferPinSevenButton)
    }
    
    @objc func internalTransferPinEightButtonPressed(){
        
        handlePin(txt1: internalTransferPinP1Label, txt2: internalTransferPinP2Label, txt3: internalTransferPinP3Label, txt4: internalTransferPinP4Label, button: internalTransferPinEightButton)
    }
    
    @objc func internalTransferPinNineButtonPressed(){
        
        handlePin(txt1: internalTransferPinP1Label, txt2: internalTransferPinP2Label, txt3: internalTransferPinP3Label, txt4: internalTransferPinP4Label, button: internalTransferPinNineButton)
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL TRANSFER PIN VIEW KEYBOARD ROW FOUR STACKVIEW
    //----------------------------------------------------------------
    
    func makeInternalTransferPinViewRowFourStackView() -> UIStackView {
        
        internalTransferPinZeroButton.layer.cornerRadius = 3
        internalTransferPinZeroButton.backgroundColor = UIColor.white
        internalTransferPinZeroButton.setTitleColor(UIColor.black, for: .normal)
        internalTransferPinDecimalButton.layer.cornerRadius = 3
        internalTransferPinDecimalButton.backgroundColor = UIColor.white
        internalTransferPinDecimalButton.setTitleColor(UIColor.black, for: .normal)
        internalTransferPinDeleteButton.layer.cornerRadius = 3
        internalTransferPinDeleteButton.backgroundColor = UIColor.white
        internalTransferPinDeleteButton.setTitleColor(UIColor.black, for: .normal)
        
        internalTransferPinZeroButton.addTarget(self, action: #selector(internalTransferPinZeroButtonPressed), for: .touchUpInside)
        internalTransferPinDecimalButton.addTarget(self, action: #selector(internalTransferPinDecimalButtonPressed), for: .touchUpInside)
        internalTransferPinDeleteButton.addTarget(self, action: #selector(internalTransferPinDeleteButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [internalTransferPinZeroButton, internalTransferPinDecimalButton, internalTransferPinDeleteButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL TRANSFER PIN VIEW ROW FOUR BUTTON ACTIONS
    //----------------------------------------------------------------
    
    
    @objc func internalTransferPinZeroButtonPressed() {
        
        handlePin(txt1: internalTransferPinP1Label, txt2: internalTransferPinP2Label, txt3: internalTransferPinP3Label, txt4: internalTransferPinP4Label, button: internalTransferPinZeroButton)
    }
    
    
    
    @objc func internalTransferPinDecimalButtonPressed() {
        
        //        clearPin(txt1: billPaymentsPinP1Label, txt2: billPaymentsPinP2Label, txt3: billPaymentsPinP3Label, txt4: billPaymentsPinP4Label)
        
    }
    
    
    @objc func internalTransferPinDeleteButtonPressed() {
        
        clearPin(txt1: internalTransferPinP1Label, txt2: internalTransferPinP2Label, txt3: internalTransferPinP3Label, txt4: internalTransferPinP4Label)
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL TRANSFER PIN KEYBOARD CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeInternalTransferPinKeyboardContainer(){
        
        internalTransferPinKeyboardContainer.backgroundColor = Theme.LighterGray
        internalTransferPinKeyboardContainer.layer.cornerRadius = 0
        internalTransferPinView.addSubview(internalTransferPinKeyboardContainer)
        
        internalTransferPinKeyboardContainer.topAnchor.constraint(equalTo: internalTransferPinTopContainer.bottomAnchor, constant: 5).isActive = true
        internalTransferPinKeyboardContainer.leftAnchor.constraint(equalTo:   internalTransferPinView.leftAnchor, constant: 5).isActive = true
        internalTransferPinKeyboardContainer.rightAnchor.constraint(equalTo:  internalTransferPinView.rightAnchor, constant: -5).isActive = true
        internalTransferPinKeyboardContainer.bottomAnchor.constraint(equalTo: internalTransferPinView.bottomAnchor, constant: -5).isActive = true
        
        makeInternalTransferPinviewKeyBoardParentStackView()
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE INTERNAL TRANSFER PIN VIEW KEYBOARD PARENT STACKVIEW
    //----------------------------------------------------------------
    
    func makeInternalTransferPinviewKeyBoardParentStackView(){
        
        let pStackView = Controls().theParentStackView(buttons: [makeInternalTransferPinViewRowOneStackView(), makeInternalTransferPinViewRowTwoStackView(), makeInternalTransferPinViewRowThreeStackView(), makeInternalTransferPinViewRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 6
        internalTransferPinKeyboardContainer.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: internalTransferPinKeyboardContainer.leftAnchor).isActive = true
        pStackView.rightAnchor.constraint(equalTo: internalTransferPinKeyboardContainer.rightAnchor).isActive = true
        pStackView.topAnchor.constraint(equalTo: internalTransferPinKeyboardContainer.topAnchor).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: internalTransferPinKeyboardContainer.bottomAnchor).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ADD PROGRESS CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeProgressInternalContainerView(){
        
        internalProgressView.backgroundColor = #colorLiteral(red: 0.1981083439, green: 0.04320339475, blue: 0.1978468009, alpha: 0.8520173373)
        internalTransferPinView.addSubview(internalProgressView)
        
        
        internalProgressView.topAnchor.constraint(equalTo: internalTransferPinView.topAnchor, constant: 0).isActive = true
        internalProgressView.leftAnchor.constraint(equalTo: internalTransferPinView.leftAnchor, constant: 0).isActive = true
        internalProgressView.rightAnchor.constraint(equalTo: internalTransferPinView.rightAnchor, constant: 0).isActive = true
        internalProgressView.bottomAnchor.constraint(equalTo: internalTransferPinView.bottomAnchor, constant: 0).isActive = true
        
        
        internalProgressView.addSubview(internalLoadingView)
        
        internalLoadingView.centerYAnchor.constraint(equalTo: internalProgressView.centerYAnchor).isActive = true
        internalLoadingView.centerXAnchor.constraint(equalTo: internalProgressView.centerXAnchor).isActive = true
        internalLoadingView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        internalLoadingView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        internalLoadingView.addSubview(internalProgressLabel)
        internalProgressLabel.text = "Please Wait"
        internalProgressLabel.textColor = Theme.WhitePrimary
        internalProgressLabel.numberOfLines = 0
        internalProgressLabel.textAlignment = .center
        internalProgressLabel.centerYAnchor.constraint(equalTo: internalLoadingView.centerYAnchor).isActive = true
        internalProgressLabel.centerXAnchor.constraint(equalTo: internalLoadingView.centerXAnchor).isActive = true
        internalProgressLabel.leftAnchor.constraint(equalTo: internalLoadingView.leftAnchor, constant: 3).isActive = true
        internalProgressLabel.rightAnchor.constraint(equalTo: internalLoadingView.rightAnchor, constant: -3).isActive = true
        
        
        internalProgressView.addSubview(internalProgressConfirmLabel)
        internalProgressConfirmLabel.text = ""
        internalProgressConfirmLabel.textColor = Theme.WhitePrimary
        internalProgressConfirmLabel.textAlignment = .center
        internalProgressConfirmLabel.topAnchor.constraint(equalTo: internalLoadingView.bottomAnchor, constant: 16).isActive = true
        internalProgressConfirmLabel.leftAnchor.constraint(equalTo: internalProgressView.leftAnchor, constant: 3).isActive = true
        internalProgressConfirmLabel.rightAnchor.constraint(equalTo: internalProgressView.rightAnchor, constant: -3).isActive = true
        
        
        internalProgressView.addSubview(internalProgressOkbtn)
        internalProgressOkbtn.backgroundColor = UIColor.white
        internalProgressOkbtn.layer.cornerRadius = 5
        internalProgressOkbtn.setTitleColor(Theme.PrimaryPurple, for: .normal)
        internalProgressOkbtn.addTarget(self, action: #selector(internalProgressOkbtnPressed), for: .touchUpInside)
        
        internalProgressOkbtn.topAnchor.constraint(equalTo: internalProgressView.topAnchor, constant: 10).isActive = true
        internalProgressOkbtn.rightAnchor.constraint(equalTo: internalProgressView.rightAnchor, constant: -8).isActive = true
        internalProgressOkbtn.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        internalProgressOkbtn.isHidden = true
        
        
        internalLoadingView.startAnimating()
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT PROGRESS OKAY BTN ACTION
    //----------------------------------------------------------------
    
    @objc func internalProgressOkbtnPressed(){
        
        
        internalProgressView.removeFromSuperview()
        internalLoadingView.removeFromSuperview()
        internalTransferPinView.removeFromSuperview()
    }
    
    
    //----------------------------------------------------------------

    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL TRANSFER REQUEST METHOD
    //----------------------------------------------------------------
    
    
    func sendInternalTransfer(url: String, parameters: [String: Any]){
        
        print("INTERNAL TRANSFER URL: \(url)")
        print("INTERNAL TRANSFER PARAMETERS: \(parameters)")
        self.makeProgressParticleProgressBar(containingView: internalTransferPinView)
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: InternalTransferModel?, error) in
            
         
            if error != nil {
                
                print(error.debugDescription)
                self.dismissParticleProgresssDialog()
                self.makeInternalTransferFinalDialog(transactionMessage: "Oops That didnt go as planned. The problem is: FAILED", icon: "oops")
                
            }else {
                
                if response!.message == "SUCCESS" {
                   
                    print(response!.toJSONString(prettyPrint: true)!)
                    print(error.debugDescription)
                    self.dismissParticleProgresssDialog()
                    
                    
                    self.internalTransferPinP1Label.text = ""
                    self.internalTransferPinP2Label.text = ""
                    self.internalTransferPinP3Label.text = ""
                    self.internalTransferPinP4Label.text = ""
                    self.pinString = ""
                    
                    self.makeInternalTransferFinalDialog(transactionMessage: "Yaay. We have touchdown. Your Internal Transfer was successful.", icon: "sosho_icon")
                    
                }else {
                    
                    print(response!.toJSONString(prettyPrint: true)!)
                    print(error.debugDescription)
                    self.dismissParticleProgresssDialog()
                    self.makeInternalTransferFinalDialog(transactionMessage: "Oops That didnt go as planned. The problem is: FAILED", icon: "oops")
                    
                }
                
               
            }
            
            
        }
        
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL TRANSFER FINAL DIALOG
    //----------------------------------------------------------------
    
    func makeInternalTransferFinalDialog(transactionMessage: String, icon: String){
        
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
        
        
        
        balanceFinalDialogMsgBtn.addTarget(self, action: #selector(internalFinalDialogMsgBtnPressed), for: .touchUpInside)
        
        balanceFinalDialogCloseBtn.addTarget(self, action: #selector(internalFinalDialogCloseBtnPressed), for: .touchUpInside)
        
    }
    
    //----------------------------------------------------------------
    
    @objc func internalFinalDialogMsgBtnPressed(){
    
        let proxy = textDocumentProxy
        proxy.insertText("I have just sent you an Internal Transfer of $\(Double(INTERNAL_TRANSFER_AMOUNT)!) to Your account: \(INTERNAL_TRANSFER_DESTINATION_ACNT)")
        
    }
    
    
    @objc func internalFinalDialogCloseBtnPressed() {
        
        balanceFinalDialog.removeFromSuperview()
    }
    
}

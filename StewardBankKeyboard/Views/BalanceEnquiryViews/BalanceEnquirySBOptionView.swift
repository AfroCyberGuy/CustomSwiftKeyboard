//
//  BalanceEnquirySBOptionView.swift
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
import ParticlesLoadingView


extension KeyboardViewController {
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BALANCE ENQUIRY SB OPTION PAYMENTS PIN
    //----------------------------------------------------------------
    
    func makebalanceEquirySBPinView(){
        
        balanceEnquirySBPinView.backgroundColor = Theme.LighterGray
        balanceEnquirySBPinView.layer.cornerRadius = 0
        view.addSubview(balanceEnquirySBPinView)
        
        balanceEnquirySBPinView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        balanceEnquirySBPinView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        balanceEnquirySBPinView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        balanceEnquirySBPinView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        makeBalanceEnquirySBPinTopContainer()
        makeBalanceEnquirySBPinKeyboardContainer()
        
        
    }
    
    //----------------------------------------------------------------
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY SB OPTION VIEW TOP CONTAINER
    //----------------------------------------------------------------
    
    func makeBalanceEnquirySBPinTopContainer(){
        
        balanceEnquirySBPinTopContainer.backgroundColor = Theme.LighterGray
        balanceEnquirySBPinTopContainer.layer.cornerRadius = 0
        balanceEnquirySBPinView.addSubview(balanceEnquirySBPinTopContainer)
        
        balanceEnquirySBPinTopContainer.topAnchor.constraint(equalTo: balanceEnquirySBPinView.topAnchor).isActive = true
        balanceEnquirySBPinTopContainer.leftAnchor.constraint(equalTo: balanceEnquirySBPinView.leftAnchor).isActive = true
        balanceEnquirySBPinTopContainer.rightAnchor.constraint(equalTo: balanceEnquirySBPinView.rightAnchor).isActive = true
        balanceEnquirySBPinTopContainer.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        makeBalanceEnquirySBPinTopContainerLabel()
        makeBalanceEnquirySBPinViewBackButton()
        makeBalanceEnquirySBPinViewRightButton()
        makeBalanceEnquirySBPinStackView()
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY SB OPTION TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeBalanceEnquirySBPinTopContainerLabel(){
        
        balanceEnquirySBPinTopContainer.addSubview(balanceEnquirySBPinLabel)
        balanceEnquirySBPinLabel.textAlignment = .center
        
        balanceEnquirySBPinLabel.topAnchor.constraint(equalTo: balanceEnquirySBPinTopContainer.topAnchor, constant: 3).isActive = true
        balanceEnquirySBPinLabel.leftAnchor.constraint(equalTo: balanceEnquirySBPinTopContainer.leftAnchor, constant: 3).isActive = true
        balanceEnquirySBPinLabel.rightAnchor.constraint(equalTo: balanceEnquirySBPinTopContainer.rightAnchor, constant: 3).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY SB OPTION VIEW BACK BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeBalanceEnquirySBPinViewBackButton(){
        
        balanceEnquirySBPinBackBtn.layer.cornerRadius = 15
        balanceEnquirySBPinTopContainer.addSubview(balanceEnquirySBPinBackBtn)
        
        balanceEnquirySBPinBackBtn.addTarget(self, action: #selector(closeBalanceEnquirySBPinView), for: .touchUpInside)
        
        
        balanceEnquirySBPinBackBtn.topAnchor.constraint(equalTo: balanceEnquirySBPinLabel.bottomAnchor, constant: 2).isActive = true
        balanceEnquirySBPinBackBtn.leftAnchor.constraint(equalTo: balanceEnquirySBPinTopContainer.leftAnchor, constant: 8).isActive = true
        balanceEnquirySBPinBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        balanceEnquirySBPinBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CLOSE BALANCE ENQUIRY SB OPTION VIEW
    //----------------------------------------------------------------
    
    @objc func closeBalanceEnquirySBPinView() {
        
        balanceEnquirySBPinView.removeFromSuperview()
    }
    
    //----------------------------------------------------------------
    
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY SB OPTION RIGHT BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeBalanceEnquirySBPinViewRightButton(){
        
        balanceEnquirySBPinRightBtn.layer.cornerRadius = 15
        balanceEnquirySBPinTopContainer.addSubview(balanceEnquirySBPinRightBtn)
        balanceEnquirySBPinRightBtn.addTarget(self, action: #selector(balanceEnquirySBOptionPinConfirmPin), for: .touchUpInside)
        
        
        balanceEnquirySBPinRightBtn.topAnchor.constraint(equalTo: balanceEnquirySBPinLabel.bottomAnchor, constant: 2).isActive = true
        balanceEnquirySBPinRightBtn.rightAnchor.constraint(equalTo: balanceEnquirySBPinTopContainer.rightAnchor, constant: -8).isActive = true
        balanceEnquirySBPinRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        balanceEnquirySBPinRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BALANCE ENQUIRY SB OPTION PIN BTN PRESSED
    //----------------------------------------------------------------
    
    @objc func balanceEnquirySBOptionPinConfirmPin () {
        
        let parameters = Mapper().toJSON(SquareBalancePostModel(phone: SharedPreference.getSquareMobileNumber()!, username: SharedPreference.getSquareMobileNumber()!, password: pinString))
        
        let url = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/socialMedia/secured/sosho/squareBalance"
        
        checkSBBalance(url: url, parameters: parameters)
        
        

    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY SB OPTION P1 LABEL
    //----------------------------------------------------------------
    
    func makeBalanceEnquirySBPinStackView(){
        
        balanceEnquirySBPinP1Label.backgroundColor = UIColor.white
        balanceEnquirySBPinP2Label.backgroundColor = UIColor.white
        balanceEnquirySBPinP3Label.backgroundColor = UIColor.white
        balanceEnquirySBPinP4Label.backgroundColor = UIColor.white
        
        balanceEnquirySBPinP1Label.textAlignment = .center
        balanceEnquirySBPinP2Label.textAlignment = .center
        balanceEnquirySBPinP3Label.textAlignment = .center
        balanceEnquirySBPinP4Label.textAlignment = .center
        
        balanceEnquirySBPinP1Label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        let hstackView = Controls().theHorizontalLabelStackView(labels: [balanceEnquirySBPinP1Label, balanceEnquirySBPinP2Label, balanceEnquirySBPinP3Label, balanceEnquirySBPinP4Label])
        hstackView.axis = .horizontal
        hstackView.distribution = .fillEqually
        hstackView.spacing = 5
        
        balanceEnquirySBPinTopContainer.addSubview(hstackView)
        
        hstackView.leftAnchor.constraint(equalTo: balanceEnquirySBPinBackBtn.rightAnchor, constant: 40).isActive = true
        hstackView.rightAnchor.constraint(equalTo: balanceEnquirySBPinRightBtn.leftAnchor, constant: -40).isActive = true
        hstackView.centerYAnchor.constraint(equalTo: balanceEnquirySBPinBackBtn.centerYAnchor).isActive = true
        
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY SB OPTION VIEW KEYBOARD ROW ONE STACKVIEW
    //----------------------------------------------------------------
    
    func makeBalanceEnquirySBPinViewRowOneStackView() -> UIStackView {
        
        balanceEnquirySBPinOneButton.layer.cornerRadius = 3
        balanceEnquirySBPinOneButton.backgroundColor = UIColor.white
        balanceEnquirySBPinOneButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquirySBPinTwoButton.layer.cornerRadius = 3
        balanceEnquirySBPinTwoButton.backgroundColor = UIColor.white
        balanceEnquirySBPinTwoButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquirySBPinThreeButton.layer.cornerRadius = 3
        balanceEnquirySBPinThreeButton.backgroundColor = UIColor.white
        balanceEnquirySBPinThreeButton.setTitleColor(UIColor.black, for: .normal)
        
        balanceEnquirySBPinOneButton.addTarget(self, action: #selector(balanceEnquirySBPinOneButtonPressed), for: .touchUpInside)
        balanceEnquirySBPinTwoButton.addTarget(self, action: #selector(balanceEnquirySBPinTwoButtonPressed), for: .touchUpInside)
        balanceEnquirySBPinThreeButton.addTarget(self, action: #selector(balanceEnquirySBPinThreeButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [balanceEnquirySBPinOneButton, balanceEnquirySBPinTwoButton, balanceEnquirySBPinThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 5
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL BALANCE ENQUIRY SB OPTION VIEW ROW ONE BUTTON ACTIONS
    //----------------------------------------------------------------
    
    @objc func balanceEnquirySBPinOneButtonPressed(){
        
        handlePin(txt1: balanceEnquirySBPinP1Label, txt2: balanceEnquirySBPinP2Label, txt3: balanceEnquirySBPinP3Label, txt4: balanceEnquirySBPinP4Label, button: balanceEnquirySBPinOneButton)
    }
    
    @objc func balanceEnquirySBPinTwoButtonPressed(){
        
        handlePin(txt1: balanceEnquirySBPinP1Label, txt2: balanceEnquirySBPinP2Label, txt3: balanceEnquirySBPinP3Label, txt4: balanceEnquirySBPinP4Label, button: balanceEnquirySBPinTwoButton)
    }
    
    @objc func balanceEnquirySBPinThreeButtonPressed(){
        
         handlePin(txt1: balanceEnquirySBPinP1Label, txt2: balanceEnquirySBPinP2Label, txt3: balanceEnquirySBPinP3Label, txt4: balanceEnquirySBPinP4Label, button: balanceEnquirySBPinThreeButton)
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY SB OPTION VIEW KEYBOARD ROW TWO STACKVIEW
    //----------------------------------------------------------------
    
    func makeBalanceEnquirySBPinViewRowTwoStackView() -> UIStackView {
        
        balanceEnquirySBPinFourButton.layer.cornerRadius = 3
        balanceEnquirySBPinFourButton.backgroundColor = UIColor.white
        balanceEnquirySBPinFourButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquirySBPinFiveButton.layer.cornerRadius = 3
        balanceEnquirySBPinFiveButton.backgroundColor = UIColor.white
        balanceEnquirySBPinFiveButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquirySBPinSixButton.layer.cornerRadius = 3
        balanceEnquirySBPinSixButton.backgroundColor = UIColor.white
        balanceEnquirySBPinSixButton.setTitleColor(UIColor.black, for: .normal)
        
        balanceEnquirySBPinFourButton.addTarget(self, action: #selector(balanceEnquirySBPinFourButtonPressed), for: .touchUpInside)
        balanceEnquirySBPinFiveButton.addTarget(self, action: #selector(balanceEnquirySBPinFiveButtonPressed), for: .touchUpInside)
        balanceEnquirySBPinSixButton.addTarget(self, action: #selector(balanceEnquirySBPinSixButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [balanceEnquirySBPinFourButton, balanceEnquirySBPinFiveButton, balanceEnquirySBPinSixButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 5
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL BALANCE ENQUIRY SB OPTION  VIEW ROW TWO BUTTON ACTIONS
    //----------------------------------------------------------------
    
    
    @objc func balanceEnquirySBPinFourButtonPressed() {
        
        
        handlePin(txt1: balanceEnquirySBPinP1Label, txt2: balanceEnquirySBPinP2Label, txt3: balanceEnquirySBPinP3Label, txt4: balanceEnquirySBPinP4Label, button: balanceEnquirySBPinFourButton)
        
    }
    
    @objc func balanceEnquirySBPinFiveButtonPressed() {
        
        handlePin(txt1: balanceEnquirySBPinP1Label, txt2: balanceEnquirySBPinP2Label, txt3: balanceEnquirySBPinP3Label, txt4: balanceEnquirySBPinP4Label, button: balanceEnquirySBPinFiveButton)
        
    }
    
    @objc func balanceEnquirySBPinSixButtonPressed() {
        
        handlePin(txt1: balanceEnquirySBPinP1Label, txt2: balanceEnquirySBPinP2Label, txt3: balanceEnquirySBPinP3Label, txt4: balanceEnquirySBPinP4Label, button: balanceEnquirySBPinSixButton)
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY SB OPTION VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makeBalanceEnquirySBPinViewRowThreeStackView() -> UIStackView {
        
        balanceEnquirySBPinSevenButton.layer.cornerRadius = 3
        balanceEnquirySBPinSevenButton.backgroundColor = UIColor.white
        balanceEnquirySBPinSevenButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquirySBPinEightButton.layer.cornerRadius = 3
        balanceEnquirySBPinEightButton.backgroundColor = UIColor.white
        balanceEnquirySBPinEightButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquirySBPinNineButton.layer.cornerRadius = 3
        balanceEnquirySBPinNineButton.backgroundColor = UIColor.white
        balanceEnquirySBPinNineButton.setTitleColor(UIColor.black, for: .normal)
        
        balanceEnquirySBPinSevenButton.addTarget(self, action: #selector(balanceEnquirySBPinSevenButtonPressed), for: .touchUpInside)
        balanceEnquirySBPinEightButton.addTarget(self, action: #selector(balanceEnquirySBPinEightButtonPressed), for: .touchUpInside)
        balanceEnquirySBPinNineButton.addTarget(self, action: #selector(balanceEnquirySBPinNineButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [balanceEnquirySBPinSevenButton, balanceEnquirySBPinEightButton, balanceEnquirySBPinNineButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 5
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL BALANCE ENQUIRY SB OPTION VIEW ROW THREE BUTTON ACTIONS
    //----------------------------------------------------------------
    
    
    @objc func balanceEnquirySBPinSevenButtonPressed() {
        
        
        handlePin(txt1: balanceEnquirySBPinP1Label, txt2: balanceEnquirySBPinP2Label, txt3: balanceEnquirySBPinP3Label, txt4: balanceEnquirySBPinP4Label, button: balanceEnquirySBPinSevenButton)
        
    }
    
    @objc func balanceEnquirySBPinEightButtonPressed() {
        
        handlePin(txt1: balanceEnquirySBPinP1Label, txt2: balanceEnquirySBPinP2Label, txt3: balanceEnquirySBPinP3Label, txt4: balanceEnquirySBPinP4Label, button: balanceEnquirySBPinEightButton)
        
    }
    
    @objc func balanceEnquirySBPinNineButtonPressed() {
        
        handlePin(txt1: balanceEnquirySBPinP1Label, txt2: balanceEnquirySBPinP2Label, txt3: balanceEnquirySBPinP3Label, txt4: balanceEnquirySBPinP4Label, button: balanceEnquirySBPinNineButton)
        
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY SB OPTION VIEW KEYBOARD ROW FOUR STACKVIEW
    //----------------------------------------------------------------
    
    func makeBalanceEnquirySBPinViewRowFourStackView() -> UIStackView {
        
        balanceEnquirySBPinZeroButton.layer.cornerRadius = 3
        balanceEnquirySBPinZeroButton.backgroundColor = UIColor.white
        balanceEnquirySBPinZeroButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquirySBPinDecimalButton.layer.cornerRadius = 3
        balanceEnquirySBPinDecimalButton.backgroundColor = UIColor.white
        balanceEnquirySBPinDecimalButton.setTitleColor(UIColor.black, for: .normal)
        balanceEnquirySBPinDeleteButton.layer.cornerRadius = 3
        balanceEnquirySBPinDeleteButton.backgroundColor = UIColor.white
        balanceEnquirySBPinDeleteButton.setTitleColor(UIColor.black, for: .normal)
        
        balanceEnquirySBPinZeroButton.addTarget(self, action: #selector(balanceEnquirySBPinZeroButtonPressed), for: .touchUpInside)
        balanceEnquirySBPinDecimalButton.addTarget(self, action: #selector(balanceEnquirySBPinDecimalButtonPressed), for: .touchUpInside)
        balanceEnquirySBPinDeleteButton.addTarget(self, action: #selector(balanceEnquirySBPinDeleteButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [balanceEnquirySBPinZeroButton, balanceEnquirySBPinDecimalButton, balanceEnquirySBPinDeleteButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 5
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL BALANCE ENQUIRY SB OPTION VIEW ROW FOUR BUTTON ACTIONS
    //----------------------------------------------------------------
    
    
    @objc func balanceEnquirySBPinZeroButtonPressed() {
        
         handlePin(txt1: balanceEnquirySBPinP1Label, txt2: balanceEnquirySBPinP2Label, txt3: balanceEnquirySBPinP3Label, txt4: balanceEnquirySBPinP4Label, button: balanceEnquirySBPinZeroButton)
    }
    
    
    
    @objc func balanceEnquirySBPinDecimalButtonPressed() {
        
//        clearPin(txt1: billPaymentsPinP1Label, txt2: billPaymentsPinP2Label, txt3: billPaymentsPinP3Label, txt4: billPaymentsPinP4Label)
        
    }
    
    
    @objc func balanceEnquirySBPinDeleteButtonPressed() {
        
                clearPin(txt1: balanceEnquirySBPinP1Label, txt2: balanceEnquirySBPinP2Label, txt3: balanceEnquirySBPinP3Label, txt4: balanceEnquirySBPinP4Label)
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY SB OPTION  KEYBOARD CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeBalanceEnquirySBPinKeyboardContainer(){
        
        balanceEnquirySBPinKeyboardContainer.backgroundColor = Theme.LighterGray
        balanceEnquirySBPinKeyboardContainer.layer.cornerRadius = 0
        balanceEnquirySBPinView.addSubview(balanceEnquirySBPinKeyboardContainer)
        
        balanceEnquirySBPinKeyboardContainer.topAnchor.constraint(equalTo: balanceEnquirySBPinTopContainer.bottomAnchor, constant: 5).isActive = true
        balanceEnquirySBPinKeyboardContainer.leftAnchor.constraint(equalTo:   balanceEnquirySBPinView.leftAnchor, constant: 5).isActive = true
        balanceEnquirySBPinKeyboardContainer.rightAnchor.constraint(equalTo:  balanceEnquirySBPinView.rightAnchor, constant: -5).isActive = true
        balanceEnquirySBPinKeyboardContainer.bottomAnchor.constraint(equalTo: balanceEnquirySBPinView.bottomAnchor, constant: -5).isActive = true
        
        makeBalanceEnquirySBPinviewKeyBoardParentStackView()
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY SB OPTION VIEW KEYBOARD PARENT STACKVIEW
    //----------------------------------------------------------------
    
    func makeBalanceEnquirySBPinviewKeyBoardParentStackView(){
        
        let pStackView = Controls().theParentStackView(buttons: [makeBalanceEnquirySBPinViewRowOneStackView(), makeBalanceEnquirySBPinViewRowTwoStackView(), makeBalanceEnquirySBPinViewRowThreeStackView(), makeBalanceEnquirySBPinViewRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 5
        balanceEnquirySBPinKeyboardContainer.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: balanceEnquirySBPinKeyboardContainer.leftAnchor).isActive = true
        pStackView.rightAnchor.constraint(equalTo: balanceEnquirySBPinKeyboardContainer.rightAnchor).isActive = true
        pStackView.topAnchor.constraint(equalTo: balanceEnquirySBPinKeyboardContainer.topAnchor).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: balanceEnquirySBPinKeyboardContainer.bottomAnchor).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ADD PROGRESS CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeProgressContainerView(){
        
        progressView.backgroundColor = #colorLiteral(red: 0.1981083439, green: 0.04320339475, blue: 0.1978468009, alpha: 0.8520173373)
        balanceEnquirySBPinView.addSubview(progressView)
        
        
        progressView.topAnchor.constraint(equalTo: balanceEnquirySBPinView.topAnchor, constant: 0).isActive = true
        progressView.leftAnchor.constraint(equalTo: balanceEnquirySBPinView.leftAnchor, constant: 0).isActive = true
        progressView.rightAnchor.constraint(equalTo: balanceEnquirySBPinView.rightAnchor, constant: 0).isActive = true
        progressView.bottomAnchor.constraint(equalTo: balanceEnquirySBPinView.bottomAnchor, constant: 0).isActive = true
       
        
        progressView.addSubview(loadingView)
        
        loadingView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor).isActive = true
        loadingView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor).isActive = true
        loadingView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        loadingView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        loadingView.addSubview(progressLabel)
        progressLabel.text = "Please Wait"
        progressLabel.textColor = Theme.WhitePrimary
        progressLabel.numberOfLines = 0
        progressLabel.textAlignment = .center
        progressLabel.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor).isActive = true
        progressLabel.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor).isActive = true
        progressLabel.leftAnchor.constraint(equalTo: loadingView.leftAnchor, constant: 3).isActive = true
        progressLabel.rightAnchor.constraint(equalTo: loadingView.rightAnchor, constant: -3).isActive = true
        
        
        progressView.addSubview(progressConfirmLabel)
        progressConfirmLabel.textColor = Theme.WhitePrimary
        progressConfirmLabel.textAlignment = .center
        progressConfirmLabel.topAnchor.constraint(equalTo: loadingView.bottomAnchor, constant: 16).isActive = true
        progressConfirmLabel.leftAnchor.constraint(equalTo: progressView.leftAnchor, constant: 3).isActive = true
        progressConfirmLabel.rightAnchor.constraint(equalTo: progressView.rightAnchor, constant: -3).isActive = true
        
        
        progressView.addSubview(progressOkbtn)
        progressOkbtn.backgroundColor = UIColor.white
        progressOkbtn.layer.cornerRadius = 5
        progressOkbtn.setTitleColor(Theme.PrimaryPurple, for: .normal)
        progressOkbtn.addTarget(self, action: #selector(progressOkBtn), for: .touchUpInside)
        
        progressOkbtn.topAnchor.constraint(equalTo: progressView.topAnchor, constant: 10).isActive = true
        progressOkbtn.rightAnchor.constraint(equalTo: progressView.rightAnchor, constant: -8).isActive = true
        progressOkbtn.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        progressOkbtn.isHidden = true
        
        
        loadingView.startAnimating()
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- PROGRESS OK BTN ACTION METHOD
    //----------------------------------------------------------------
    
    @objc func progressOkBtn(){
        
        progressView.removeFromSuperview()
        loadingView.removeFromSuperview()
        balanceEnquirySBPinView.removeFromSuperview()
        
    }
    

    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SB CHECK BALANCE METHOD
    //----------------------------------------------------------------
    
    func checkSBBalance(url: String, parameters: [String: Any]){
        
        
        if balanceEnquirySBPinP1Label.text != "" && balanceEnquirySBPinP2Label.text != "" && balanceEnquirySBPinP3Label.text != "", balanceEnquirySBPinP4Label.text != "" {
            
            makeProgressParticleProgressBar(containingView: balanceEnquirySBPinView)
            
            SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: SquareBalanceModel?, error) in
                
                print("SQUARE BALANCE URL: \(url)")
                print("SQUARE BALANCE PARAMETERS: \(parameters)")
                
                if error != nil {
                    
                    
                    print("Error: \(String(describing: error?.description))")
                    self.progressLabel.text = "Error Occurred"
                    self.loadingView.stopAnimating()
                    
                    self.stopParticleProgressDialog(generalProgressLabel: "Error", generalProgressConfirmLabel: "Error occured", generalBtnVisibility: false)
                    
                    
                }else {
                    
                    print(response!.toJSONString(prettyPrint: true)!)
                    if response!.message == "SUCCESS" {
                        
                                                
                        //self.stopParticleProgressDialog(generalProgressLabel: "Successful", generalProgressConfirmLabel: "Your current account balance is  $\(response!.responseBody!)", generalBtnVisibility: false)
                        
                        
                        self.dismissParticleProgresssDialog()
                        
                        self.balanceEnquirySBPinP1Label.text = ""
                        self.balanceEnquirySBPinP2Label.text = ""
                        self.balanceEnquirySBPinP3Label.text = ""
                        self.balanceEnquirySBPinP4Label.text = ""
                        
                        self.makeBalanceEnquiryFinalDialog(transactionMessage: "Yaay. We have touchdown. Your balance is: $\(response!.responseBody!)", imageName: "sosho_icon")
                        
                    }else {
                        
                        //self.stopParticleProgressDialog(generalProgressLabel: response!.message!, generalProgressConfirmLabel: response!.responseBody!, generalBtnVisibility: false)
                        
                        self.dismiss(animated: true)
                        
                        self.makeBalanceEnquiryFinalDialog(transactionMessage: "Oops. That didn't: go as planned. The problem is: Failed", imageName: "sosho_icon")
                        
                    }
                    
                }
            
            }
            
        }else {
            
            
            print("Pin error")
            
        }
        
    }
    
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BALANCE ENQUIRY FINAL DIALOG
    //----------------------------------------------------------------
    
    
    func makeBalanceEnquiryFinalDialog(transactionMessage: String, imageName: String){
        
        view.addSubview(balanceFinalDialog)
        balanceFinalDialog.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        balanceFinalDialog.layer.cornerRadius = 0
        
        balanceFinalDialog.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        balanceFinalDialog.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        balanceFinalDialog.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        balanceFinalDialog.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        balanceFinalDialog.addSubview(balanceFinalDialogIcon)
        balanceFinalDialogIcon.image = UIImage(named: "sosho_icon")
        balanceFinalDialogIcon.contentMode = .scaleAspectFit
        
        balanceFinalDialogIcon.topAnchor.constraint(equalTo: balanceFinalDialog.topAnchor, constant: 20).isActive = true
        balanceFinalDialogIcon.widthAnchor.constraint(equalToConstant: 100).isActive = true
        balanceFinalDialogIcon.heightAnchor.constraint(equalToConstant: 100).isActive = true
        balanceFinalDialogIcon.centerXAnchor.constraint(equalTo: balanceFinalDialog.centerXAnchor).isActive = true
        
        balanceFinalDialog.addSubview(balanceFinalDialogLabel)
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
        
        let hStackView = Controls().theHorizontalStackView(buttons: [balanceFinalDialogCloseBtn])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 20
        
        balanceFinalDialog.addSubview(hStackView)
        
        hStackView.topAnchor.constraint(equalTo: balanceFinalDialogLabel.bottomAnchor, constant: 10).isActive = true
        hStackView.leftAnchor.constraint(equalTo: balanceFinalDialog.leftAnchor, constant: 30).isActive = true
        hStackView.rightAnchor.constraint(equalTo: balanceFinalDialog.rightAnchor, constant: -30).isActive = true
        
        
        
//        balanceFinalDialogMsgBtn.addTarget(self, action: #selector(balanceFinalDialogMsgBtnPressed), for: .touchUpInside)
        
        balanceFinalDialogCloseBtn.addTarget(self, action: #selector(balanceFinalDialogCloseBtnPressed), for: .touchUpInside)
        
    }
    
    //----------------------------------------------------------------
    
 
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BALANCE ENQUIRY FINAL DIALOG
    //----------------------------------------------------------------
    
    @objc func balanceFinalDialogMsgBtnPressed() {
        
        let proxy = textDocumentProxy
        proxy.insertText("Yaay. Your transaction was successful.")
        
    }
    
    
    @objc func balanceFinalDialogCloseBtnPressed() {
        
       balanceFinalDialog.removeFromSuperview()
        
    }
    
    
    
    //----------------------------------------------------------------
    
    
    
}


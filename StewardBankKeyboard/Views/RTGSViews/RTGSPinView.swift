//
//  RTGSPinView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/8/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit

extension KeyboardViewController {
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:-  RTGS PIN VIEW
    //----------------------------------------------------------------
    
    func makeRTGSPinView(){
        
        RTGSPinView.backgroundColor = Theme.LighterGray
        RTGSPinView.layer.cornerRadius = 0
        view.addSubview(RTGSPinView)
        
        RTGSPinView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        RTGSPinView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        RTGSPinView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        RTGSPinView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        makeRTGSPinTopContainer()
        makeRTGSPinKeyboardContainer()
        
        
    }
    
    //----------------------------------------------------------------
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS PIN VIEW TOP CONTAINER
    //----------------------------------------------------------------
    
    func makeRTGSPinTopContainer(){
        
        RTGSPinTopContainer.backgroundColor = Theme.LighterGray
        RTGSPinTopContainer.layer.cornerRadius = 0
        RTGSPinView.addSubview(RTGSPinTopContainer)
        
        RTGSPinTopContainer.topAnchor.constraint(equalTo: RTGSPinView.topAnchor).isActive = true
        RTGSPinTopContainer.leftAnchor.constraint(equalTo: RTGSPinView.leftAnchor).isActive = true
        RTGSPinTopContainer.rightAnchor.constraint(equalTo: RTGSPinView.rightAnchor).isActive = true
        RTGSPinTopContainer.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        makeRTGSPinTopContainerLabel()
        makeRTGSPinViewBackButton()
        makeRTGSPinViewRightButton()
        makeRTGSPinStackView()
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS PIN TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeRTGSPinTopContainerLabel(){
        
        RTGSPinTopContainer.addSubview(RTGSPinLabel)
        RTGSPinLabel.textAlignment = .center
        
        RTGSPinLabel.topAnchor.constraint(equalTo: RTGSPinTopContainer.topAnchor, constant: 3).isActive = true
        RTGSPinLabel.leftAnchor.constraint(equalTo: RTGSPinTopContainer.leftAnchor, constant: 3).isActive = true
        RTGSPinLabel.rightAnchor.constraint(equalTo: RTGSPinTopContainer.rightAnchor, constant: 3).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS PIN VIEW BACK BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeRTGSPinViewBackButton(){
        
        RTGSPinBackBtn.layer.cornerRadius = 15
        RTGSPinTopContainer.addSubview(RTGSPinBackBtn)
        
        RTGSPinBackBtn.addTarget(self, action: #selector(closeRTGSPinView), for: .touchUpInside)
        
        
        RTGSPinBackBtn.topAnchor.constraint(equalTo: RTGSPinLabel.bottomAnchor, constant: 2).isActive = true
        RTGSPinBackBtn.leftAnchor.constraint(equalTo: RTGSPinTopContainer.leftAnchor, constant: 8).isActive = true
        RTGSPinBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        RTGSPinBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CLOSE RTGS PIN VIEW
    //----------------------------------------------------------------
    
    @objc func closeRTGSPinView() {
        
        RTGSPinView.removeFromSuperview()
    }
    
    //----------------------------------------------------------------
    
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS PIN VIEW RIGHT BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeRTGSPinViewRightButton(){
        
        RTGSPinRightBtn.layer.cornerRadius = 15
        RTGSPinTopContainer.addSubview(RTGSPinRightBtn)
        RTGSPinRightBtn.addTarget(self, action: #selector(RTGSPinConfirmPin), for: .touchUpInside)
        
        
        RTGSPinRightBtn.topAnchor.constraint(equalTo: RTGSPinLabel.bottomAnchor, constant: 2).isActive = true
        RTGSPinRightBtn.rightAnchor.constraint(equalTo: RTGSPinTopContainer.rightAnchor, constant: -8).isActive = true
        RTGSPinRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        RTGSPinRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS PIN CONFIRM PIN BTN PRESSED
    //----------------------------------------------------------------
    
    @objc func RTGSPinConfirmPin () {
        
        //        airtimePinView.removeFromSuperview()
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS PIN P1 LABEL
    //----------------------------------------------------------------
    
    func makeRTGSPinStackView(){
        
        RTGSPinP1Label.backgroundColor = UIColor.white
        RTGSPinP2Label.backgroundColor = UIColor.white
        RTGSPinP3Label.backgroundColor = UIColor.white
        RTGSPinP4Label.backgroundColor = UIColor.white
        
        RTGSPinP1Label.textAlignment = .center
        RTGSPinP2Label.textAlignment = .center
        RTGSPinP3Label.textAlignment = .center
        RTGSPinP4Label.textAlignment = .center
        
        RTGSPinP1Label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        let hstackView = Controls().theHorizontalLabelStackView(labels: [RTGSPinP1Label, RTGSPinP2Label, RTGSPinP3Label, RTGSPinP4Label])
        hstackView.axis = .horizontal
        hstackView.distribution = .fillEqually
        hstackView.spacing = 2
        
        RTGSPinTopContainer.addSubview(hstackView)
        
        hstackView.leftAnchor.constraint(equalTo: RTGSPinBackBtn.rightAnchor, constant: 40).isActive = true
        hstackView.rightAnchor.constraint(equalTo: RTGSPinRightBtn.leftAnchor, constant: -40).isActive = true
        hstackView.centerYAnchor.constraint(equalTo: RTGSPinBackBtn.centerYAnchor).isActive = true
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS PIN VIEW KEYBOARD ROW ONE STACKVIEW
    //----------------------------------------------------------------
    
    func makeRTGSPinViewRowOneStackView() -> UIStackView {
        
        RTGSPinOneButton.layer.cornerRadius = 3
        RTGSPinOneButton.backgroundColor = UIColor.white
        RTGSPinOneButton.setTitleColor(UIColor.black, for: .normal)
        RTGSPinTwoButton.layer.cornerRadius = 3
        RTGSPinTwoButton.backgroundColor = UIColor.white
        RTGSPinTwoButton.setTitleColor(UIColor.black, for: .normal)
        RTGSPinThreeButton.layer.cornerRadius = 3
        RTGSPinThreeButton.backgroundColor = UIColor.white
        RTGSPinThreeButton.setTitleColor(UIColor.black, for: .normal)
        
        RTGSPinOneButton.addTarget(self, action: #selector(RTGSPinOneButtonPressed), for: .touchUpInside)
        RTGSPinTwoButton.addTarget(self, action: #selector(RTGSPinTwoButtonPressed), for: .touchUpInside)
        RTGSPinThreeButton.addTarget(self, action: #selector(RTGSPinThreeButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [RTGSPinOneButton, RTGSPinTwoButton, RTGSPinThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:-  RTGS PIN VIEW ROW ONE BUTTON ACTIONS
    //----------------------------------------------------------------
    
    @objc func RTGSPinOneButtonPressed(){
        
        handlePin(txt1: RTGSPinP1Label, txt2: RTGSPinP2Label, txt3: RTGSPinP3Label, txt4: RTGSPinP4Label, button: RTGSPinOneButton)
    }
    
    @objc func RTGSPinTwoButtonPressed(){
        
        handlePin(txt1: RTGSPinP1Label, txt2: RTGSPinP2Label, txt3: RTGSPinP3Label, txt4: RTGSPinP4Label, button: RTGSPinTwoButton)
    }
    
    @objc func RTGSPinThreeButtonPressed(){
        
        handlePin(txt1: RTGSPinP1Label, txt2: RTGSPinP2Label, txt3: RTGSPinP3Label, txt4: RTGSPinP4Label, button: RTGSPinThreeButton)
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS PIN VIEW KEYBOARD ROW TWO STACKVIEW
    //----------------------------------------------------------------
    
    func makeRTGSPinViewRowTwoStackView() -> UIStackView {
        
        RTGSPinFourButton.layer.cornerRadius = 3
        RTGSPinFourButton.backgroundColor = UIColor.white
        RTGSPinFourButton.setTitleColor(UIColor.black, for: .normal)
        RTGSPinFiveButton.layer.cornerRadius = 3
        RTGSPinFiveButton.backgroundColor = UIColor.white
        RTGSPinFiveButton.setTitleColor(UIColor.black, for: .normal)
        RTGSPinSixButton.layer.cornerRadius = 3
        RTGSPinSixButton.backgroundColor = UIColor.white
        RTGSPinSixButton.setTitleColor(UIColor.black, for: .normal)
        
        RTGSPinFourButton.addTarget(self, action: #selector(RTGSPinFourButtonPressed), for: .touchUpInside)
        RTGSPinFiveButton.addTarget(self, action: #selector(RTGSPinFiveButtonPressed), for: .touchUpInside)
        RTGSPinSixButton.addTarget(self, action: #selector(RTGSPinSixButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [RTGSPinFourButton, RTGSPinFiveButton, RTGSPinSixButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS PIN VIEW ROW TWO BUTTON ACTIONS
    //----------------------------------------------------------------
    
    
    @objc func RTGSPinFourButtonPressed() {
        
        
        handlePin(txt1: RTGSPinP1Label, txt2: RTGSPinP2Label, txt3: RTGSPinP3Label, txt4: RTGSPinP4Label, button: RTGSPinFourButton)
        
    }
    
    @objc func RTGSPinFiveButtonPressed() {
        
        handlePin(txt1: RTGSPinP1Label, txt2: RTGSPinP2Label, txt3: RTGSPinP3Label, txt4: RTGSPinP4Label, button: RTGSPinFiveButton)
        
    }
    
    @objc func RTGSPinSixButtonPressed() {
        
        handlePin(txt1: RTGSPinP1Label, txt2: RTGSPinP2Label, txt3: RTGSPinP3Label, txt4: RTGSPinP4Label, button: RTGSPinSixButton)
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS PIN VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makeRTGSPinViewRowThreeStackView() -> UIStackView {
        
        RTGSPinSevenButton.layer.cornerRadius = 3
        RTGSPinSevenButton.backgroundColor = UIColor.white
        RTGSPinSevenButton.setTitleColor(UIColor.black, for: .normal)
        RTGSPinEightButton.layer.cornerRadius = 3
        RTGSPinEightButton.backgroundColor = UIColor.white
        RTGSPinEightButton.setTitleColor(UIColor.black, for: .normal)
        RTGSPinNineButton.layer.cornerRadius = 3
        RTGSPinNineButton.backgroundColor = UIColor.white
        RTGSPinNineButton.setTitleColor(UIColor.black, for: .normal)
        
        RTGSPinSevenButton.addTarget(self, action: #selector(RTGSPinSevenButtonPressed), for: .touchUpInside)
        RTGSPinEightButton.addTarget(self, action: #selector(RTGSPinEightButtonPressed), for: .touchUpInside)
        RTGSPinNineButton.addTarget(self, action: #selector(RTGSPinNineButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [RTGSPinSevenButton, RTGSPinEightButton, RTGSPinNineButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS PIN VIEW ROW THREE BUTTON ACTIONS
    //----------------------------------------------------------------
    
    
    @objc func RTGSPinSevenButtonPressed() {
        
        
        handlePin(txt1: RTGSPinP1Label, txt2: RTGSPinP2Label, txt3: RTGSPinP3Label, txt4: RTGSPinP4Label, button: RTGSPinSevenButton)
        
    }
    
    @objc func RTGSPinEightButtonPressed() {
        
        handlePin(txt1: RTGSPinP1Label, txt2: RTGSPinP2Label, txt3: RTGSPinP3Label, txt4: RTGSPinP4Label, button: RTGSPinEightButton)
        
    }
    
    @objc func RTGSPinNineButtonPressed() {
        
        handlePin(txt1: RTGSPinP1Label, txt2: RTGSPinP2Label, txt3: RTGSPinP3Label, txt4: RTGSPinP4Label, button: RTGSPinNineButton)
        
    }
    
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS PIN VIEW KEYBOARD ROW FOUR STACKVIEW
    //----------------------------------------------------------------
    
    func makeRTGSPinViewRowFourStackView() -> UIStackView {
        
        RTGSPinZeroButton.layer.cornerRadius = 3
        RTGSPinZeroButton.backgroundColor = UIColor.white
        RTGSPinZeroButton.setTitleColor(UIColor.black, for: .normal)
        RTGSPinDeleteButton.layer.cornerRadius = 3
        RTGSPinDeleteButton.backgroundColor = UIColor.white
        RTGSPinDeleteButton.setTitleColor(UIColor.black, for: .normal)
        
        
        RTGSPinZeroButton.addTarget(self, action: #selector(RTGSPinZeroButtonPressed), for: .touchUpInside)
        RTGSPinDeleteButton.addTarget(self, action: #selector(RTGSPinDeleteButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [RTGSPinZeroButton, RTGSPinDeleteButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS PIN VIEW ROW FOUR BUTTON ACTIONS
    //----------------------------------------------------------------
    
    
    @objc func RTGSPinZeroButtonPressed() {
        
        handlePin(txt1: RTGSPinP1Label, txt2: RTGSPinP2Label, txt3: RTGSPinP3Label, txt4: RTGSPinP4Label, button: RTGSPinZeroButton)
    }
    
    
    
    @objc func RTGSPinDeleteButtonPressed() {
        
        clearPin(txt1: RTGSPinP1Label, txt2: RTGSPinP2Label, txt3: RTGSPinP3Label, txt4: RTGSPinP4Label)
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS PIN KEYBOARD CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeRTGSPinKeyboardContainer(){
        
        RTGSPinKeyboardContainer.backgroundColor = Theme.LighterGray
        RTGSPinKeyboardContainer.layer.cornerRadius = 0
        RTGSPinView.addSubview(RTGSPinKeyboardContainer)
        
        RTGSPinKeyboardContainer.topAnchor.constraint(equalTo: RTGSPinTopContainer.bottomAnchor, constant: 5).isActive = true
        RTGSPinKeyboardContainer.leftAnchor.constraint(equalTo:   RTGSPinView.leftAnchor, constant: 5).isActive = true
        RTGSPinKeyboardContainer.rightAnchor.constraint(equalTo:  RTGSPinView.rightAnchor, constant: -5).isActive = true
        RTGSPinKeyboardContainer.bottomAnchor.constraint(equalTo: RTGSPinView.bottomAnchor, constant: -5).isActive = true
        
        makeRTGSPinKeyBoardParentStackView()
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS PIN VIEW KEYBOARD PARENT STACKVIEW
    //----------------------------------------------------------------
    
    func makeRTGSPinKeyBoardParentStackView(){
        
        let pStackView = Controls().theParentStackView(buttons: [makeRTGSPinViewRowOneStackView(), makeRTGSPinViewRowTwoStackView(), makeRTGSPinViewRowThreeStackView(), makeRTGSPinViewRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 1
        RTGSPinKeyboardContainer.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: RTGSPinKeyboardContainer.leftAnchor).isActive = true
        pStackView.rightAnchor.constraint(equalTo: RTGSPinKeyboardContainer.rightAnchor).isActive = true
        pStackView.topAnchor.constraint(equalTo: RTGSPinKeyboardContainer.topAnchor).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: RTGSPinKeyboardContainer.bottomAnchor).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    
    
    
}

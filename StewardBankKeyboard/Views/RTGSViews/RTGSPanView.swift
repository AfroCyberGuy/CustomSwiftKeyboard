//
//  RTGSPanView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/8/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit


extension KeyboardViewController{
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS PAYMENTS ZIMSWITCH PAN VIEW
    //----------------------------------------------------------------
    
    func makeRTGSPaymentsZimSwitchPanView(){
        
        RTGSPanView.backgroundColor = Theme.LighterGray
        RTGSPanView.layer.cornerRadius = 0
        view.addSubview(RTGSPanView)
        setupRTGSPaymentsZimSwitchPan()
        makeRTGSPanTopContainer()
        makeRTGSPanKeyboardViewContainer()
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS  PAN VIEW TOP CONTAINER
    //----------------------------------------------------------------
    
    func makeRTGSPanTopContainer(){
        
        RTGSPanTopContainer.backgroundColor = Theme.LighterGray
        RTGSPanTopContainer.layer.cornerRadius = 0
        RTGSPanView.addSubview(RTGSPanTopContainer)
        
        RTGSPanTopContainer.topAnchor.constraint(equalTo: RTGSPanView.topAnchor).isActive = true
        RTGSPanTopContainer.leftAnchor.constraint(equalTo: RTGSPanView.leftAnchor).isActive = true
        RTGSPanTopContainer.rightAnchor.constraint(equalTo: RTGSPanView.rightAnchor).isActive = true
        RTGSPanTopContainer.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        
        makeRTGSPanTopContainerLabel()
        makeRTGSPanViewBackButton()
        makeRTGSPanViewRightButton()
        makeRTGSPanTopContainerTextField()
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS PAN TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeRTGSPanTopContainerLabel(){
        
        RTGSPanTopContainer.addSubview(RTGSPanTopContainerLabel)
        RTGSPanTopContainerLabel.textAlignment = .center
        
        RTGSPanTopContainerLabel.topAnchor.constraint(equalTo: RTGSPanTopContainer.topAnchor, constant: 3).isActive = true
        RTGSPanTopContainerLabel.leftAnchor.constraint(equalTo: RTGSPanTopContainer.leftAnchor, constant: 3).isActive = true
        RTGSPanTopContainerLabel.rightAnchor.constraint(equalTo: RTGSPanTopContainer.rightAnchor, constant: 3).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS PAN VIEW BACK BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeRTGSPanViewBackButton(){
        
        RTGSPanBackBtn.layer.cornerRadius = 15
        RTGSPanTopContainer.addSubview(RTGSPanBackBtn)
        
        
        RTGSPanBackBtn.addTarget(self, action: #selector(RTGSPanBackButtonPressed), for: .touchUpInside)
        
        RTGSPanBackBtn.topAnchor.constraint(equalTo: RTGSPanTopContainerLabel.bottomAnchor, constant: 2).isActive = true
        RTGSPanBackBtn.leftAnchor.constraint(equalTo: RTGSPanTopContainer.leftAnchor, constant: 8).isActive = true
        RTGSPanBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        RTGSPanBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS PAN BACK BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func RTGSPanBackButtonPressed(){
        
        RTGSPanView.removeFromSuperview()
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS PAN VIEW RIGHT BUTTON VIEW
    //----------------------------------------------------------------
    
    func makeRTGSPanViewRightButton(){
        
        RTGSPanRightBtn.layer.cornerRadius = 15
        RTGSPanTopContainer.addSubview(RTGSPanRightBtn)
        
        
        RTGSPanRightBtn.addTarget(self, action: #selector(RTGSPanRightBtnPressed), for: .touchUpInside)
        
        RTGSPanRightBtn.topAnchor.constraint(equalTo: RTGSPanTopContainerLabel.bottomAnchor, constant: 2).isActive = true
        RTGSPanRightBtn.rightAnchor.constraint(equalTo: RTGSPanTopContainer.rightAnchor, constant: -8).isActive = true
        RTGSPanRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        RTGSPanRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS PAN RIGHT BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func RTGSPanRightBtnPressed(){
        
        
        makeRTGSPinView()
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS PAN TOP CONTAINER TEXT FIELD
    //----------------------------------------------------------------
    
    func makeRTGSPanTopContainerTextField(){
        
        RTGSPanTopContainer.addSubview(RTGSPanTextField)
        RTGSPanTextField.textAlignment = .center
        RTGSPanTextField.backgroundColor = UIColor.white
        RTGSPanTextField.layer.cornerRadius = 5
        RTGSPanTextField.layer.masksToBounds = true
        RTGSPanTextField.textColor = UIColor.gray
        
        RTGSPanTextField.centerYAnchor.constraint(equalTo: RTGSPanBackBtn.centerYAnchor).isActive = true
        RTGSPanTextField.leftAnchor.constraint(equalTo: RTGSPanBackBtn.rightAnchor, constant: 30).isActive = true
        RTGSPanTextField.rightAnchor.constraint(equalTo: RTGSPanRightBtn.leftAnchor, constant: -30).isActive = true
        RTGSPanTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS PAN VIEW KEYBOARD CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeRTGSPanKeyboardViewContainer(){
        
        RTGSPanKeyboardContainer.backgroundColor = UIColor.lightGray
        RTGSPanKeyboardContainer.layer.cornerRadius = 0
        RTGSPanView.addSubview(RTGSPanKeyboardContainer)
        
        RTGSPanKeyboardContainer.topAnchor.constraint(equalTo: RTGSPanTopContainer.bottomAnchor, constant: 5).isActive = true
        RTGSPanKeyboardContainer.leftAnchor.constraint(equalTo: RTGSPanView.leftAnchor, constant: 5).isActive = true
        RTGSPanKeyboardContainer.rightAnchor.constraint(equalTo: RTGSPanView.rightAnchor, constant: -5).isActive = true
        RTGSPanKeyboardContainer.bottomAnchor.constraint(equalTo: RTGSPanView.bottomAnchor, constant: -5).isActive = true
        
        makeRTGSPanKeyBoardParentStackView()
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS PAN VIEW KEYBOARD ROW ONE STACKVIEW
    //----------------------------------------------------------------
    
    func makeRTGSPanRowOneStackView() -> UIStackView {
        
        RTGSPanOneButton.layer.cornerRadius = 3
        RTGSPanOneButton.backgroundColor = UIColor.white
        RTGSPanOneButton.setTitleColor(UIColor.black, for: .normal)
        RTGSPanTwoButton.layer.cornerRadius = 3
        RTGSPanTwoButton.backgroundColor = UIColor.white
        RTGSPanTwoButton.setTitleColor(UIColor.black, for: .normal)
        RTGSPanThreeButton.layer.cornerRadius = 3
        RTGSPanThreeButton.backgroundColor = UIColor.white
        RTGSPanThreeButton.setTitleColor(UIColor.black, for: .normal)
        
        RTGSPanOneButton.addTarget(self, action: #selector(RTGSPanOneButtonPressed), for: .touchUpInside)
        RTGSPanTwoButton.addTarget(self, action: #selector(RTGSPanTwoButtonPressed), for: .touchUpInside)
        RTGSPanThreeButton.addTarget(self, action: #selector(RTGSPanThreeButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [RTGSPanOneButton, RTGSPanTwoButton, RTGSPanThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
        
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS  PAN ROW ONE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func RTGSPanOneButtonPressed(){
        
        numpadBtnPressed(button: RTGSPanOneButton, label: RTGSPanTextField)
        
    }
    
    @objc func RTGSPanTwoButtonPressed(){
        
        numpadBtnPressed(button: RTGSPanTwoButton, label: RTGSPanTextField)
        
    }
    
    @objc func RTGSPanThreeButtonPressed(){
        
        numpadBtnPressed(button: RTGSPanThreeButton, label: RTGSPanTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS PAN VIEW KEYBOARD ROW TWO STACKVIEW
    //----------------------------------------------------------------
    
    func makeRTGSPanRowTwoStackView() -> UIStackView {
        
        RTGSPanFourButton.layer.cornerRadius = 3
        RTGSPanFourButton.backgroundColor = UIColor.white
        RTGSPanFourButton.setTitleColor(UIColor.black, for: .normal)
        RTGSPanFiveButton.layer.cornerRadius = 3
        RTGSPanFiveButton.backgroundColor = UIColor.white
        RTGSPanFiveButton.setTitleColor(UIColor.black, for: .normal)
        RTGSPanSixButton.layer.cornerRadius = 3
        RTGSPanSixButton.backgroundColor = UIColor.white
        RTGSPanSixButton.setTitleColor(UIColor.black, for: .normal)
        
        RTGSPanFourButton.addTarget(self, action: #selector(RTGSPanFourButtonPressed), for: .touchUpInside)
        RTGSPanFiveButton.addTarget(self, action: #selector(RTGSPanFiveButtonPressed), for: .touchUpInside)
        RTGSPanSixButton.addTarget(self, action: #selector(RTGSPanSixButtonPressed), for: .touchUpInside)

        
        let hStackView = Controls().theHorizontalStackView(buttons: [RTGSPanFourButton, RTGSPanFiveButton, RTGSPanSixButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS ROW TWO BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func RTGSPanFourButtonPressed(){
        
        numpadBtnPressed(button: RTGSPanFourButton, label: RTGSPanTextField)
        
    }
    
    @objc func RTGSPanFiveButtonPressed(){
        
        numpadBtnPressed(button: RTGSPanFiveButton, label: RTGSPanTextField)
        
    }
    
    @objc func RTGSPanSixButtonPressed(){
        
        numpadBtnPressed(button: RTGSPanSixButton, label: RTGSPanTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS PAN VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makeRTGSPanRowThreeStackView() -> UIStackView {
        
        RTGSPanSevenButton.layer.cornerRadius = 3
        RTGSPanSevenButton.backgroundColor = UIColor.white
        RTGSPanSevenButton.setTitleColor(UIColor.black, for: .normal)
        RTGSPanEightButton.layer.cornerRadius = 3
        RTGSPanEightButton.backgroundColor = UIColor.white
        RTGSPanEightButton.setTitleColor(UIColor.black, for: .normal)
        RTGSPanNineButton.layer.cornerRadius = 3
        RTGSPanNineButton.backgroundColor = UIColor.white
        RTGSPanNineButton.setTitleColor(UIColor.black, for: .normal)
        
        RTGSPanSevenButton.addTarget(self, action: #selector(RTGSPanSevenButtonPressed), for: .touchUpInside)
        RTGSPanEightButton.addTarget(self, action: #selector(RTGSPanEightButtonPressed), for: .touchUpInside)
        RTGSPanNineButton.addTarget(self, action: #selector(RTGSPanNineButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [RTGSPanSevenButton, RTGSPanEightButton, RTGSPanNineButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS PAN ROW THREE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func RTGSPanSevenButtonPressed(){
        
        numpadBtnPressed(button: RTGSPanSevenButton, label: RTGSPanTextField)
        
    }
    
    @objc func RTGSPanEightButtonPressed(){
        
        numpadBtnPressed(button: RTGSPanEightButton, label: RTGSPanTextField)
        
    }
    
    @objc func RTGSPanNineButtonPressed(){
        
        numpadBtnPressed(button: RTGSPanNineButton, label: RTGSPanTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS PAN VIEW KEYBOARD ROW FOUR STACKVIEW
    //----------------------------------------------------------------
    
    func makeRTGSPanRowFourStackView() -> UIStackView {
        
        RTGSPanZeroButton.layer.cornerRadius = 3
        RTGSPanZeroButton.backgroundColor = UIColor.white
        RTGSPanZeroButton.setTitleColor(UIColor.black, for: .normal)
        RTGSPanDecimalButton.layer.cornerRadius = 3
        RTGSPanDecimalButton.backgroundColor = UIColor.white
        RTGSPanDecimalButton.setTitleColor(UIColor.black, for: .normal)
        RTGSPanDeleteButton.layer.cornerRadius = 3
        RTGSPanDeleteButton.backgroundColor = UIColor.white
        RTGSPanDeleteButton.setTitleColor(UIColor.black, for: .normal)
        
        RTGSPanZeroButton.addTarget(self, action: #selector(RTGSPanZeroButtonPressed), for: .touchUpInside)
        RTGSPanDecimalButton.addTarget(self, action: #selector(RTGSPanDecimalButtonPressed), for: .touchUpInside)
        RTGSPanDeleteButton.addTarget(self, action: #selector(RTGSPanDeleteButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [RTGSPanZeroButton, RTGSPanDecimalButton, RTGSPanDeleteButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 1
        
        return hStackView
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS ROW FOUR BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func RTGSPanZeroButtonPressed(){
        
        numpadBtnPressed(button: RTGSPanZeroButton, label: RTGSPanTextField)
        
    }
    
    @objc func RTGSPanDecimalButtonPressed(){
        
        numpadBtnPressed(button: RTGSPanDecimalButton, label: RTGSPanTextField)
        
    }
    
    @objc func RTGSPanDeleteButtonPressed(){
        
        numpadClearBtnPressed(button: RTGSPanDeleteButton, label: RTGSPanTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS PAN KEYBOARD PARENT STACKVIEW
    //----------------------------------------------------------------
    
    func makeRTGSPanKeyBoardParentStackView(){
        
        let pStackView = Controls().theParentStackView(buttons: [makeRTGSPanRowOneStackView(), makeRTGSPanRowTwoStackView(), makeRTGSPanRowThreeStackView(), makeRTGSPanRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 1
        RTGSPanView.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: RTGSPanKeyboardContainer.leftAnchor).isActive = true
        pStackView.rightAnchor.constraint(equalTo: RTGSPanKeyboardContainer.rightAnchor).isActive = true
        pStackView.topAnchor.constraint(equalTo: RTGSPanKeyboardContainer.topAnchor).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: RTGSPanKeyboardContainer.bottomAnchor).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET BILL PAYMENTS ZIMSWITCH PAN VIEW CONSTRAINTS
    //----------------------------------------------------------------
    
    func setupRTGSPaymentsZimSwitchPan(){
        
        RTGSPanView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        RTGSPanView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        RTGSPanView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        RTGSPanView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    
    
}

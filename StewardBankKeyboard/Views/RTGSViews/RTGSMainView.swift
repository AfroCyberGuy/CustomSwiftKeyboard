//
//  RTGSMainView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/8/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit

extension KeyboardViewController{
    
    
    func makeRTGSMainView(){
        
        view.addSubview(RTGSMainViewView)
        RTGSMainViewView.layer.cornerRadius = 0
        RTGSMainViewView.backgroundColor = Theme.WhitePrimary
        RTGSMainViewView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        RTGSMainViewView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        RTGSMainViewView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        RTGSMainViewView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        makeRTGSMainViewTopView()
        makeRTGSKeyboardView()
        
    }
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS TOP VIEW
    //----------------------------------------------------------------
    
    func makeRTGSMainViewTopView(){
        
        RTGSMainViewTopView.backgroundColor = Theme.LighterGray
        RTGSMainViewView.addSubview(RTGSMainViewTopView)
        RTGSMainViewTopView.topAnchor.constraint(equalTo: RTGSMainViewView.topAnchor, constant: 3.0).isActive = true
        RTGSMainViewTopView.leftAnchor.constraint(equalTo: RTGSMainViewView.leftAnchor, constant: 0).isActive = true
        RTGSMainViewTopView.rightAnchor.constraint(equalTo: RTGSMainViewView.rightAnchor, constant: 0).isActive = true
        RTGSMainViewTopView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        makeRTGSMainViewBackButton()
        makeRTGSMainViewRightButton()
       makeRTGSTopContainerTextField()
        makeRTGSBankNameLabel()
        makeRTGSBankListView()
        
    }
    
    //----------------------------------------------------------------
    
    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS VIEW BACK BUTTON VIEW
    //-----------------------------------------------------------------
    
    func makeRTGSMainViewBackButton(){
        
        RTGSMainViewBackBtn.layer.cornerRadius = 15
        RTGSMainViewTopView.addSubview(RTGSMainViewBackBtn)
        //        billpaymentsMainViewBackBtnPressed()
        
        
        RTGSMainViewBackBtn.addTarget(self, action: #selector(RTGSMainViewBackBtnPressed), for: .touchUpInside)
        
        RTGSMainViewBackBtn.topAnchor.constraint(equalTo: RTGSMainViewTopView.topAnchor, constant: 10).isActive = true
        RTGSMainViewBackBtn.leftAnchor.constraint(equalTo: RTGSMainViewTopView.leftAnchor, constant: 8).isActive = true
        RTGSMainViewBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        RTGSMainViewBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS MAIN BACK BTN CLIICKED
    //----------------------------------------------------------------
    @objc func RTGSMainViewBackBtnPressed(){
        
        RTGSMainViewView.removeFromSuperview()
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS RIGHT BUTTON VIEW
    //----------------------------------------------------------------
    
    func makeRTGSMainViewRightButton(){
        
        RTGSMainViewRightBtn.layer.cornerRadius = 15
        RTGSMainViewTopView.addSubview(RTGSMainViewRightBtn)
        //        billpaymentsViewRightButtonPressed()
        
        RTGSMainViewRightBtn.addTarget(self, action: #selector(RTGSMainViewRightBtnPressed), for: .touchUpInside)
        
        RTGSMainViewRightBtn.topAnchor.constraint(equalTo: RTGSMainViewTopView.topAnchor, constant: 10).isActive = true
        RTGSMainViewRightBtn.rightAnchor.constraint(equalTo: RTGSMainViewTopView.rightAnchor, constant: -8).isActive = true
        RTGSMainViewRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        RTGSMainViewRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS MAIN RIGHT BTN CLIICKED
    //----------------------------------------------------------------
    @objc func RTGSMainViewRightBtnPressed(){
        
        makeRTGSAmountView()
        
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeRTGSTopContainerTextField(){
        
        RTGSMainViewTopView.addSubview(RTGSMainViewAccountTextField)
        RTGSMainViewAccountTextField.textAlignment = .left
        RTGSMainViewAccountTextField.backgroundColor = UIColor.white
        RTGSMainViewAccountTextField.layer.cornerRadius = 5
        RTGSMainViewAccountTextField.layer.masksToBounds = true
        RTGSMainViewAccountTextField.textColor = UIColor.gray
        
        RTGSMainViewAccountTextField.centerYAnchor.constraint(equalTo: RTGSMainViewRightBtn.centerYAnchor).isActive = true
        RTGSMainViewAccountTextField.leftAnchor.constraint(equalTo: RTGSMainViewBackBtn.rightAnchor, constant: 30).isActive = true
        RTGSMainViewAccountTextField.rightAnchor.constraint(equalTo: RTGSMainViewRightBtn.leftAnchor, constant: -30).isActive = true
        RTGSMainViewAccountTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS MAIN VIEW BANK NAME LABEL
    //----------------------------------------------------------------
    
    func makeRTGSBankNameLabel(){
        
        
        RTGSMainViewTopView.addSubview(RTGSMainBankNameLabel)
        RTGSMainBankNameLabel.textAlignment = .left
        RTGSMainBankNameLabel.layer.cornerRadius = 5
        RTGSMainBankNameLabel.layer.masksToBounds = true
        RTGSMainBankNameLabel.textColor = Theme.PrimaryPurple
        
        RTGSMainBankNameLabel.topAnchor.constraint(equalTo: RTGSMainViewAccountTextField.bottomAnchor, constant: 8).isActive = true
        RTGSMainBankNameLabel.leftAnchor.constraint(equalTo: RTGSMainViewAccountTextField.leftAnchor, constant: 0).isActive = true
        
        
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS MAKE BANK LIST VIEW
    //----------------------------------------------------------------
    
    func makeRTGSBankListView(){
        
        RTGSMainViewTopView.addSubview(RTGSMainBanksList)
        
        RTGSMainBanksList.topAnchor.constraint(equalTo: RTGSMainBankNameLabel.bottomAnchor, constant: 5).isActive = true
        RTGSMainBanksList.leftAnchor.constraint(equalTo:   RTGSMainViewTopView.leftAnchor, constant: 0).isActive = true
        RTGSMainBanksList.rightAnchor.constraint(equalTo:  RTGSMainViewTopView.rightAnchor, constant: 0).isActive = true
        RTGSMainBanksList.bottomAnchor.constraint(equalTo: RTGSMainViewTopView.bottomAnchor, constant: 0).isActive = true
        
    }
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS MAKE KEYBOARD VIEW
    //----------------------------------------------------------------
    
    func makeRTGSKeyboardView(){
        
        
        RTGSMainViewView.addSubview(RTGSMainViewKeyboardContainer)
        RTGSMainViewKeyboardContainer.backgroundColor = Theme.LighterGray
        
        RTGSMainViewKeyboardContainer.topAnchor.constraint(equalTo: RTGSMainViewTopView.bottomAnchor, constant: 3).isActive = true
        RTGSMainViewKeyboardContainer.leftAnchor.constraint(equalTo: RTGSMainViewView.leftAnchor, constant: 3).isActive = true
        RTGSMainViewKeyboardContainer.rightAnchor.constraint(equalTo: RTGSMainViewView.rightAnchor, constant: -3).isActive = true
        RTGSMainViewKeyboardContainer.bottomAnchor.constraint(equalTo: RTGSMainViewView.bottomAnchor, constant: -3).isActive = true
        
        makeRTGSKeyBoardParentStackView()
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS MAIN VIEW KEYBOARD ROW ONE STACKVIEW
    //----------------------------------------------------------------
    
    func makeRTGSMainViewRowOneStackView() -> UIStackView {
        
        RTGSMainViewOneButton.layer.cornerRadius = 3
        RTGSMainViewOneButton.backgroundColor = UIColor.white
        RTGSMainViewOneButton.setTitleColor(UIColor.black, for: .normal)
        RTGSMainViewTwoButton.layer.cornerRadius = 3
        RTGSMainViewTwoButton.backgroundColor = UIColor.white
        RTGSMainViewTwoButton.setTitleColor(UIColor.black, for: .normal)
        RTGSMainViewThreeButton.layer.cornerRadius = 3
        RTGSMainViewThreeButton.backgroundColor = UIColor.white
        RTGSMainViewThreeButton.setTitleColor(UIColor.black, for: .normal)
        
        RTGSMainViewOneButton.addTarget(self, action: #selector(RTGSMainViewOneButtonPressed), for: .touchUpInside)
        RTGSMainViewTwoButton.addTarget(self, action: #selector(RTGSMainViewTwoButtonPressed), for: .touchUpInside)
        RTGSMainViewThreeButton.addTarget(self, action: #selector(RTGSMainViewThreeButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [RTGSMainViewOneButton, RTGSMainViewTwoButton, RTGSMainViewThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS MAIN ROW ONE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func RTGSMainViewOneButtonPressed(){
        
        numpadBtnPressed(button: RTGSMainViewOneButton, label: RTGSMainViewAccountTextField)
        
    }
    
    @objc func RTGSMainViewTwoButtonPressed(){
        
        numpadBtnPressed(button: RTGSMainViewTwoButton, label: RTGSMainViewAccountTextField)
        
    }
    
    @objc func RTGSMainViewThreeButtonPressed(){
        
        numpadBtnPressed(button: RTGSMainViewThreeButton, label: RTGSMainViewAccountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS MAIN VIEW KEYBOARD ROW TWO STACKVIEW
    //----------------------------------------------------------------
    
    func makeRTGSMainViewRowTwoStackView() -> UIStackView {
        
        RTGSMainViewFourButton.layer.cornerRadius = 3
        RTGSMainViewFourButton.backgroundColor = UIColor.white
        RTGSMainViewFourButton.setTitleColor(UIColor.black, for: .normal)
        RTGSMainViewFiveButton.layer.cornerRadius = 3
        RTGSMainViewFiveButton.backgroundColor = UIColor.white
        RTGSMainViewFiveButton.setTitleColor(UIColor.black, for: .normal)
        RTGSMainViewSixButton.layer.cornerRadius = 3
        RTGSMainViewSixButton.backgroundColor = UIColor.white
        RTGSMainViewSixButton.setTitleColor(UIColor.black, for: .normal)
        
        RTGSMainViewFourButton.addTarget(self, action: #selector(RTGSMainViewFourButtonPressed), for: .touchUpInside)
        RTGSMainViewFiveButton.addTarget(self, action: #selector(RTGSMainViewFiveButtonPressed), for: .touchUpInside)
        RTGSMainViewSixButton.addTarget(self, action: #selector(RTGSMainViewSixButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [RTGSMainViewFourButton, RTGSMainViewFiveButton, RTGSMainViewSixButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS MAIN ROW TWO BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func RTGSMainViewFourButtonPressed(){
        
        numpadBtnPressed(button: RTGSMainViewFourButton, label: RTGSMainViewAccountTextField)
        
    }
    
    @objc func RTGSMainViewFiveButtonPressed(){
        
        numpadBtnPressed(button: RTGSMainViewFiveButton, label: RTGSMainViewAccountTextField)
        
    }
    
    @objc func RTGSMainViewSixButtonPressed(){
        
        numpadBtnPressed(button: RTGSMainViewSixButton, label: RTGSMainViewAccountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------
    
    func makeRTGSMainViewRowThreeStackView() -> UIStackView {
        
        RTGSMainViewSevenButton.layer.cornerRadius = 3
        RTGSMainViewSevenButton.backgroundColor = UIColor.white
        RTGSMainViewSevenButton.setTitleColor(UIColor.black, for: .normal)
        RTGSMainViewEightButton.layer.cornerRadius = 3
        RTGSMainViewEightButton.backgroundColor = UIColor.white
        RTGSMainViewEightButton.setTitleColor(UIColor.black, for: .normal)
        RTGSMainViewNineButton.layer.cornerRadius = 3
        RTGSMainViewNineButton.backgroundColor = UIColor.white
        RTGSMainViewNineButton.setTitleColor(UIColor.black, for: .normal)
        
        RTGSMainViewSevenButton.addTarget(self, action: #selector(RTGSMainViewSevenButtonPressed), for: .touchUpInside)
        RTGSMainViewEightButton.addTarget(self, action: #selector(RTGSMainViewEightButtonPressed), for: .touchUpInside)
        RTGSMainViewNineButton.addTarget(self, action: #selector(RTGSMainViewNineButtonPressed), for: .touchUpInside)
        
        let hStackView = Controls().theHorizontalStackView(buttons: [RTGSMainViewSevenButton, RTGSMainViewEightButton, RTGSMainViewNineButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS MAIN ROW THREE BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func RTGSMainViewSevenButtonPressed(){
        
        numpadBtnPressed(button: RTGSMainViewSevenButton, label: RTGSMainViewAccountTextField)
        
    }
    
    @objc func RTGSMainViewEightButtonPressed(){
        
        numpadBtnPressed(button: RTGSMainViewEightButton, label: RTGSMainViewAccountTextField)
        
    }
    
    @objc func RTGSMainViewNineButtonPressed(){
        
        numpadBtnPressed(button: RTGSMainViewNineButton, label: RTGSMainViewAccountTextField)
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS MAIN VIEW KEYBOARD ROW FOUR STACKVIEW
    //----------------------------------------------------------------
    
    func makeRTGSMainViewRowFourStackView() -> UIStackView {
        
        RTGSMainViewZeroButton.layer.cornerRadius = 3
        RTGSMainViewZeroButton.backgroundColor = UIColor.white
        RTGSMainViewZeroButton.setTitleColor(UIColor.black, for: .normal)
        RTGSMainViewDeleteButton.layer.cornerRadius = 3
        RTGSMainViewDeleteButton.backgroundColor = UIColor.white
        RTGSMainViewDeleteButton.setTitleColor(UIColor.black, for: .normal)
        
        
        RTGSMainViewZeroButton.addTarget(self, action: #selector(RTGSViewZeroButtonPressed), for: .touchUpInside)
        RTGSMainViewDeleteButton.addTarget(self, action: #selector(RTGSMainViewDeleteButtonPressed), for: .touchUpInside)
        
        
        let hStackView = Controls().theHorizontalStackView(buttons: [RTGSMainViewZeroButton, RTGSMainViewDeleteButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6
        
        return hStackView
        
    }
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS MAIN ROW FOUR BUTTON ACTION METHODS
    //----------------------------------------------------------------
    
    @objc func RTGSViewZeroButtonPressed(){
        
        numpadBtnPressed(button: RTGSMainViewZeroButton, label: RTGSMainViewAccountTextField)
        
    }
    
    @objc func RTGSMainViewDeleteButtonPressed(){
        
        numpadClearBtnPressed(button: RTGSMainViewDeleteButton, label: RTGSMainViewAccountTextField)
        
    }
    
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS KEYBOARD PARENT STACKVIEW
    //----------------------------------------------------------------
    
    func makeRTGSKeyBoardParentStackView(){
        
        let pStackView = Controls().theParentStackView(buttons: [makeRTGSMainViewRowOneStackView(), makeRTGSMainViewRowTwoStackView(), makeRTGSMainViewRowThreeStackView(), makeRTGSMainViewRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 6
        RTGSMainViewKeyboardContainer.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: RTGSMainViewKeyboardContainer.leftAnchor, constant: 3).isActive = true
        pStackView.rightAnchor.constraint(equalTo: RTGSMainViewKeyboardContainer.rightAnchor, constant: -3).isActive = true
        pStackView.topAnchor.constraint(equalTo: RTGSMainViewKeyboardContainer.topAnchor, constant: 3).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: RTGSMainViewKeyboardContainer.bottomAnchor, constant: -3).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    
    
    
    
    
    
    
    
}

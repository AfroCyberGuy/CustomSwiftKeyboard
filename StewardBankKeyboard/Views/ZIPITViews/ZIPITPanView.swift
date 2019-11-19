//
//  ZIPITPanView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/7/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit


extension KeyboardViewController{
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT PAYMENTS ZIMSWITCH PAN VIEW
    //----------------------------------------------------------------
    
    func makeZIPITPaymentsZimSwitchPanView(){
        
        ZIPITPanView.backgroundColor = Theme.LighterGray
        ZIPITPanView.layer.cornerRadius = 0
        view.addSubview(ZIPITPanView)
        setupZIPIPaymentsZimSwitchPan()
        makeZIPITPanTopContainer()
        makeZIPITPanKeyboardViewContainer()
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT  PAN VIEW TOP CONTAINER
    //----------------------------------------------------------------

    func makeZIPITPanTopContainer(){

        ZIPITPanTopContainer.backgroundColor = Theme.LighterGray
        ZIPITPanTopContainer.layer.cornerRadius = 0
        ZIPITPanView.addSubview(ZIPITPanTopContainer)

        ZIPITPanTopContainer.topAnchor.constraint(equalTo: ZIPITPanView.topAnchor).isActive = true
        ZIPITPanTopContainer.leftAnchor.constraint(equalTo: ZIPITPanView.leftAnchor).isActive = true
        ZIPITPanTopContainer.rightAnchor.constraint(equalTo: ZIPITPanView.rightAnchor).isActive = true
        ZIPITPanTopContainer.heightAnchor.constraint(equalToConstant: 60.0).isActive = true


        makeZIPITPanTopContainerLabel()
        makeZIPITPanViewBackButton()
        makeZIPITPanViewRightButton()
        makeZIPITPanTopContainerTextField()

    }

    //----------------------------------------------------------------



    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT PAN TOP CONTAINER LABEL
    //----------------------------------------------------------------

    func makeZIPITPanTopContainerLabel(){

        ZIPITPanTopContainer.addSubview(ZIPITPanTopContainerLabel)
        ZIPITPanTopContainerLabel.textAlignment = .center

        ZIPITPanTopContainerLabel.topAnchor.constraint(equalTo: ZIPITPanTopContainer.topAnchor, constant: 3).isActive = true
        ZIPITPanTopContainerLabel.leftAnchor.constraint(equalTo: ZIPITPanTopContainer.leftAnchor, constant: 3).isActive = true
        ZIPITPanTopContainerLabel.rightAnchor.constraint(equalTo: ZIPITPanTopContainer.rightAnchor, constant: 3).isActive = true

    }

    //----------------------------------------------------------------


    //-----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT PAN VIEW BACK BUTTON VIEW
    //-----------------------------------------------------------------

    func makeZIPITPanViewBackButton(){

        ZIPITPanBackBtn.layer.cornerRadius = 15
        ZIPITPanTopContainer.addSubview(ZIPITPanBackBtn)


        ZIPITPanBackBtn.addTarget(self, action: #selector(ZIPITPanBackButtonPressed), for: .touchUpInside)

        ZIPITPanBackBtn.topAnchor.constraint(equalTo: ZIPITPanTopContainerLabel.bottomAnchor, constant: 2).isActive = true
        ZIPITPanBackBtn.leftAnchor.constraint(equalTo: ZIPITPanTopContainer.leftAnchor, constant: 8).isActive = true
        ZIPITPanBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        ZIPITPanBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    //----------------------------------------------------------------

    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS ZIMSWITCH BACK BUTTON PRESSED
    //----------------------------------------------------------------

    @objc func ZIPITPanBackButtonPressed(){

        ZIPITPanView.removeFromSuperview()

    }


    //----------------------------------------------------------------




    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT PAN VIEW RIGHT BUTTON VIEW
    //----------------------------------------------------------------

    func makeZIPITPanViewRightButton(){

        ZIPITPanRightBtn.layer.cornerRadius = 15
        ZIPITPanTopContainer.addSubview(ZIPITPanRightBtn)


        ZIPITPanRightBtn.addTarget(self, action: #selector(ZIPITPanRightBtnPressed), for: .touchUpInside)

        ZIPITPanRightBtn.topAnchor.constraint(equalTo: ZIPITPanTopContainerLabel.bottomAnchor, constant: 2).isActive = true
        ZIPITPanRightBtn.rightAnchor.constraint(equalTo: ZIPITPanTopContainer.rightAnchor, constant: -8).isActive = true
        ZIPITPanRightBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        ZIPITPanRightBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    //----------------------------------------------------------------

    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT PAN RIGHT BUTTON PRESSED
    //----------------------------------------------------------------

    @objc func ZIPITPanRightBtnPressed(){

        
        if ZIPITPanTextField.text?.isEmpty ?? true {
            
            showValidationView(message: "Please enter your full card number.")
            
        }else if ZIPITPanTextField.text!.count < 11 {
            
            showValidationView(message: "Please enter corrent card number.")
            
        }else {
            
            ZIPIT_CARD_NUMBER = ZIPITPanTextField.text!
            
            if isExpiryNeeded(cardNumber: ZIPIT_CARD_NUMBER){
                
                KeyboardSharedPreferences().setIsExpiry(isExpiry: "1")
                
                makeExpiryView()
                
            }else {
                
                print(ZIPIT_CARD_NUMBER)
                makeZIPITPinView()
                
            }
            
        }
        
       
        
    }


    //----------------------------------------------------------------


    




    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT PAN TOP CONTAINER TEXT FIELD
    //----------------------------------------------------------------

    func makeZIPITPanTopContainerTextField(){

        ZIPITPanTopContainer.addSubview(ZIPITPanTextField)
        ZIPITPanTextField.textAlignment = .center
        ZIPITPanTextField.backgroundColor = UIColor.white
        ZIPITPanTextField.layer.cornerRadius = 5
        ZIPITPanTextField.layer.masksToBounds = true
        ZIPITPanTextField.textColor = UIColor.gray

        ZIPITPanTextField.centerYAnchor.constraint(equalTo: ZIPITPanBackBtn.centerYAnchor).isActive = true
        ZIPITPanTextField.leftAnchor.constraint(equalTo: ZIPITPanBackBtn.rightAnchor, constant: 20).isActive = true
        ZIPITPanTextField.rightAnchor.constraint(equalTo: ZIPITPanRightBtn.leftAnchor, constant: -20).isActive = true
        ZIPITPanTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true

    }

    //----------------------------------------------------------------



    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT PAN VIEW KEYBOARD CONTAINER VIEW
    //----------------------------------------------------------------

    func makeZIPITPanKeyboardViewContainer(){

        ZIPITPanKeyboardContainer.backgroundColor = Theme.LighterGray
        ZIPITPanKeyboardContainer.layer.cornerRadius = 0
        ZIPITPanView.addSubview(ZIPITPanKeyboardContainer)

        ZIPITPanKeyboardContainer.topAnchor.constraint(equalTo: ZIPITPanTopContainer.bottomAnchor, constant: 6).isActive = true
        ZIPITPanKeyboardContainer.leftAnchor.constraint(equalTo: ZIPITPanView.leftAnchor, constant: 6).isActive = true
        ZIPITPanKeyboardContainer.rightAnchor.constraint(equalTo: ZIPITPanView.rightAnchor, constant: -6).isActive = true
        ZIPITPanKeyboardContainer.bottomAnchor.constraint(equalTo: ZIPITPanView.bottomAnchor, constant: -6).isActive = true

        makeZIPITPanKeyBoardParentStackView()

    }

    //----------------------------------------------------------------


    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT PAN VIEW KEYBOARD ROW ONE STACKVIEW
    //----------------------------------------------------------------

    func makeZIPITPanRowOneStackView() -> UIStackView {

        ZIPITPanOneButton.layer.cornerRadius = 3
        ZIPITPanOneButton.backgroundColor = UIColor.white
        ZIPITPanOneButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITPanTwoButton.layer.cornerRadius = 3
        ZIPITPanTwoButton.backgroundColor = UIColor.white
        ZIPITPanTwoButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITPanThreeButton.layer.cornerRadius = 3
        ZIPITPanThreeButton.backgroundColor = UIColor.white
        ZIPITPanThreeButton.setTitleColor(UIColor.black, for: .normal)

        ZIPITPanOneButton.addTarget(self, action: #selector(ZIPITPanOneButtonPressed), for: .touchUpInside)
        ZIPITPanTwoButton.addTarget(self, action: #selector(ZIPITPanTwoButtonPressed), for: .touchUpInside)
        ZIPITPanThreeButton.addTarget(self, action: #selector(ZIPITPanThreeButtonPressed), for: .touchUpInside)

        let hStackView = Controls().theHorizontalStackView(buttons: [ZIPITPanOneButton, ZIPITPanTwoButton, ZIPITPanThreeButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6

        return hStackView

    }

    //----------------------------------------------------------------

    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT  PAN ROW ONE BUTTON ACTION METHODS
    //----------------------------------------------------------------

    @objc func ZIPITPanOneButtonPressed(){

        numpadBtnPressed(button: ZIPITPanOneButton, label: ZIPITPanTextField)

    }

    @objc func ZIPITPanTwoButtonPressed(){

        numpadBtnPressed(button: ZIPITPanTwoButton, label: ZIPITPanTextField)

    }

    @objc func ZIPITPanThreeButtonPressed(){

        numpadBtnPressed(button: ZIPITPanThreeButton, label: ZIPITPanTextField)

    }

    //----------------------------------------------------------------



    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT PAN VIEW KEYBOARD ROW TWO STACKVIEW
    //----------------------------------------------------------------

    func makeZIPITPanRowTwoStackView() -> UIStackView {

        ZIPITPanFourButton.layer.cornerRadius = 3
        ZIPITPanFourButton.backgroundColor = UIColor.white
        ZIPITPanFourButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITPanFiveButton.layer.cornerRadius = 3
        ZIPITPanFiveButton.backgroundColor = UIColor.white
        ZIPITPanFiveButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITPanSixButton.layer.cornerRadius = 3
        ZIPITPanSixButton.backgroundColor = UIColor.white
        ZIPITPanSixButton.setTitleColor(UIColor.black, for: .normal)

        ZIPITPanFourButton.addTarget(self, action: #selector(ZIPITPanFourButtonPressed), for: .touchUpInside)
        ZIPITPanFiveButton.addTarget(self, action: #selector(ZIPITPanFiveButtonPressed), for: .touchUpInside)
        ZIPITPanSixButton.addTarget(self, action: #selector(ZIPITPanSixButtonPressed), for: .touchUpInside)


        let hStackView = Controls().theHorizontalStackView(buttons: [ZIPITPanFourButton, ZIPITPanFiveButton, ZIPITPanSixButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6

        return hStackView

    }


    //----------------------------------------------------------------


    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT ROW TWO BUTTON ACTION METHODS
    //----------------------------------------------------------------

    @objc func ZIPITPanFourButtonPressed(){

        numpadBtnPressed(button: ZIPITPanFourButton, label: ZIPITPanTextField)

    }

    @objc func ZIPITPanFiveButtonPressed(){

        numpadBtnPressed(button: ZIPITPanFiveButton, label: ZIPITPanTextField)

    }

    @objc func ZIPITPanSixButtonPressed(){

        numpadBtnPressed(button: ZIPITPanSixButton, label: ZIPITPanTextField)

    }

    //----------------------------------------------------------------



    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT PAN VIEW KEYBOARD ROW THREE STACKVIEW
    //----------------------------------------------------------------

    func makeZIPITPanRowThreeStackView() -> UIStackView {

        ZIPITPanSevenButton.layer.cornerRadius = 3
        ZIPITPanSevenButton.backgroundColor = UIColor.white
        ZIPITPanSevenButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITPanEightButton.layer.cornerRadius = 3
        ZIPITPanEightButton.backgroundColor = UIColor.white
        ZIPITPanEightButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITPanNineButton.layer.cornerRadius = 3
        ZIPITPanNineButton.backgroundColor = UIColor.white
        ZIPITPanNineButton.setTitleColor(UIColor.black, for: .normal)

        ZIPITPanSevenButton.addTarget(self, action: #selector(ZIPITPanSevenButtonPressed), for: .touchUpInside)
        ZIPITPanEightButton.addTarget(self, action: #selector(ZIPITPanEightButtonPressed), for: .touchUpInside)
        ZIPITPanNineButton.addTarget(self, action: #selector(ZIPITPanNineButtonPressed), for: .touchUpInside)


        let hStackView = Controls().theHorizontalStackView(buttons: [ZIPITPanSevenButton, ZIPITPanEightButton, ZIPITPanNineButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6

        return hStackView

    }


    //----------------------------------------------------------------


    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT PAN ROW THREE BUTTON ACTION METHODS
    //----------------------------------------------------------------

    @objc func ZIPITPanSevenButtonPressed(){

        numpadBtnPressed(button: ZIPITPanSevenButton, label: ZIPITPanTextField)

    }

    @objc func ZIPITPanEightButtonPressed(){

        numpadBtnPressed(button: ZIPITPanEightButton, label: ZIPITPanTextField)

    }

    @objc func ZIPITPanNineButtonPressed(){

        numpadBtnPressed(button: ZIPITPanNineButton, label: ZIPITPanTextField)

    }

    //----------------------------------------------------------------


    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT PAN VIEW KEYBOARD ROW FOUR STACKVIEW
    //----------------------------------------------------------------

    func makeZIPITPanRowFourStackView() -> UIStackView {

        ZIPITPanZeroButton.layer.cornerRadius = 3
        ZIPITPanZeroButton.backgroundColor = UIColor.white
        ZIPITPanZeroButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITPanDecimalButton.layer.cornerRadius = 3
        ZIPITPanDecimalButton.backgroundColor = UIColor.white
        ZIPITPanDecimalButton.setTitleColor(UIColor.black, for: .normal)
        ZIPITPanDeleteButton.layer.cornerRadius = 3
        ZIPITPanDeleteButton.backgroundColor = UIColor.white
        ZIPITPanDeleteButton.setTitleColor(UIColor.black, for: .normal)

        ZIPITPanZeroButton.addTarget(self, action: #selector(ZIPITPanZeroButtonPressed), for: .touchUpInside)
        ZIPITPanDecimalButton.addTarget(self, action: #selector(ZIPITPanDecimalButtonPressed), for: .touchUpInside)
        ZIPITPanDeleteButton.addTarget(self, action: #selector(ZIPITPanDeleteButtonPressed), for: .touchUpInside)


        let hStackView = Controls().theHorizontalStackView(buttons: [ZIPITPanZeroButton, ZIPITPanDecimalButton, ZIPITPanDeleteButton])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 6

        return hStackView

    }


    //----------------------------------------------------------------


    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT ROW FOUR BUTTON ACTION METHODS
    //----------------------------------------------------------------

    @objc func ZIPITPanZeroButtonPressed(){

        numpadBtnPressed(button: ZIPITPanZeroButton, label: ZIPITPanTextField)

    }

    @objc func ZIPITPanDecimalButtonPressed(){

        numpadBtnPressed(button: ZIPITPanDecimalButton, label: ZIPITPanTextField)

    }

    @objc func ZIPITPanDeleteButtonPressed(){

        numpadClearBtnPressed(button: ZIPITPanDeleteButton, label: ZIPITPanTextField)

    }

    //----------------------------------------------------------------


    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT PAN KEYBOARD PARENT STACKVIEW
    //----------------------------------------------------------------

    func makeZIPITPanKeyBoardParentStackView(){

        let pStackView = Controls().theParentStackView(buttons: [makeZIPITPanRowOneStackView(), makeZIPITPanRowTwoStackView(), makeZIPITPanRowThreeStackView(), makeZIPITPanRowFourStackView()])
        pStackView.axis = .vertical
        pStackView.distribution = .fillEqually
        pStackView.spacing = 6
        ZIPITPanView.addSubview(pStackView)
        pStackView.leftAnchor.constraint(equalTo: ZIPITPanKeyboardContainer.leftAnchor).isActive = true
        pStackView.rightAnchor.constraint(equalTo: ZIPITPanKeyboardContainer.rightAnchor).isActive = true
        pStackView.topAnchor.constraint(equalTo: ZIPITPanKeyboardContainer.topAnchor).isActive = true
        pStackView.bottomAnchor.constraint(equalTo: ZIPITPanKeyboardContainer.bottomAnchor).isActive = true

    }

    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET BILL PAYMENTS ZIMSWITCH PAN VIEW CONSTRAINTS
    //----------------------------------------------------------------
    
    func setupZIPIPaymentsZimSwitchPan(){
        
        ZIPITPanView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        ZIPITPanView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        ZIPITPanView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        ZIPITPanView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    //----------------------------------------------------------------
}

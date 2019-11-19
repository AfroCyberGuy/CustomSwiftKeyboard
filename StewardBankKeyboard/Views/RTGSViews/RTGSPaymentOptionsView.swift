//
//  RTGSPaymentOptionsView.swift
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
    // MARK:- MAKE RTGS PAYMENT OPTIONS VIEW.
    //----------------------------------------------------------------
    
    func makeRTGSPaymentsOptionsView(){
        
        
        RTGSPaymentOptionsView.backgroundColor = UIColor.lightGray
        RTGSPaymentOptionsView.layer.cornerRadius = 0
        view.addSubview(RTGSPaymentOptionsView)
        setupRTGSPaymentsOptionsConstraints()
        
        makeRTGSPaymentsOptionBackBtn()
        makeRTGSPaymentsOptionLabel()
        makeRTGSPaymentsOptionContainerView()
        makeRTGSPaymentOptionsRowOneStackView()
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS PAYMENTS OPTIONS LABEL
    //----------------------------------------------------------------
    
    
    func makeRTGSPaymentsOptionLabel(){
        
        RTGSPaymentOptionsView.addSubview(RTGSPaymentsOptionLabel)
        RTGSPaymentsOptionLabel.textAlignment = .center
        
        
        RTGSPaymentsOptionLabel.centerYAnchor.constraint(equalTo: RTGSPaymentsOptionBackBtn.centerYAnchor).isActive = true
        RTGSPaymentsOptionLabel.leftAnchor.constraint(equalTo: RTGSPaymentsOptionBackBtn.leftAnchor, constant: 3).isActive = true
        RTGSPaymentsOptionLabel.rightAnchor.constraint(equalTo: RTGSPaymentOptionsView.rightAnchor, constant: 3).isActive = true
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS PAYMENTS OPTIONS BACK BUTTON
    //----------------------------------------------------------------
    
    func makeRTGSPaymentsOptionBackBtn(){
        
        RTGSPaymentOptionsView.addSubview(RTGSPaymentsOptionBackBtn)
        RTGSPaymentsOptionBackBtn.layer.cornerRadius = 15
        
        
        RTGSPaymentsOptionBackBtn.addTarget(self, action: #selector(RTGSPaymentsOptionBackBtnPressed), for: .touchUpInside)
        
        RTGSPaymentsOptionBackBtn.topAnchor.constraint(equalTo: RTGSPaymentOptionsView.topAnchor, constant: 20).isActive = true
        RTGSPaymentsOptionBackBtn.leftAnchor.constraint(equalTo: RTGSPaymentOptionsView.leftAnchor, constant: 20).isActive = true
        RTGSPaymentsOptionBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        RTGSPaymentsOptionBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS PAYMENTS BACK BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func RTGSPaymentsOptionBackBtnPressed(){
        
        RTGSPaymentOptionsView.removeFromSuperview()
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS PAYMENT OPTIONS CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeRTGSPaymentsOptionContainerView(){
        
        RTGSPaymentOptionsView.addSubview(RTGSPaymentOptionContainerView)
        RTGSPaymentOptionContainerView.backgroundColor = UIColor.red
        
        RTGSPaymentOptionContainerView.topAnchor.constraint(equalTo: RTGSPaymentsOptionLabel.bottomAnchor, constant: 20).isActive = true
        RTGSPaymentOptionContainerView.rightAnchor.constraint(equalTo: RTGSPaymentOptionsView.rightAnchor, constant: -20).isActive = true
        RTGSPaymentOptionContainerView.leftAnchor.constraint(equalTo: RTGSPaymentOptionsView.leftAnchor, constant: 20).isActive = true
        RTGSPaymentOptionContainerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE RTGS PAYMENT OPTIONS STACK VIEW
    //----------------------------------------------------------------
    
    func makeRTGSPaymentOptionsRowOneStackView() {
        
        //        airtimePaymentsOptionsStewardImgView.contentMode = .scaleAspectFit
        //        airtimePaymentOptionsEcocashImgView.contentMode = .scaleAspectFit
        
        let hstackView = Controls().theHorizontalImageViewStackView(imageViews: [RTGSPaymentOptionsEcocash, RTGSPaymentOptionsStewardBank, RTGSPaymentOptionsZimSwitch])
        hstackView.axis = .horizontal
        hstackView.distribution = .fillEqually
        hstackView.spacing = 5
        
        RTGSPaymentOptionContainerView.addSubview(hstackView)
        hstackView.topAnchor.constraint(equalTo: RTGSPaymentOptionContainerView.topAnchor, constant: 3).isActive = true
        hstackView.leftAnchor.constraint(equalTo: RTGSPaymentOptionContainerView.leftAnchor, constant: 3).isActive = true
        hstackView.rightAnchor.constraint(equalTo: RTGSPaymentOptionContainerView.rightAnchor, constant: -3).isActive = true
        hstackView.bottomAnchor.constraint(equalTo: RTGSPaymentOptionContainerView.bottomAnchor, constant: -3).isActive = true
        
        RTGSPaymentEcocashClicked()
        RTGSPaymentStewardClicked()
        RTGSPaymentZimswitchClicked()
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS ECOCASH CLICKED
    //----------------------------------------------------------------
    
    func RTGSPaymentEcocashClicked(){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.RTGSPaymentEcocashPressed(_:)))
        RTGSPaymentOptionsEcocash.isUserInteractionEnabled = true
        RTGSPaymentOptionsEcocash.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func RTGSPaymentEcocashPressed(_ sender: AnyObject){
        
        makeRTGSPaymentsZimSwitchPanView()
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS STEWARD BANK CLICKED
    //----------------------------------------------------------------
    
    func RTGSPaymentStewardClicked(){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.RTGSPaymentStewardPressed(_:)))
        RTGSPaymentOptionsStewardBank.isUserInteractionEnabled = true
        RTGSPaymentOptionsStewardBank.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func RTGSPaymentStewardPressed(_ sender: AnyObject){
        
        makeRTGSPaymentsZimSwitchPanView()
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS ZIMSWITCH BANK CLICKED
    //----------------------------------------------------------------
    
    func RTGSPaymentZimswitchClicked(){
       
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.RTGSPaymentZimswitchPressed(_:)))
        RTGSPaymentOptionsZimSwitch.isUserInteractionEnabled = true
        RTGSPaymentOptionsZimSwitch.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func RTGSPaymentZimswitchPressed(_ sender: AnyObject){
        
        makeRTGSPaymentsZimSwitchPanView()
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET UP RTGS PAYMENT OPTIONS
    //----------------------------------------------------------------
    
    func setupRTGSPaymentsOptionsConstraints(){
        
        RTGSPaymentOptionsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        RTGSPaymentOptionsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        RTGSPaymentOptionsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        RTGSPaymentOptionsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
}


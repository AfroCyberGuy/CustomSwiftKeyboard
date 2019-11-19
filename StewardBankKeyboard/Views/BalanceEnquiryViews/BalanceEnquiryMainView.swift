//
//  BalanceEnquiryMainView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/16/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit


extension KeyboardViewController{
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY MAIN VIEW.
    //----------------------------------------------------------------
    
    func makeBalanceEquiryMainView(){
        
        
        balanceEquiryMainViewView.backgroundColor = UIColor.lightGray
        balanceEquiryMainViewView.layer.cornerRadius = 0
        view.addSubview(balanceEquiryMainViewView)
        setupBalanceMainViewConstraints()
        makeBalanceEnquiryMainViewBackBtn()
        makeBalanceEnquiryMainViewLabel()
        makeBalanceEnquiryMainViewContainerView()
        makeBalanceEnquiryRowOneStackView()
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY LABEL
    //----------------------------------------------------------------
    
    
    func makeBalanceEnquiryMainViewLabel(){
        
        balanceEquiryMainViewView.addSubview(balanceEquiryMainViewLabel)
        balanceEquiryMainViewLabel.textAlignment = .center
        
        
        balanceEquiryMainViewLabel.centerYAnchor.constraint(equalTo: balanceEquiryMainViewBackBtn.centerYAnchor).isActive = true
        balanceEquiryMainViewLabel.leftAnchor.constraint(equalTo: balanceEquiryMainViewBackBtn.leftAnchor, constant: 3).isActive = true
        balanceEquiryMainViewLabel.rightAnchor.constraint(equalTo: balanceEquiryMainViewView.rightAnchor, constant: 3).isActive = true
    
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BALANCE ENQUIRY BACK BUTTON
    //----------------------------------------------------------------
    
    func makeBalanceEnquiryMainViewBackBtn(){
        
        balanceEquiryMainViewView.addSubview(balanceEquiryMainViewBackBtn)
        balanceEquiryMainViewBackBtn.layer.cornerRadius = 15
        
        
        balanceEquiryMainViewBackBtn.addTarget(self, action: #selector(balanceEquiryBackBtnPressed), for: .touchUpInside)
        
        balanceEquiryMainViewBackBtn.topAnchor.constraint(equalTo: balanceEquiryMainViewView.topAnchor, constant: 20).isActive = true
        balanceEquiryMainViewBackBtn.leftAnchor.constraint(equalTo: balanceEquiryMainViewView.leftAnchor, constant: 20).isActive = true
        balanceEquiryMainViewBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        balanceEquiryMainViewBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BALANCE ENQUIRY MAIN VIEW BACK BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func balanceEquiryBackBtnPressed(){
        
        balanceEquiryMainViewView.removeFromSuperview()
        
    }
    
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BALANCE ENQUIRY MAIN VIEW CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeBalanceEnquiryMainViewContainerView(){
        
        balanceEquiryMainViewView.addSubview(balanceEquiryMainViewContainerView)
        balanceEquiryMainViewContainerView.backgroundColor = UIColor.lightGray
        
        balanceEquiryMainViewContainerView.topAnchor.constraint(equalTo: balanceEquiryMainViewLabel.bottomAnchor, constant: 20).isActive = true
        balanceEquiryMainViewContainerView.rightAnchor.constraint(equalTo: balanceEquiryMainViewView.rightAnchor, constant: -20).isActive = true
        balanceEquiryMainViewContainerView.leftAnchor.constraint(equalTo: balanceEquiryMainViewView.leftAnchor, constant: 20).isActive = true
        balanceEquiryMainViewContainerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE BALANCE ENQUIRY STACK VIEW
    //----------------------------------------------------------------
    
    func makeBalanceEnquiryRowOneStackView() {
        
        //        airtimePaymentsOptionsStewardImgView.contentMode = .scaleAspectFit
        //        airtimePaymentOptionsEcocashImgView.contentMode = .scaleAspectFit
        
        let hstackView = Controls().theHorizontalImageViewStackView(imageViews: [balanceEquiryMainViewEcocash, balanceEquiryMainViewStewardBank, balanceEquiryMainViewZimSwitch])
        hstackView.axis = .horizontal
        hstackView.distribution = .fillEqually
        hstackView.spacing = 5
        
        balanceEquiryMainViewContainerView.addSubview(hstackView)
        hstackView.topAnchor.constraint(equalTo: balanceEquiryMainViewContainerView.topAnchor, constant: 3).isActive = true
        hstackView.leftAnchor.constraint(equalTo: balanceEquiryMainViewContainerView.leftAnchor, constant: 3).isActive = true
        hstackView.rightAnchor.constraint(equalTo: balanceEquiryMainViewContainerView.rightAnchor, constant: -3).isActive = true
        hstackView.bottomAnchor.constraint(equalTo: balanceEquiryMainViewContainerView.bottomAnchor, constant: -3).isActive = true
        
        balanceEnquiryEcocashClicked()
        balanceEnquiryStewardClicked()
        balanceEnquiryZimswitchClicked()
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BALANCE ENQUIRY ECOCASH CLICKED
    //----------------------------------------------------------------
    
    func balanceEnquiryEcocashClicked(){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.balanceEnquiryEcocashPressed(_:)))
        balanceEquiryMainViewEcocash.isUserInteractionEnabled = true
        balanceEquiryMainViewEcocash.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func balanceEnquiryEcocashPressed(_ sender: AnyObject){
        
//        makeBillPaymentsZimSwitchPanView()
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BALANCE ENQUIRY STEWARD BANK CLICKED
    //----------------------------------------------------------------
    
    func balanceEnquiryStewardClicked(){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.balanceEnquiryStewardPressed(_:)))
        balanceEquiryMainViewStewardBank.isUserInteractionEnabled = true
        balanceEquiryMainViewStewardBank.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func balanceEnquiryStewardPressed(_ sender: AnyObject){
        
//        makeBillPaymentsZimSwitchPanView()
        
        makebalanceEquirySBPinView()
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BALANCE ENQUIRY ZIMSWITCH BANK CLICKED
    //----------------------------------------------------------------
    
    func balanceEnquiryZimswitchClicked(){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.balanceEnquiryZimswitchPressed(_:)))
        balanceEquiryMainViewZimSwitch.isUserInteractionEnabled = true
        balanceEquiryMainViewZimSwitch.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func balanceEnquiryZimswitchPressed(_ sender: AnyObject){
        
        makeBalanceEnquiryZSPanView()
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET UP BALANCE ENQUIRY PAYMENT OPTIONS
    //----------------------------------------------------------------
    
    func setupBalanceMainViewConstraints(){
        
        balanceEquiryMainViewView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        balanceEquiryMainViewView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        balanceEquiryMainViewView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        balanceEquiryMainViewView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    
    
    
    
}

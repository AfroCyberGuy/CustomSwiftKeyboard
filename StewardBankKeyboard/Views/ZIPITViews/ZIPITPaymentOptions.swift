//
//  ZIPITPaymentOptions.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/7/18.
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
    // MARK:- MAKE ZIPIT PAYMENT OPTIONS VIEW.
    //----------------------------------------------------------------
    
    func makeZIPITPaymentsOptionsView(){
        
        
        ZIPITPaymentOptionsView.backgroundColor = UIColor.lightGray
        ZIPITPaymentOptionsView.layer.cornerRadius = 0
        view.addSubview(ZIPITPaymentOptionsView)
        setupZIPITPaymentsOptionsConstraints()

        makeZIPITPaymentsOptionBackBtn()
        makeZIPITPaymentsOptionLabel()
        makeZIPITPaymentsOptionContainerView()
        makeZIPITPaymentOptionsRowOneStackView()
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT PAYMENTS OPTIONS LABEL
    //----------------------------------------------------------------
    
    
    func makeZIPITPaymentsOptionLabel(){
        
        ZIPITPaymentOptionsView.addSubview(ZIPITPaymentsOptionLabel)
        ZIPITPaymentsOptionLabel.textAlignment = .center
        
        
        ZIPITPaymentsOptionLabel.centerYAnchor.constraint(equalTo: ZIPITPaymentsOptionBackBtn.centerYAnchor).isActive = true
        ZIPITPaymentsOptionLabel.leftAnchor.constraint(equalTo: ZIPITPaymentsOptionBackBtn.leftAnchor, constant: 3).isActive = true
        ZIPITPaymentsOptionLabel.rightAnchor.constraint(equalTo: ZIPITPaymentOptionsView.rightAnchor, constant: 3).isActive = true
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT PAYMENTS OPTIONS BACK BUTTON
    //----------------------------------------------------------------
    
    func makeZIPITPaymentsOptionBackBtn(){
        
        ZIPITPaymentOptionsView.addSubview(ZIPITPaymentsOptionBackBtn)
        ZIPITPaymentsOptionBackBtn.layer.cornerRadius = 15
        
        
        ZIPITPaymentsOptionBackBtn.addTarget(self, action: #selector(ZIPITPaymentsOptionBackBtnPressed), for: .touchUpInside)
        
        ZIPITPaymentsOptionBackBtn.topAnchor.constraint(equalTo: ZIPITPaymentOptionsView.topAnchor, constant: 20).isActive = true
        ZIPITPaymentsOptionBackBtn.leftAnchor.constraint(equalTo: ZIPITPaymentOptionsView.leftAnchor, constant: 20).isActive = true
        ZIPITPaymentsOptionBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        ZIPITPaymentsOptionBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT PAYMENTS BACK BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func ZIPITPaymentsOptionBackBtnPressed(){
        
        ZIPITPaymentOptionsView.removeFromSuperview()
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT PAYMENT OPTIONS CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeZIPITPaymentsOptionContainerView(){
        
        ZIPITPaymentOptionsView.addSubview(ZIPITPaymentOptionContainerView)
        ZIPITPaymentOptionContainerView.layer.cornerRadius = 3
        ZIPITPaymentOptionContainerView.backgroundColor = UIColor.white
        ZIPITPaymentOptionContainerView.layer.shadowColor = UIColor.black.cgColor
        ZIPITPaymentOptionContainerView.layer.shadowOpacity = 0.4
        ZIPITPaymentOptionContainerView.layer.shadowOffset =  CGSize(width: -1, height: 1)
        ZIPITPaymentOptionContainerView.layer.shadowRadius = 1
        
        
        ZIPITPaymentOptionContainerView.topAnchor.constraint(equalTo: ZIPITPaymentsOptionLabel.bottomAnchor, constant: 20).isActive = true
        ZIPITPaymentOptionContainerView.rightAnchor.constraint(equalTo: ZIPITPaymentOptionsView.rightAnchor, constant: -20).isActive = true
        ZIPITPaymentOptionContainerView.leftAnchor.constraint(equalTo: ZIPITPaymentOptionsView.leftAnchor, constant: 20).isActive = true
        ZIPITPaymentOptionContainerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ZIPIT PAYMENT OPTIONS STACK VIEW
    //----------------------------------------------------------------
    
    func makeZIPITPaymentOptionsRowOneStackView() {
        
        //        airtimePaymentsOptionsStewardImgView.contentMode = .scaleAspectFit
        //        airtimePaymentOptionsEcocashImgView.contentMode = .scaleAspectFit
        
        ZIPITPaymentOptionsEcocash.contentMode = .scaleAspectFit
        ZIPITPaymentOptionsStewardBank.contentMode = .scaleAspectFit
        ZIPITPaymentOptionsZimSwitch.contentMode = .scaleAspectFit
        
        
        
        let hstackView = Controls().theHorizontalImageViewStackView(imageViews: [ZIPITPaymentOptionsEcocash, ZIPITPaymentOptionsStewardBank, ZIPITPaymentOptionsZimSwitch])
        hstackView.axis = .horizontal
        hstackView.distribution = .fillEqually
        hstackView.spacing = 5
        
        ZIPITPaymentOptionContainerView.addSubview(hstackView)
        hstackView.topAnchor.constraint(equalTo: ZIPITPaymentOptionContainerView.topAnchor, constant: 3).isActive = true
        hstackView.leftAnchor.constraint(equalTo: ZIPITPaymentOptionContainerView.leftAnchor, constant: 3).isActive = true
        hstackView.rightAnchor.constraint(equalTo: ZIPITPaymentOptionContainerView.rightAnchor, constant: -3).isActive = true
        hstackView.bottomAnchor.constraint(equalTo: ZIPITPaymentOptionContainerView.bottomAnchor, constant: -3).isActive = true
        
        ZIPITPaymentEcocashClicked()
        ZIPITPaymentStewardClicked()
        ZIPITPaymentZimswitchClicked()
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT ECOCASH CLICKED
    //----------------------------------------------------------------
    
    func ZIPITPaymentEcocashClicked(){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.ZIPITPaymentEcocashPressed(_:)))
        ZIPITPaymentOptionsEcocash.isUserInteractionEnabled = true
        ZIPITPaymentOptionsEcocash.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func ZIPITPaymentEcocashPressed(_ sender: AnyObject){
        
        
        GLOBAL_ECOCASH_PAYMENT_OPTION = "1"
        
        print("GLOBAL_ECOCASH_PAYMENT_OPTION: \(GLOBAL_ECOCASH_PAYMENT_OPTION)")
    
    let url = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/ecocashcontainer/secured/ecocash/pay"
        
        print("ZIPIT AMOUNT: \(ZIPIT_AMOUNT)")
        
        print("PHONE: \(SharedPreference.getEcocashEcocashPhone()!)")
        print("BILL ACCOUNT: \(KeyboardSharedPreferences().getEcocashBankDestinationAccount()!)")
        
        
        
        let parameters = Mapper().toJSON(EcocashPayPostModel(amount: KeyboardSharedPreferences().getZIPITAmount()!, channel: Channel.transactionChannel(), biller: "ZIPIT", phone: SharedPreference.getEcocashEcocashPhone()!))
        
        
        ecocashZipitPay(url: url, parameters: parameters)
    }
    
    
    //----------------------------------------------------------------
    
    

    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT STEWARD BANK CLICKED
    //----------------------------------------------------------------
    
    func ZIPITPaymentStewardClicked(){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.ZIPITPaymentStewardPressed(_:)))
        ZIPITPaymentOptionsStewardBank.isUserInteractionEnabled = true
        ZIPITPaymentOptionsStewardBank.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func ZIPITPaymentStewardPressed(_ sender: AnyObject){

        GLOBAL_SQUARE_PAYMENT_OPTION = "1"
        KeyboardSharedPreferences().setSquareZIPITTransferOption(squareZIPITTransfer: "1")
        KeyboardSharedPreferences().setAirtimeZimswitchPurchase(airtimezimswitch: "0")
        
        makeZIPITPinView()
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT ZIMSWITCH BANK CLICKED
    //----------------------------------------------------------------
    
    func ZIPITPaymentZimswitchClicked(){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.ZIPITPaymentZimswitchPressed(_:)))
        ZIPITPaymentOptionsZimSwitch.isUserInteractionEnabled = true
        ZIPITPaymentOptionsZimSwitch.addGestureRecognizer(tapGestureRecognizer)
        
       
        
    }
    
    @objc func ZIPITPaymentZimswitchPressed(_ sender: AnyObject){
        GLOBAL_ZIMSWITCH_PAYMENT_OPTION = "1"
        AIRTIME_ZIMSWITCH_OPTION  = "0"
//        KeyboardSharedPreferences().getAirtimeZimswitchPurchase()
        KeyboardSharedPreferences().setAirtimeZimswitchPurchase(airtimezimswitch: "0")
        KeyboardSharedPreferences().setAirtimeEcocashPaymentStatus(ecocashPaymentStatus: "0")
        makeZIPITPaymentsZimSwitchPanView()
    }
    
    
    //----------------------------------------------------------------
    
    
    

    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET UP ZIPIT PAYMENT OPTIONS
    //----------------------------------------------------------------
    
    func setupZIPITPaymentsOptionsConstraints(){
        
        ZIPITPaymentOptionsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        ZIPITPaymentOptionsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        ZIPITPaymentOptionsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        ZIPITPaymentOptionsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ECOCASH ZIPIT PAY REQUEST METHOD
    //----------------------------------------------------------------
    
    
    func ecocashZipitPay(url: String, parameters: [String: Any]){
        
        print("ECOCASH PAY ZIPIT URL: \(url)")
        print("ECOCASH PAY ZIPIT PARAMETERS: \(parameters)")
        
        makeProgressParticleProgressBar(containingView: ZIPITPaymentOptionsView)
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: EcocashPayModel?, error) in
            
            if error != nil {
                
                
                print("ERROR")
                
                self.stopParticleProgressDialog(generalProgressLabel: "Error", generalProgressConfirmLabel: "An error ocurred", generalBtnVisibility: false)
                
            }else {
                
                
                if response!.message == "SUCCESS" {
                    
//                    self.ASSOCIATEDCODE = response!.responseBody!.associatedCode!
                    self.ECOCASHSTATUS = response!.responseBody!.ecocashStatus!
                    self.ID = response!.responseBody!.id!
                    self.STATUS = response!.responseBody!.status!
                    self.AMOUNT = response!.responseBody!.amount!
                    self.CORRELATER = response!.responseBody!.correlater!
                    self.REFERENCE = response!.responseBody!.reference!
                    self.ECOCASHREFERENCE = response!.responseBody!.ecocashReference!
                    self.PHONE = response!.responseBody!.phone!
                    
                    
                    KeyboardSharedPreferences().setEcocashPaymentParams(
                        amount: response!.responseBody!.amount!, associatedCode: "",
//                        associatedCode: response!.responseBody!.associatedCode!,
                        correlater: response!.responseBody!.correlater!,
                        reference: response!.responseBody!.reference!,
                        status: response!.responseBody!.status!,
                        ecocashReference: response!.responseBody!.ecocashReference!,
                        ecocashStatus: response!.responseBody!.ecocashStatus!,
                        phone: response!.responseBody!.phone!,
                        id: response!.responseBody!.id!)
                    
                    KeyboardSharedPreferences().setEcocashPaymentStatus(ecocashpaymentstatus: "1")
                    
                    self.stopParticleProgressDialog(generalProgressLabel: response!.message!, generalProgressConfirmLabel: "SUCCESS", generalBtnVisibility: false)
                    self.dismissParticleProgresssDialog()
                    
                    self.makeNumericKeyboardView()
                
                }else {
                    
                    print(response!.message!)
                    self.stopParticleProgressDialog(generalProgressLabel: response!.message!, generalProgressConfirmLabel: "FAILED", generalBtnVisibility: false)
                    
                }
                
                
                print(response!.toJSONString(prettyPrint: true)!)
                
            }
            
        }
        
    }
    

    //----------------------------------------------------------------
    
    
    
    
    
    
}

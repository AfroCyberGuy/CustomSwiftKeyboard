//
//  EcocashOnboardingViewController.swift
//  StewardKeyboardExt
//
//  Created by mac pro on 10/11/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper




class EcocashOnboardingViewController: UIViewController {
    
    
    @IBOutlet weak var ecocashNumberStackView: UIStackView!
    @IBOutlet weak var ecocashNumberLabel: UILabel!
    @IBOutlet weak var ecocashNumberView: UIView!
    @IBOutlet weak var ecocashNumberTextField: UITextField!
    
    @IBOutlet weak var ecocashOtpStackView: UIStackView!
    @IBOutlet weak var ecocashOtpLabel: UILabel!
    @IBOutlet weak var ecocashOtpView: UIView!
    @IBOutlet weak var ecocashOtpTextField: UITextField!
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- DIALOG OUTLETS
    //----------------------------------------------------------------
    @IBOutlet var ecocashDialogView: UIView!
    @IBOutlet weak var ecocashDialogTitleLabel: UILabel!
    @IBOutlet weak var ecocashDialogOkBtn: UIButton!
    @IBOutlet weak var dimView: UIView!
    
    //----------------------------------------------------------------
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        ecocashNumberView.layer.cornerRadius = 3
        ecocashOtpView.layer.cornerRadius = 3
        
        ecocashDialogView.layer.cornerRadius = 10
        ecocashDialogOkBtn.layer.cornerRadius = 3
        
        ecocashOtpStackView.isHidden = true
    }
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CLOSE DIALOG
    //----------------------------------------------------------------
    
    @IBAction func closebtn(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CLOSE ECOCASH DIALOG VIEW BTN ACTION
    //----------------------------------------------------------------
    
    @IBAction func closeEcocashDialogBtnAction(_ sender: Any) {
    
    
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            
            self.dimView.alpha = 0
            self.ecocashDialogView.transform = CGAffineTransform(scaleX: 0.6, y: 0.4)
            
        }) { (success) in
            
            self.ecocashDialogView.removeFromSuperview()
            
            self.dismiss(animated: true)
        }

    
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ECOCASH ON BOARD BUTTON ACTION
    //----------------------------------------------------------------
    
    @IBAction func onBoardEcocashBtnAction(_ sender: Any) {
        
        if ecocashNumberTextField.text != "" && ecocashOtpTextField.text == "" {
            
            let parameters = Mapper().toJSON(EcocashAuthPostModel(ecocashNumber: PhonenumberFormater().validatePhonenumber(phonenumber: ecocashNumberTextField.text!), phone: PhonenumberFormater().validatePhonenumber(phonenumber: ecocashNumberTextField.text!), imei: SharedPreference.getIMEI()!))
            
            let url = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/socialMedia/secured/sosho/createEcocashAuth"
          
            onBoardEcocashAuth(url: url, parameters: parameters)
            
        }else if ecocashNumberTextField.text != "" && ecocashOtpTextField.text != "" {
            
            let parameters = Mapper().toJSON(EcocashActivatePostModel(ecocashNumber: PhonenumberFormater().validatePhonenumber(phonenumber: ecocashNumberTextField.text!), phone: PhonenumberFormater().validatePhonenumber(phonenumber: ecocashNumberTextField.text!), imei: SharedPreference.getIMEI()!, otp: ecocashOtpTextField.text!))
            
            let url = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/socialMedia/secured/sosho/createEcocashActivate"
            
            onBoardEcocashActivate(url: url, parameters: parameters)
            
        }
        
    }
    
    
    
    //----------------------------------------------------------------
    
   
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ECOCASH AUTH METHOD REQUEST
    //----------------------------------------------------------------
    
    
    func onBoardEcocashAuth(url: String, parameters: [String: Any]){
        
        ANLoader.pulseAnimation = true
        ANLoader.activityColor = UIColor.white
        ANLoader.viewBackgroundDark = false
        ANLoader.activityBackgroundColor = UIColor.purple
        ANLoader.activityTextColor = UIColor.white
        ANLoader.showLoading("Sending information", disableUI: true)
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: EcocashAuthModel?, error) in
            
            print("CREATE PROFILE URL: \(url)")
            print("CREATE PROFILE PARAMS: \(parameters)")
            
            if error != nil {
                
                ANLoader.hide()
                print("ERROR: Error Occured")
                
                
                self.view.addSubview(self.ecocashDialogView)
                self.ecocashDialogTitleLabel.text = "An error occured."
                self.ecocashDialogView.translatesAutoresizingMaskIntoConstraints = false
                self.ecocashDialogView.widthAnchor.constraint(equalToConstant: 280).isActive = true
                self.ecocashDialogView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                self.ecocashDialogView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 200).isActive = true
                self.ecocashDialogView.heightAnchor.constraint(equalToConstant: 150).isActive = true
                
                self.ecocashDialogView.transform = CGAffineTransform(scaleX: 0.7, y: 1.3)
                
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                    
                    self.dimView.alpha = 0.85
                    self.ecocashDialogView.transform = .identity
                    
                })
                
                
            }else {
                
                ANLoader.hide()
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message! == "SUCCESS" {
                    
                    print(response!.message!)
                    
                    self.ecocashOtpStackView.isHidden = false
                    
                }else {
                    
                    print("ERROR OCCURED....")
                    
                    self.view.addSubview(self.ecocashDialogView)
                     self.ecocashDialogTitleLabel.text = "An error occured."
                    self.ecocashDialogView.translatesAutoresizingMaskIntoConstraints = false
                    self.ecocashDialogView.widthAnchor.constraint(equalToConstant: 280).isActive = true
                    self.ecocashDialogView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                    self.ecocashDialogView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 200).isActive = true
                    self.ecocashDialogView.heightAnchor.constraint(equalToConstant: 150).isActive = true
                    
                    self.ecocashDialogView.transform = CGAffineTransform(scaleX: 0.7, y: 1.3)
                    
                    UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                        
                        self.dimView.alpha = 0.85
                        self.ecocashDialogView.transform = .identity
                        
                    })
                    
                    
                }
                
            }
        }
    }
    
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ECOCASH ACTIVATE METHOD REQUEST
    //----------------------------------------------------------------
    
    
    func onBoardEcocashActivate(url: String, parameters: [String: Any]){
        
        ANLoader.pulseAnimation = true
        ANLoader.activityColor = UIColor.white
        ANLoader.viewBackgroundDark = false
        ANLoader.activityBackgroundColor = UIColor.purple
        ANLoader.activityTextColor = UIColor.white
        ANLoader.showLoading("Activating Ecocash information", disableUI: true)
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: EcocashActivateModel?, error) in
            
            print("CREATE PROFILE URL: \(url)")
            print("CREATE PROFILE PARAMS: \(parameters)")
            
            if error != nil {
                
                ANLoader.hide()
                print("ERROR: \(error!.localizedFailureReason!)")
                
                
                self.view.addSubview(self.ecocashDialogView)
                self.ecocashDialogTitleLabel.text = "An error occured."
                self.ecocashDialogView.translatesAutoresizingMaskIntoConstraints = false
                self.ecocashDialogView.widthAnchor.constraint(equalToConstant: 280).isActive = true
                self.ecocashDialogView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                self.ecocashDialogView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 200).isActive = true
                self.ecocashDialogView.heightAnchor.constraint(equalToConstant: 150).isActive = true
                
                self.ecocashDialogView.transform = CGAffineTransform(scaleX: 0.7, y: 1.3)
                
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                    
                    self.dimView.alpha = 0.85
                    self.ecocashDialogView.transform = .identity
                    
                })
                
                
                
            }else {
                
                ANLoader.hide()
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message! == "SUCCESS" {
                    
                    print(response!.message!)
                    
                   
                    
                    SharedPreference.setEcocashPhone(phone: PhonenumberFormater().validatePhonenumber(phonenumber: self.ecocashNumberTextField.text!))
                    
                    SharedPreference.setEcocashStatus(status: "1")
                    
                    
                    self.view.addSubview(self.ecocashDialogView)
                    self.ecocashDialogTitleLabel.text = "Your Ecocash payment method was added successfully"
                    self.ecocashDialogView.translatesAutoresizingMaskIntoConstraints = false
                    self.ecocashDialogView.widthAnchor.constraint(equalToConstant: 280).isActive = true
                    self.ecocashDialogView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                    self.ecocashDialogView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 200).isActive = true
                    self.ecocashDialogView.heightAnchor.constraint(equalToConstant: 150).isActive = true
                    
                    self.ecocashDialogView.transform = CGAffineTransform(scaleX: 0.7, y: 1.3)
                    
                    UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                        
                        self.dimView.alpha = 0.85
                        self.ecocashDialogView.transform = .identity
                        
                        self.ecocashNumberTextField.text = ""
                        self.ecocashOtpTextField.text = ""
                        
                    })
                    
                    
                    
                }else {
                    
                    print("ERROR OCCURED....")
                    
                    self.view.addSubview(self.ecocashDialogView)
                    self.ecocashDialogTitleLabel.text = "An error occured."
                    self.ecocashDialogView.translatesAutoresizingMaskIntoConstraints = false
                    self.ecocashDialogView.widthAnchor.constraint(equalToConstant: 280).isActive = true
                    self.ecocashDialogView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                    self.ecocashDialogView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 200).isActive = true
                    self.ecocashDialogView.heightAnchor.constraint(equalToConstant: 150).isActive = true
                    
                    self.ecocashDialogView.transform = CGAffineTransform(scaleX: 0.7, y: 1.3)
                    
                    UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                        
                        self.dimView.alpha = 0.85
                        self.ecocashDialogView.transform = .identity
                        
                    })
                    
                }
                
            }
        }
    }
    
    
    
    //----------------------------------------------------------------
    
    

}

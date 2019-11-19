//
//  SquareOnBoardViewController.swift
//  StewardKeyboardExt
//
//  Created by mac pro on 10/11/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class SquareOnBoardViewController: UIViewController {
    
    
    @IBOutlet weak var squareMobileNumberStackView: UIStackView!
    @IBOutlet weak var squareMobileNumberLabel: UILabel!
    @IBOutlet weak var squareMobileNumberView: UIView!
    @IBOutlet weak var sqaureMobileNumberTextField: UITextField!
    @IBOutlet weak var squarePinStackView: UIStackView!
    @IBOutlet weak var squarePinLabel: UILabel!
    @IBOutlet weak var squarePinView: UIView!
    @IBOutlet weak var squarePinTextField: UITextField!
    @IBOutlet weak var squareOTPStackView: UIStackView!
    @IBOutlet weak var squareOTPLabel: UILabel!
    @IBOutlet weak var squareOTPView: UIView!
    @IBOutlet weak var squareOTPTextField: UITextField!
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SQUARE DIALOG VIEW OUTLETS
    //----------------------------------------------------------------
    
    @IBOutlet var squareDialogView: UIView!
    @IBOutlet weak var squareDialogTitleLabel: UILabel!
    @IBOutlet weak var squareDialogBtn: UIButton!
    @IBOutlet weak var dimView: UIView!
    
    
    

    //----------------------------------------------------------------
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        squareDialogView.layer.cornerRadius = 10
        squareDialogBtn.layer.cornerRadius = 3
        
        squareMobileNumberView.layer.cornerRadius = 3
        squarePinView.layer.cornerRadius = 3
        squareOTPView.layer.cornerRadius = 3
        
    
        squareOTPStackView.isHidden = true
        
    }
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CLOSE BTN ACTION
    //----------------------------------------------------------------
    
    @IBAction func closeBntAction(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CLOSE SQUARE DIALOG VIEW
    //----------------------------------------------------------------
    
    @IBAction func closeSquareDialogBtn(_ sender: Any) {
        
        
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            
            self.dimView.alpha = 0
            self.squareDialogView.transform = CGAffineTransform(scaleX: 0.6, y: 0.4)
            
        }) { (success) in
            
            self.squareDialogView.removeFromSuperview()
            
             self.dismiss(animated: true)
        }
        

        
       
    }
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ONBOARD ECOCASH BUTTON ACTION
    //----------------------------------------------------------------
    
    @IBAction func onBoardSquareBtnAction(_ sender: Any) {
        
        if sqaureMobileNumberTextField.text != "" && squarePinTextField.text != "" && squareOTPTextField.text == ""
        {
            
            
            let parameters = Mapper().toJSON(SquareAuthPostModel(username: PhonenumberFormater().validatePhonenumber(phonenumber: sqaureMobileNumberTextField.text!), password: squarePinTextField.text!, phone: PhonenumberFormater().validatePhonenumber(phonenumber: sqaureMobileNumberTextField.text!), imei: SharedPreference.getIMEI()!))
            
            let url = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/socialMedia/secured/sosho/createSquareAuth"
            
            squareOnBoardEcocashAuth(url: url, parameters: parameters)
            
        }else {
            
            let phoneType = DeviceType.phoneType()
            
            let parameters = Mapper().toJSON(SquareActivatePostModel(username: PhonenumberFormater().validatePhonenumber(phonenumber: sqaureMobileNumberTextField.text!), password: squarePinTextField.text!, phone: PhonenumberFormater().validatePhonenumber(phonenumber: sqaureMobileNumberTextField.text!), imei: SharedPreference.getIMEI()!, otp: squareOTPTextField.text!, phoneType: phoneType))
            
            let url = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/socialMedia/secured/sosho/createSquareActivate"
            
            squareOnBoardEcocashActivate(url: url, parameters: parameters)
    
        }

    }
    
    //----------------------------------------------------------------
    
   
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SQAURE ONBOARD AUTH METHOD REQUEST
    //----------------------------------------------------------------
    
    
    func squareOnBoardEcocashAuth(url: String, parameters: [String: Any]){
        
        ANLoader.pulseAnimation = true
        ANLoader.activityColor = UIColor.white
        ANLoader.viewBackgroundDark = false
        ANLoader.activityBackgroundColor = UIColor.purple
        ANLoader.activityTextColor = UIColor.white
        ANLoader.showLoading("Sending information", disableUI: true)
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: SquareAuthModel?, error) in
            
            print("SQUARE ONBOARD AUTH PROFILE URL: \(url)")
            print("SQUARE ONBOARD AUTH PARAMS: \(parameters)")
            
            if error != nil {
                
                ANLoader.hide()
                print("ERROR: \(error!.localizedFailureReason!)")
                
                
               
                
            }else {
                
                ANLoader.hide()
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message! == "SUCCESS" {
                    
                    print(response!.message!)
                    
                    self.squareOTPStackView.isHidden = false
                    
                    
                  
                    
                }else {
                    
                    print("ERROR OCCURED....")
                    
                    
                }
                
            }
        }
    }
    
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SQAURE ONBOARD ACTIVATE METHOD REQUEST
    //----------------------------------------------------------------
    
    
    func squareOnBoardEcocashActivate(url: String, parameters: [String: Any]){
        
        ANLoader.pulseAnimation = true
        ANLoader.activityColor = UIColor.white
        ANLoader.viewBackgroundDark = false
        ANLoader.activityBackgroundColor = UIColor.purple
        ANLoader.activityTextColor = UIColor.white
        ANLoader.showLoading("Sending information", disableUI: true)
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: SquareActivateModel?, error) in
            
            print("SQUARE ONBOARD ACTIVATE PROFILE URL: \(url)")
            print("SQUARE ONBOARD ACTIVATE PARAMS: \(parameters)")
            
            if error != nil {
                
                ANLoader.hide()
                print("ERROR: \(error!.localizedFailureReason!)")
                
                
                self.view.addSubview(self.squareDialogView)
                self.squareDialogTitleLabel.text = "An error occured."
                self.squareDialogView.translatesAutoresizingMaskIntoConstraints = false
                self.squareDialogView.widthAnchor.constraint(equalToConstant: 280).isActive = true
                self.squareDialogView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                self.squareDialogView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 200).isActive = true
                self.squareDialogView.heightAnchor.constraint(equalToConstant: 150).isActive = true
                
                self.squareDialogView.transform = CGAffineTransform(scaleX: 0.7, y: 1.3)
                
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                    
                    self.dimView.alpha = 0.85
                    self.squareDialogView.transform = .identity
                    
                })
                
                
            }else {
                
                ANLoader.hide()
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message! == "SUCCESS" {
                    
                    
                    SharedPreference.setSquareOnBoardStatus(status: "1")
                    SharedPreference.setSquareMobileNumber(number: PhonenumberFormater().validatePhonenumber(phonenumber: self.sqaureMobileNumberTextField.text!))
                    
                    self.sqaureMobileNumberTextField.text = ""
                    self.squarePinTextField.text = ""
                    self.squareOTPTextField.text = ""
                    
                    print(response!.message!)
                    
                    self.squareOTPStackView.isHidden = false
                    
                    print(response!.message!)
                    
                    self.view.addSubview(self.squareDialogView)
                    self.squareDialogTitleLabel.text = "Your square payment method was activated successfully."
                    self.squareDialogView.translatesAutoresizingMaskIntoConstraints = false
                    self.squareDialogView.widthAnchor.constraint(equalToConstant: 280).isActive = true
                    self.squareDialogView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                    self.squareDialogView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 200).isActive = true
                    self.squareDialogView.heightAnchor.constraint(equalToConstant: 150).isActive = true
                    
                    self.squareDialogView.transform = CGAffineTransform(scaleX: 0.7, y: 1.3)
                    
                    UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                        
                        self.dimView.alpha = 0.85
                        self.squareDialogView.transform = .identity
                        
                    })
                    
                }else {
                    
                    print("ERROR OCCURED....")
                    
                    self.view.addSubview(self.squareDialogView)
                    self.squareDialogTitleLabel.text = "An error occured."
                    self.squareDialogView.translatesAutoresizingMaskIntoConstraints = false
                    self.squareDialogView.widthAnchor.constraint(equalToConstant: 280).isActive = true
                    self.squareDialogView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                    self.squareDialogView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 200).isActive = true
                    self.squareDialogView.heightAnchor.constraint(equalToConstant: 150).isActive = true
                    
                    self.squareDialogView.transform = CGAffineTransform(scaleX: 0.7, y: 1.3)
                    
                    UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                        
                        self.dimView.alpha = 0.85
                        self.squareDialogView.transform = .identity
                        
                    })
                    
                    
                }
                
            }
        }
    }
    
    
    
    //----------------------------------------------------------------
    
    

}

//
//  OnBoardPrimaryNumberViewController.swift
//  StewardKeyboardExt
//
//  Created by mac pro on 10/10/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class OnBoardPrimaryNumberViewController: UIViewController {
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- OUTLETS
    //----------------------------------------------------------------
    
    
    @IBOutlet weak var primaryNumberStackView: UIStackView!
    @IBOutlet weak var primaryNumberView: UIView!
    @IBOutlet weak var primaryNumberTextField: UITextField!
    @IBOutlet weak var primaryNumberLabel: UILabel!
    @IBOutlet weak var otpStackView: UIStackView!
    @IBOutlet weak var otpLabel: UILabel!
    @IBOutlet weak var otpView: UIView!
    @IBOutlet weak var otpTextField: UITextField!
    @IBOutlet weak var pinStackView: UIStackView!
    @IBOutlet weak var pinLabel: UILabel!
    @IBOutlet weak var pinView: UIView!
    @IBOutlet weak var pinTextField: UITextField!

    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- PRIMATY ONBOARDING DIALOG OUTLETS
    //----------------------------------------------------------------
    
    @IBOutlet var primaryDialogView: UIView!
    @IBOutlet weak var primaryDialogLabel: UILabel!
    @IBOutlet weak var primaryDialogBtn: UIButton!
    @IBOutlet weak var dimView: UIView!
    
    
    //----------------------------------------------------------------
    
    fileprivate func setupViewConers() {
        // Do any additional setup after loading the view.
        
        primaryNumberView.layer.cornerRadius = 3
        otpView.layer.cornerRadius = 3
        pinView.layer.cornerRadius = 3
        primaryDialogView.layer.cornerRadius = 10
        primaryDialogBtn.layer.cornerRadius = 3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let deviceid = UIDevice.current.identifierForVendor?.uuidString
        SharedPreference.setIMEI(IMEI: deviceid!)
        
        
        setupViewConers()
        
        otpStackView.isHidden = true
        pinStackView.isHidden = true
        
        
        print("DEVICE NAME: \(DeviceType.phoneType())")
        
        if let userDefaults = UserDefaults(suiteName: GroupUserDefaults.getSharedUserDefaultsName()){
            
            userDefaults.set("testValue", forKey: "test")
            
            
            print("TEST VALUE CREATED: \(userDefaults.string(forKey: "test")!)")
            
        }
        
        
    
    }
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CLOSE PRIMARY DIALOG
    //----------------------------------------------------------------
    
    @IBAction func closePrimaryDialog(_ sender: Any) {
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            
            self.dimView.alpha = 0
            self.primaryDialogView.transform = CGAffineTransform(scaleX: 0.6, y: 0.4)
            
        }) { (success) in
            
            self.primaryDialogView.removeFromSuperview()
            self.dismiss(animated: true)
        }

    
    }
    
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:-  PRIMARY REGISTRATION BUTTON ACTION
    //----------------------------------------------------------------
    
    @IBAction func primaryRegistrationBtnClicked(_ sender: Any) {
        
        
        if primaryNumberTextField.text != "" && otpTextField.text == "" {
                      
            ANLoader.pulseAnimation = true
            ANLoader.activityColor = UIColor.white
            ANLoader.viewBackgroundDark = false
            ANLoader.activityBackgroundColor = UIColor.purple
            ANLoader.activityTextColor = UIColor.white
            ANLoader.showLoading("Sending information", disableUI: true)
            
            
            
            let parameters = Mapper().toJSON(ProfileAuthPostModel(mobileNumber: PhonenumberFormater().validatePhonenumber(phonenumber: primaryNumberTextField.text!) , imei: SharedPreference.getIMEI()))
            let url = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/socialMedia/secured/sosho/createProfileAuth"
            primaryRegistrationAuth(url: url, parameters: parameters)
       
        }else if primaryNumberTextField.text != "" && otpTextField.text != "" && pinTextField.text == "" {
            
            let parameters = Mapper().toJSON(ProfileActivatePostModel(mobileNumber: PhonenumberFormater().validatePhonenumber(phonenumber: primaryNumberTextField.text!), imei: SharedPreference.getIMEI()!, otp: otpTextField.text!))
            
            let url = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/socialMedia/secured/sosho/createProfileActivate"
            
            primaryRegistrationActivate(url: url, parameters: parameters)
        }else {
            
            SharedPreference.setPin(shosholozaPin: pinTextField.text!)
            SharedPreference.setPhoneNumber(phone: PhonenumberFormater().validatePhonenumber(phonenumber: primaryNumberTextField.text!))
            
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "HomeScreenViewController", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
            self.present(newViewController, animated: true, completion: nil)
            
        }
       
    
    }
    
    //----------------------------------------------------------------

    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- GET OTP FOR PRIMARY REGISTRY
    //----------------------------------------------------------------
    
    func primaryRegistrationAuth(url: String, parameters: [String: Any]){
        
        ANLoader.pulseAnimation = true
        ANLoader.activityColor = UIColor.white
        ANLoader.viewBackgroundDark = false
        ANLoader.activityBackgroundColor = UIColor.purple
        ANLoader.activityTextColor = UIColor.white
        ANLoader.showLoading("Sending information", disableUI: true)
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: ProfileAuthModel?, error) in
            
            print("CREATE PROFILE URL: \(url)")
            print("CREATE PROFILE PARAMS: \(parameters)")
            
            if error != nil {
                
                ANLoader.hide()
                print("ERROR: Error occured")
                
                
            }else {
                
                ANLoader.hide()
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message! == "SUCCESS" {
                    
                    print(response!.message!)
                    
                    self.otpStackView.isHidden = false
                    
                }else {
                    
                    print("ERROR OCCURED....")
                    
                     ANLoader.hide()
                }
                
            }
        }
    }

    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ACTIVATE PROFILE FOR PRIMARY REGISTRY
    //----------------------------------------------------------------
    
    func primaryRegistrationActivate(url: String, parameters: [String: Any]){
        
        ANLoader.pulseAnimation = true
        ANLoader.activityColor = UIColor.white
        ANLoader.viewBackgroundDark = false
        ANLoader.activityBackgroundColor = UIColor.purple
        ANLoader.activityTextColor = UIColor.white
        ANLoader.showLoading("Sending information", disableUI: true)
        
        
        
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: ProfileActivateModel?, error) in
            
            print("ACTIVATE PROFILE URL: \(url)")
            print("ACTIVATE PROFILE PARAMS: \(parameters)")
            
            if error != nil {
                
                ANLoader.hide()
                print("ERROR: \(error!.localizedFailureReason!)")
                
                self.view.addSubview(self.primaryDialogView)
                self.primaryDialogLabel.text = "An error occured."
                self.primaryDialogView.translatesAutoresizingMaskIntoConstraints = false
                self.primaryDialogView.widthAnchor.constraint(equalToConstant: 280).isActive = true
                self.primaryDialogView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                self.primaryDialogView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 200).isActive = true
                self.primaryDialogView.heightAnchor.constraint(equalToConstant: 150).isActive = true
                
                self.primaryDialogView.transform = CGAffineTransform(scaleX: 0.7, y: 1.3)
                
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                    
                    self.dimView.alpha = 0.85
                    self.primaryDialogView.transform = .identity
                    
                })
                
                
            }else {
                
                ANLoader.hide()
                print(response!.toJSONString(prettyPrint: true)!)
                
                if response!.message! == "SUCCESS" {
                    
                    print(response!.message!)
                    
                    self.pinStackView.isHidden = false
                    
                    self.view.addSubview(self.primaryDialogView)
                    self.primaryDialogLabel.text = "Your primary phone number was added successfuly"
                    self.primaryDialogView.translatesAutoresizingMaskIntoConstraints = false
                    self.primaryDialogView.widthAnchor.constraint(equalToConstant: 280).isActive = true
                    self.primaryDialogView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                    self.primaryDialogView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 200).isActive = true
                    self.primaryDialogView.heightAnchor.constraint(equalToConstant: 150).isActive = true
                    
                    self.primaryDialogView.transform = CGAffineTransform(scaleX: 0.7, y: 1.3)
                    
                    SharedPreference.setPhoneNumber(phone: PhonenumberFormater().validatePhonenumber(phonenumber: self.primaryNumberTextField.text!))
                    
                    UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                        
                        self.dimView.alpha = 0.85
                        self.primaryDialogView.transform = .identity
                        
                    })
                    
                }else {
                    
                    print("ERROR OCCURED....")
                    self.view.addSubview(self.primaryDialogView)
                    self.primaryDialogLabel.text = "An error occured."
                    self.primaryDialogView.translatesAutoresizingMaskIntoConstraints = false
                    self.primaryDialogView.widthAnchor.constraint(equalToConstant: 280).isActive = true
                    self.primaryDialogView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                    self.primaryDialogView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 200).isActive = true
                    self.primaryDialogView.heightAnchor.constraint(equalToConstant: 150).isActive = true
                    
                    self.primaryDialogView.transform = CGAffineTransform(scaleX: 0.7, y: 1.3)
                    
                    UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                        
                        self.dimView.alpha = 0.85
                        self.primaryDialogView.transform = .identity
                        
                    })
                    
                }
                
            }
        }
    }
    
    
    //----------------------------------------------------------------
   
}

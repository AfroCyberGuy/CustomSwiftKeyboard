//
//  SetupPhoneViewController.swift
//  KeyboardStoryboadApp
//
//  Created by mac pro on 8/22/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import UIKit

class SetupPhoneViewController: UIViewController {
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- OUTLETS
    //----------------------------------------------------------------
    
//    @IBOutlet weak var phoneNumberTF: UITextField!
    
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var channelsStackView: UIStackView!
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE ECOCASH ONBOARD OPTION
    //----------------------------------------------------------------
    
    func MakeEcocashOnboardingOption(ecocashNumber: String){
        
        let theView = Controls().theView()
        theView.layer.cornerRadius = 5
        
        let editText = Controls().theTextField(placeholder: "gfgjghjgjgj")
        editText.text = ecocashNumber
        
        theView.addSubview(editText)
        theView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        editText.textAlignment = .center
        editText.topAnchor.constraint(equalTo: theView.topAnchor, constant: 3).isActive = true
        editText.leftAnchor.constraint(equalTo: theView.leftAnchor, constant: 5).isActive = true
        editText.rightAnchor.constraint(equalTo: theView.rightAnchor, constant: -5).isActive = true
        editText.bottomAnchor.constraint(equalTo: theView.bottomAnchor, constant: -3).isActive = true
        
        showRightIcon(textField: editText, imageName: "text_settings_icon")
        showLeftIcon(textField: editText, imageName: "econet")
        
        channelsStackView.addArrangedSubview(theView)
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE STEWARD ONBOARD OPTION
    //----------------------------------------------------------------
    
    func MakeStewardOnboardingOption(squarePhonenumber: String){
        
        let theView = Controls().theView()
        theView.layer.cornerRadius = 5
        
        let editText = Controls().theTextField(placeholder: "gfgjghjgjgj")
        editText.text = squarePhonenumber
        
        theView.addSubview(editText)
        theView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        editText.textAlignment = .center
        editText.topAnchor.constraint(equalTo: theView.topAnchor, constant: 3).isActive = true
        editText.leftAnchor.constraint(equalTo: theView.leftAnchor, constant: 5).isActive = true
        editText.rightAnchor.constraint(equalTo: theView.rightAnchor, constant: -5).isActive = true
        editText.bottomAnchor.constraint(equalTo: theView.bottomAnchor, constant: -3).isActive = true
        
        showRightIcon(textField: editText, imageName: "text_settings_icon")
        showLeftIcon(textField: editText, imageName: "stewardbank")
        
        channelsStackView.addArrangedSubview(theView)
    }
    
    
    //-----------------------------------------------------------------
    
    //----------------------------------------------------------------

    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let ecocashOnboard = SharedPreference.getEcocashOnBoardStatus() {
            
            print(ecocashOnboard)
             MakeEcocashOnboardingOption(ecocashNumber: SharedPreference.getEcocashEcocashPhone()!)
            
        }
        
        
        if let squareOnbord = SharedPreference.getSquareOnBoardStatus() {
            
            MakeStewardOnboardingOption(squarePhonenumber: SharedPreference.getSquareMobileNumber()!)
        }
       
        
//        showRightIcon(textField: phoneNumberTF, imageName: "text_settings_icon")
//        showLeftIcon(textField: phoneNumberTF, imageName: "onemoney")
      
    }
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- Custom Methods
    //----------------------------------------------------------------
    
    @IBAction func backBtnAction(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ADD PAYMENT CHANNELS
    //----------------------------------------------------------------
    
    @IBAction func addPaymentChannel(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "SetupPaymentHomeViewController", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "SetupPaymentHomeViewController") as! SetupPaymentHomeViewController
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    

 
    
    func showRightIcon(textField: UITextField, imageName: String){
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        textField.rightView = imageView
        textField.rightViewMode = .always
        
    }
    
    func showLeftIcon(textField: UITextField, imageName: String){
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        textField.leftView = imageView
        textField.leftViewMode = .always
        
    }

}

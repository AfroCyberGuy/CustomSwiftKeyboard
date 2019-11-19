//
//  MyProfileViewController.swift
//  StewardKeyboardExt
//
//  Created by mac pro on 11/26/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var primaryPhoneLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        containerView.layer.cornerRadius = 5
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowRadius = 4.0
        containerView.layer.shadowOpacity = 0.5
        self.containerView.layer.shadowPath = UIBezierPath(rect: self.containerView.bounds).cgPath
        self.containerView.layer.shouldRasterize = true
        
        primaryPhoneLabel.text = "+\(SharedPreference.getPhoneNumber()!)"
        
        
    }
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- LOGOUT BUTTON ACTION
    //----------------------------------------------------------------
    
    @IBAction func logout(_ sender: Any) {
    
        
    
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- DISMISS VIEW
    //----------------------------------------------------------------
    
    @IBAction func back(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
    //----------------------------------------------------------------
    
    
    
}

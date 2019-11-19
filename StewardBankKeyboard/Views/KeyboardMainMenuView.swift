//
//  KeyboardMainView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/16/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit

extension KeyboardViewController {
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE MAIN KEYBOARD MENU
    //----------------------------------------------------------------
    
    func makeKeyboardMainMenuView(){
        
        view.addSubview(mainKeyboardMenu)
        mainKeyboardMenu.layer.cornerRadius = 0
        mainKeyboardMenu.backgroundColor = Theme.LighterGray
        mainKeyboardMenu.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        mainKeyboardMenu.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        mainKeyboardMenu.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        mainKeyboardMenu.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        makeKeyboardMainMenuTopContainer()
        makeKeyboardMenuContainerView()
        
    }

    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE KEYMBOARD MAIN MENU TOP CONTAINER VIEW
    //----------------------------------------------------------------
    
    func makeKeyboardMainMenuTopContainer(){
        
        mainKeyboardMenu.addSubview(mainKeyboardTopView)
        mainKeyboardTopView.layer.cornerRadius = 0
        mainKeyboardTopView.backgroundColor = Theme.LighterGray
        
        mainKeyboardTopView.leftAnchor.constraint(equalTo: mainKeyboardMenu.leftAnchor, constant: 3).isActive = true
        mainKeyboardTopView.topAnchor.constraint(equalTo: mainKeyboardMenu.topAnchor, constant: 3).isActive = true
        mainKeyboardTopView.rightAnchor.constraint(equalTo: mainKeyboardMenu.rightAnchor, constant: -3).isActive = true
        mainKeyboardTopView.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        
        makeKeyboardMainViewBackButton()
        makeKeyboardMainMenuTopContainerLabel()
       
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE KEYBOARD MAIN MENU  TOP CONTAINER LABEL
    //----------------------------------------------------------------
    
    func makeKeyboardMainMenuTopContainerLabel(){
        
        mainKeyboardTopView.addSubview(mainKeyboardViewLabel)
        mainKeyboardViewLabel.textAlignment = .center
        mainKeyboardViewLabel.centerYAnchor.constraint(equalTo: mainKeyboardViewBackBtn.centerYAnchor).isActive = true
        mainKeyboardViewLabel.leftAnchor.constraint(equalTo: mainKeyboardTopView.leftAnchor, constant: 3).isActive = true
        mainKeyboardViewLabel.rightAnchor.constraint(equalTo: mainKeyboardTopView.rightAnchor, constant: 3).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE KEYBOARD MAIN MENU LEFT BUTTON
    //----------------------------------------------------------------
    
    
    func makeKeyboardMainViewBackButton(){
        
        mainKeyboardViewBackBtn.layer.cornerRadius = 15
        mainKeyboardTopView.addSubview(mainKeyboardViewBackBtn)
        
        
        mainKeyboardViewBackBtn.addTarget(self, action: #selector(keyboardMainMenuLeftBtnPressed), for: .touchUpInside)
        
        mainKeyboardViewBackBtn.centerYAnchor.constraint(equalTo: mainKeyboardTopView.centerYAnchor).isActive = true
        mainKeyboardViewBackBtn.leftAnchor.constraint(equalTo: mainKeyboardTopView.leftAnchor, constant: 8).isActive = true
        mainKeyboardViewBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        mainKeyboardViewBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- KEYBOARD MAIN MENU LEFT BUTTON PRESSED
    //----------------------------------------------------------------
    
    @objc func keyboardMainMenuLeftBtnPressed(){
        
     
        mainKeyboardMenu.removeFromSuperview()
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE KEYBOARD MAIN MENU CONTAINER
    //----------------------------------------------------------------
    
    func makeKeyboardMenuContainerView(){
        
        mainKeyboardMenu.addSubview(mainKeyboardContainerView)
        mainKeyboardContainerView.backgroundColor = Theme.LighterGray
        
        mainKeyboardContainerView.topAnchor.constraint(equalTo: mainKeyboardTopView.bottomAnchor, constant: 3).isActive = true
        mainKeyboardContainerView.leftAnchor.constraint(equalTo: mainKeyboardMenu.leftAnchor, constant: 3).isActive = true
        mainKeyboardContainerView.rightAnchor.constraint(equalTo: mainKeyboardMenu.rightAnchor, constant: -3).isActive = true
        mainKeyboardContainerView.bottomAnchor.constraint(equalTo: mainKeyboardMenu.bottomAnchor, constant: -3).isActive = true
    
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
}

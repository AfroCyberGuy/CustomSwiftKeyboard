//
//  KeyboardNumberCharecterOneView.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 9/18/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit


extension KeyboardViewController {
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CREATE KEYBOARD NUMBER CHARACTER KEYBOARD ONE PARENT VIEW
    //----------------------------------------------------------------
    
    func makeKeyboardNumberCharecterOneView(){
        
        keyboardNumberCharecterViewOne.backgroundColor = Theme.LighterGray
        keyboardNumberCharecterViewOne.layer.cornerRadius = 0
        view.addSubview(keyboardNumberCharecterViewOne)
        setKeyboardNumberCharecterOneConstraints()
        
        keyboardNumberCharecterViewOne.addSubview(makeKeyboardNumberCharacterOneRowOne())
        keyboardNumberCharecterViewOne.addSubview(makeKeyboardNumberCharacterOneRowTwo())
        keyboardNumberCharecterViewOne.addSubview(makeKeyboardNumberCharacterOneRowThree())
        makeKeyboardNumberCharecterOneRow4View()

    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE KEYBOARD NUMBER CHARACTER ROW ONE VIEW
    //----------------------------------------------------------------
    
    func makeKeyboardNumberCharacterOneRowOne() -> UIStackView {
        
        let rowHeight = CGFloat(50)
        
        let buttonTitles = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
        
        var buttons = [UIButton]()
        
        for buttonTitle in buttonTitles {
            
            let button = Controls().theButton(title: buttonTitle)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            button.setTitleColor(UIColor.black, for: .normal)
            button.backgroundColor = UIColor.white
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            buttons.append(button)
            
        }
        
        let hStackView = Controls().theHorizontalStackView(buttons: buttons)
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 7
        
        keyboardNumberCharecterViewOne.addSubview(hStackView)
        
        hStackView.topAnchor.constraint(equalTo: keyboardNumberCharecterViewOne.topAnchor, constant: 20).isActive = true
        hStackView.leftAnchor.constraint(equalTo: keyboardNumberCharecterViewOne.leftAnchor, constant: 3).isActive = true
        hStackView.rightAnchor.constraint(equalTo: keyboardNumberCharecterViewOne.rightAnchor, constant: -3).isActive = true
        hStackView.heightAnchor.constraint(equalToConstant: rowHeight).isActive = true
        
        return hStackView
    }
    
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE KEYBOARD NUMBER CHARACTER ROW TWO VIEW
    //----------------------------------------------------------------
    
    func makeKeyboardNumberCharacterOneRowTwo() -> UIStackView {
        
        let doubleQuotes = "\""
        let rowHeight = CGFloat(50)
        
        let buttonTitles = ["-", "/", ":", ";", "(", ")", "$", "&", "@", doubleQuotes]
        
        var buttons = [UIButton]()
        
        for buttonTitle in buttonTitles {
            
            let button = Controls().theButton(title: buttonTitle)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            button.setTitleColor(UIColor.black, for: .normal)
            button.backgroundColor = UIColor.white
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            buttons.append(button)
            
        }
        
        let hStackView = Controls().theHorizontalStackView(buttons: buttons)
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 7
        
        keyboardNumberCharecterViewOne.addSubview(hStackView)
        
        hStackView.topAnchor.constraint(equalTo: makeKeyboardNumberCharacterOneRowOne().bottomAnchor, constant: 20).isActive = true
        hStackView.leftAnchor.constraint(equalTo: keyboardNumberCharecterViewOne.leftAnchor, constant: 3).isActive = true
        hStackView.rightAnchor.constraint(equalTo: keyboardNumberCharecterViewOne.rightAnchor, constant: -3).isActive = true
        hStackView.heightAnchor.constraint(equalToConstant: rowHeight).isActive = true
        
        return hStackView
    }
    
    
    //----------------------------------------------------------------
    
    
   
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE KEYBOARD NUMBER CHARACTER ROW THREE VIEW
    //----------------------------------------------------------------
    
    func makeKeyboardNumberCharacterOneRowThree() -> UIStackView {
        
      
        let rowHeight = CGFloat(50)
        
        let buttonTitles = [".", ",", "?", "!", "'"]
        
        var buttons = [AnyObject]()
        
        let numberSymbolTwoBtn = Controls().theButton(title: "#+=")
        numberSymbolTwoBtn.setTitleColor(UIColor.black, for: .normal)
        numberSymbolTwoBtn.layer.cornerRadius = 5
        
//        buttons.append(Controls().theButton(title: "#+="))
        
        buttons.append(numberSymbolTwoBtn)
        
        for buttonTitle in buttonTitles {
            
           
            
            let button = Controls().theButton(title: buttonTitle)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            button.addTarget(self, action: #selector(keyboardOneNumkey2BtnPressed), for: .touchUpInside)
            button.setTitleColor(UIColor.black, for: .normal)
            button.backgroundColor = UIColor.white
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            buttons.append(button)
            
           
            
        }
        
        let imgButton = Controls().theButtonWithImage(radius: 3, img: "backspace", backgroundColor: UIColor.white)
        
        imgButton.addTarget(self, action: #selector(keyboardOneDeleteBtnPressed), for: .touchUpInside)
        

        buttons.append(imgButton)
        
        let hStackView = Controls().theHorizontalStackView(buttons: buttons)
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 7
        
        keyboardNumberCharecterViewOne.addSubview(hStackView)
        
        hStackView.topAnchor.constraint(equalTo: makeKeyboardNumberCharacterOneRowTwo().bottomAnchor, constant: 20).isActive = true
        hStackView.leftAnchor.constraint(equalTo: keyboardNumberCharecterViewOne.leftAnchor, constant: 3).isActive = true
        hStackView.rightAnchor.constraint(equalTo: keyboardNumberCharecterViewOne.rightAnchor, constant: -3).isActive = true
        hStackView.heightAnchor.constraint(equalToConstant: rowHeight).isActive = true
        
        return hStackView
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- KEYBOARD NUMBER ONE ROW THREE BTN ACTIONS
    //----------------------------------------------------------------
    
    @objc func keyboardOneNumkey2BtnPressed(){
        
        
        
    }
    
    @objc func keyboardOneDeleteBtnPressed(){
        
         proxy.deleteBackward()
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CREATE KEYBOARD NUMBER CHARACTER ROW FOUR VIEW
    //----------------------------------------------------------------
    
    func makeKeyboardNumberCharecterOneRow4View() {
        
//        let rowHeight = CGFloat(view.frame.height / 4)
        let rowWidth = CGFloat(view.frame.width) * (1/10)
        let spaceBtnWidth = CGFloat(view.frame.width) * (4/10)
        
        
        let view4 = Controls().theView()
        view4.backgroundColor = UIColor.clear
        view4.layer.cornerRadius = 0
        
        keyboardNumberCharecterViewOne.addSubview(view4)
        
        view4.topAnchor.constraint(equalTo: makeKeyboardNumberCharacterOneRowThree().bottomAnchor, constant: 20).isActive = true
        view4.leftAnchor.constraint(equalTo: keyboardNumberCharecterViewOne.leftAnchor, constant: 3).isActive = true
        view4.rightAnchor.constraint(equalTo: keyboardNumberCharecterViewOne.rightAnchor, constant: -3).isActive = true
//        view4.bottomAnchor.constraint(equalTo: keyboardNumberCharecterViewOne.bottomAnchor, constant: -3).isActive = true
        view4.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let abcBtn = Controls().theButton(title: "ABC")
        abcBtn.layer.cornerRadius = 5
        abcBtn.setTitleColor(UIColor.black, for: .normal)
        let spaceBtn = Controls().theButton(title: "space")
        spaceBtn.layer.cornerRadius = 5
        spaceBtn.setTitleColor(UIColor.black, for: .normal)
        let returnBtn = Controls().theButton(title: "Return")
        returnBtn.layer.cornerRadius = 5
        returnBtn.setTitleColor(UIColor.black, for: .normal)
        
        let smileyBtn = Controls().theButtonWithImage(radius: 5, img: "smiley", backgroundColor: UIColor.white)
        let microphoneBtn = Controls().theButtonWithImage(radius: 5, img: "microphone", backgroundColor: UIColor.white)
        
        abcBtn.addTarget(self, action: #selector(abcBtnPressed), for: .touchUpInside)
        spaceBtn.addTarget(self, action: #selector(spaceBtnPressed), for: .touchUpInside)
        returnBtn.addTarget(self, action: #selector(returnBtnPressed), for: .touchUpInside)
        smileyBtn.addTarget(self, action: #selector(smileyBtnPressed), for: .touchUpInside)
        microphoneBtn.addTarget(self, action: #selector(microphoneBtnPressed), for: .touchUpInside)
        
        
        view4.addSubview(abcBtn)
        view4.addSubview(smileyBtn)
        view4.addSubview(microphoneBtn)
        view4.addSubview(spaceBtn)
        view4.addSubview(returnBtn)
        
        
        abcBtn.topAnchor.constraint(equalTo: view4.topAnchor, constant: 0).isActive = true
        abcBtn.leftAnchor.constraint(equalTo: view4.leftAnchor, constant: 0).isActive = true
        abcBtn.bottomAnchor.constraint(equalTo: view4.bottomAnchor, constant: 7).isActive = true
        abcBtn.widthAnchor.constraint(equalToConstant: rowWidth).isActive = true
        
        smileyBtn.topAnchor.constraint(equalTo: view4.topAnchor, constant: 0).isActive = true
        smileyBtn.bottomAnchor.constraint(equalTo: view4.bottomAnchor, constant: 0).isActive = true
        smileyBtn.leftAnchor.constraint(equalTo: abcBtn.rightAnchor, constant: 7).isActive = true
        smileyBtn.widthAnchor.constraint(equalToConstant: rowWidth).isActive = true
        
        microphoneBtn.topAnchor.constraint(equalTo: view4.topAnchor, constant: 0).isActive = true
        microphoneBtn.bottomAnchor.constraint(equalTo: view4.bottomAnchor, constant: 0).isActive = true
        microphoneBtn.leftAnchor.constraint(equalTo: smileyBtn.rightAnchor, constant: 7).isActive = true
        microphoneBtn.widthAnchor.constraint(equalToConstant: rowWidth).isActive = true
        
        spaceBtn.topAnchor.constraint(equalTo: view4.topAnchor, constant: 0).isActive = true
        spaceBtn.bottomAnchor.constraint(equalTo: view4.bottomAnchor, constant: 0).isActive = true
        spaceBtn.leftAnchor.constraint(equalTo: microphoneBtn.rightAnchor, constant: 7).isActive = true
        spaceBtn.widthAnchor.constraint(equalToConstant: spaceBtnWidth).isActive = true
             
        returnBtn.topAnchor.constraint(equalTo: view4.topAnchor, constant: 0).isActive = true
        returnBtn.bottomAnchor.constraint(equalTo: view4.bottomAnchor, constant: 0).isActive = true
        returnBtn.leftAnchor.constraint(equalTo: spaceBtn.rightAnchor, constant: 7).isActive = true
        returnBtn.rightAnchor.constraint(equalTo: view4.rightAnchor, constant: 0).isActive = true
        
        
    }

    //----------------------------------------------------------------
    
    @objc func abcBtnPressed(){
        
        keyboardNumberCharecterViewOne.removeFromSuperview()
        
    }
    
    @objc func spaceBtnPressed(){
        
        proxy.insertText(" ")
        
        
    }
    
    @objc func returnBtnPressed(){
    
        proxy.insertText("\n")
    
    }
    
    @objc func smileyBtnPressed(){
        
        
        advanceToNextInputMode()
        
    }
    
    @objc func microphoneBtn(){
        
        
    }
    
    @objc func microphoneBtnPressed(){
        
        
        makeKeyboardMainMenuView()
       
        tilesArray = createTileArray()
        print("BILL ARRAY COUNT \(tilesArray.count)")
        
        let topView: MainTilesCollectionView = {

            let tv = MainTilesCollectionView(tilesArray: tilesArray)
            tv?.translatesAutoresizingMaskIntoConstraints = false
            tv?.delegate = self
            return tv!

        }()

                mainKeyboardContainerView.addSubview(topView)
                topView.topAnchor.constraint(equalTo: mainKeyboardContainerView.topAnchor, constant: 3).isActive = true
                topView.leftAnchor.constraint(equalTo: mainKeyboardContainerView.leftAnchor, constant: 3).isActive = true
                topView.rightAnchor.constraint(equalTo: mainKeyboardContainerView.rightAnchor, constant: -3).isActive = true
                topView.bottomAnchor.constraint(equalTo: mainKeyboardContainerView.bottomAnchor, constant: -3).isActive = true
    }
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE KEYBOARD NUMBER CHARACTER ROW FOUR VIEW
    //----------------------------------------------------------------
    
    func makeKeyboardNumberCharacterOneRowFour() -> UIStackView {
        
        
        let rowHeight = CGFloat(view.frame.height / 4)
        
        let rowWidth = CGFloat(view.frame.width / 4)
        
//        let abcBtnWidth = CGFloat(40)1
//        let smileyBtnwidth = CGFloat(keyboardNumberCharecterViewOne.frame.width / 5)
//        let microphoneBtnWidth = CGFloat(keyboardNumberCharecterViewOne.frame.width / 5)
//        let spaceBtnWidth = CGFloat(keyboardNumberCharecterViewOne.frame.width / 5)
//        let searchBtnWidth = CGFloat(keyboardNumberCharecterViewOne.frame.width / 5)
       
        
//        var buttons = [AnyObject]()
        
        let abcBtn = Controls().theButton(title: "ABC")
        let spaceBtn = Controls().theButton(title: "space")
        let searchBtn = Controls().theButton(title: "Search")
        
        let smileyBtn = Controls().theButtonWithImage(radius: 3, img: "smiley", backgroundColor: UIColor.white)
        let microphoneBtn = Controls().theButtonWithImage(radius: 3, img: "microphone", backgroundColor: UIColor.white)
        
//      buttons.append(imgButton)
        
       
        let hStackView = Controls().theHorizontalStackView(buttons: [abcBtn, smileyBtn, microphoneBtn, spaceBtn, searchBtn])
        hStackView.axis = .horizontal
        hStackView.distribution = .fill
        hStackView.spacing = 3
        
        keyboardNumberCharecterViewOne.addSubview(hStackView)
        
        abcBtn.widthAnchor.constraint(equalToConstant: rowWidth / 5).isActive = true
        smileyBtn.widthAnchor.constraint(equalToConstant: rowWidth / 5).isActive = true
        microphoneBtn.widthAnchor.constraint(equalToConstant: rowWidth / 5).isActive = true
        spaceBtn.widthAnchor.constraint(equalToConstant: rowWidth / 5).isActive = true
        searchBtn.widthAnchor.constraint(equalToConstant: rowWidth / 5).isActive = true
        
        hStackView.topAnchor.constraint(equalTo: makeKeyboardNumberCharacterOneRowThree().bottomAnchor, constant: 1).isActive = true
        hStackView.leftAnchor.constraint(equalTo: keyboardNumberCharecterViewOne.leftAnchor, constant: 3).isActive = true
        hStackView.rightAnchor.constraint(equalTo: keyboardNumberCharecterViewOne.rightAnchor, constant: -3).isActive = true
        hStackView.heightAnchor.constraint(equalToConstant: rowHeight).isActive = true
        
        return hStackView
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CONSTRUCT KEYBOARD NUMBER CHARACTER CONSTRINTS
    //----------------------------------------------------------------
    
    func setKeyboardNumberCharecterOneConstraints() {
        
        keyboardNumberCharecterViewOne.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        keyboardNumberCharecterViewOne.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        keyboardNumberCharecterViewOne.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        keyboardNumberCharecterViewOne.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    //----------------------------------------------------------------
    
}




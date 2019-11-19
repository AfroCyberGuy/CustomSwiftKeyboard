//
//  Controls.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 8/28/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit

class Controls {
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CREATING A VIEW
    //----------------------------------------------------------------
    
    func theView() -> UIView {
        
        let inputsContainerView: UIView = {
            
            let view = UIView()
            view.backgroundColor = UIColor.white
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = 0
            view.layer.masksToBounds = true
            
            return view
        }()
        
        return inputsContainerView
    }
    941308
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CREATING GENERAL BUTTON
    //----------------------------------------------------------------
    
    func theButton(title: String) -> UIButton {
        
        let button = UIButton(type: .system)
        let loginRegisterButton: UIButton = {
            
            button.backgroundColor = UIColor.white
            button.setTitle(title, for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitleColor(UIColor.white, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            
            //          button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
            
            return button
        }()
        
        return loginRegisterButton
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CREATING A LABEL
    //----------------------------------------------------------------
    
    func theTextField(placeholder: String) -> UITextField {
        
        let textField: UITextField = {
            
            let tf = UITextField()
            tf.placeholder = placeholder
            tf.translatesAutoresizingMaskIntoConstraints = false
            
            return tf
        }()
        
        return textField
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CREATING LABEL
    //----------------------------------------------------------------
    
    func theLabel(title: String, fontSize: CGFloat) -> UILabel {
        
        let label: UILabel = {
            
            let lb = UILabel()
            lb.translatesAutoresizingMaskIntoConstraints = false
            lb.font = lb.font.withSize(fontSize)
            //            lb = PaddingLabel(withInsets: 3, 0, 0, 0)
            lb.text = title
            
            return lb
        }()
        
        return label
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:-CREATE IMAGE VIEW
    //----------------------------------------------------------------
    
    func theImageView(imageName: String) -> UIImageView {
        
        let profileImageView: UIImageView = {
            
            let imageView = UIImageView()
            imageView.image = UIImage(named: imageName)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleToFill
            imageView.isUserInteractionEnabled = true
            
            return imageView
        }()
        
        return profileImageView
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CREATING IMAGE BUTTON PROGRAMMATICALLY
    //----------------------------------------------------------------
    
    func theImageButton(imageName: String) -> UIButton {
        
        let button: UIButton = {
            
            let button = UIButton(type: .system)
            button.backgroundColor = UIColor.purple
            button.setBackgroundImage(UIImage(named: imageName), for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitleColor(UIColor.white, for: .normal)
            button.imageView?.contentMode = UIViewContentMode.scaleAspectFit
            //            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            
            return button
        }()
        
        return button
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CREATE IMAGE BUTTON PROGRAMMATICALLY
    //----------------------------------------------------------------
    
    func theButtonWithImage(radius: CGFloat, img: String, backgroundColor: UIColor) -> UIButton {
        
        
        let button: UIButton = {
            
            let btn = UIButton(type: .custom)
            btn.backgroundColor = backgroundColor
            btn.layer.cornerRadius = radius
            let btnImage = UIImage(named: img) as UIImage?
            btn.setImage(btnImage, for: .normal)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.imageView?.contentMode = .center
            
            return btn
            
        }()
        
        return button
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CREATE STACK VIEW
    //----------------------------------------------------------------
    
    func theHorizontalStackView(buttons: [AnyObject]) -> UIStackView{
        
        let stackView = UIStackView(arrangedSubviews: buttons as! [UIView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }
    
    
    //----------------------------------------------------------------\
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CREATE IMAGEVIEW STACK VIEW
    //----------------------------------------------------------------
    
    func theHorizontalImageViewStackView(imageViews: [UIImageView]) -> UIStackView{
        
        let stackView = UIStackView(arrangedSubviews: imageViews)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }
    
    
    //----------------------------------------------------------------\
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CREATE LABEL STACK VIEW
    //----------------------------------------------------------------
    
    func theHorizontalLabelStackView(labels: [UILabel]) -> UIStackView{
        
        let stackView = UIStackView(arrangedSubviews: labels)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }
    
    
    //----------------------------------------------------------------\
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CREATE PARENT STACK VIEW
    //----------------------------------------------------------------
    
    func theParentStackView(buttons: [UIStackView]) -> UIStackView{
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }
    
    
    //----------------------------------------------------------------\
    
}

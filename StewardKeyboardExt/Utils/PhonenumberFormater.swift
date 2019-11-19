//
//  PhonenumberFormater.swift
//  Square App
//
//  Created by test on 3/11/2017.
//  Copyright © 2017 Steward Bank. All rights reserved.
//

import Foundation
import UIKit


class PhonenumberFormater{
    
    
     func validatePhonenumber(phonenumber: String) -> String {
     
        var validatedString = ""
        
        let firstCharIndex = phonenumber.index(phonenumber.startIndex, offsetBy: 1)
        let firstChar = phonenumber.substring(to: firstCharIndex)
      
        
        
        let firstThreeCharIndex = phonenumber.index(phonenumber.startIndex, offsetBy: 3)
        let firstThreeChar = phonenumber.substring(to: firstThreeCharIndex)
   
        let plusCharIndex = phonenumber.index(phonenumber.startIndex, offsetBy: 4)
        let plusChar = phonenumber.substring(to: plusCharIndex)

        
        
        if firstChar == "+" {
            
            let stripped = String(phonenumber.characters.dropFirst(1))
            validatedString = stripped
            
            print("PLUS PHONE NUMBER: \(validatedString)")
            print("ORIGINAL NUMBER \(phonenumber)")
            
        }else if firstChar == "0"{
        
            let stripped = String(phonenumber.characters.dropFirst(1))
             validatedString = "263\(stripped)"
            
            print("ZERO PHONE NUMBER: \(validatedString)")
            
        }else if firstThreeChar == "263" {
            
            let stripped = String(phonenumber.characters.dropFirst(3))
            validatedString = "263\(stripped)"
            
             print("263 PHONE NUMBER: \(validatedString)")
            
        }else if plusChar == "+263" {
            
            let stripped = String(phonenumber.characters.dropFirst(4))
            validatedString = "263\(stripped)"
            
             print("+263 PHONE NUMBER: \(validatedString)")
       
        }else  if firstChar == "7"{
            
//            let stripped = String(phonenumber.characters.dropFirst(1))
            validatedString = "263\(phonenumber)"
            
            print("7 PHONE NUMBER: \(validatedString)")
            
        }else{
            
            validatedString = phonenumber
        }
        
        return validatedString
        
    }
    
    
    func validateContact(phonenumber: String) -> String {
        
        
        var validatedString = ""
        
        let firstCharIndex = phonenumber.index(phonenumber.startIndex, offsetBy: 1)
        let firstChar = phonenumber.substring(to: firstCharIndex)
        
        
        
        let firstThreeCharIndex = phonenumber.index(phonenumber.startIndex, offsetBy: 3)
        let firstThreeChar = phonenumber.substring(to: firstThreeCharIndex)
        
        let plusCharIndex = phonenumber.index(phonenumber.startIndex, offsetBy: 4)
        let plusChar = phonenumber.substring(to: plusCharIndex)
        
        
        if firstChar == "0"{
            
            let stripped = String(phonenumber.characters.dropFirst(1))
            
            validatedString = phonenumber
            
            print("ZERO PHONE NUMBER: \(validatedString)")
            
        }else if plusChar == "+263" {
            
            let stripped = String(phonenumber.characters.dropFirst(4))
            validatedString = "0\(stripped)"
            
            print("+263 PHONE NUMBER: \(validatedString)")
            
        }
        
        return validatedString
        
    }

}

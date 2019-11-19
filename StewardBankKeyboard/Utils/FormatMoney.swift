//
//  FormatMoney.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 11/4/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation


struct FormatMoney {
    
    
    static func changeFromStringToInt(amount: String) -> Int{
        
        let calculatedAmount = Float(amount)! * 100
        
        let finalConversion = Int(calculatedAmount)
        
        return finalConversion
    }
    
    static func changeFromStringToDouble(amount: String) -> Double{
        
        let calculatedAmount = Float(amount)! * 100
        
        let finalConversion = Double(calculatedAmount)
        
        return finalConversion
    }
    
}

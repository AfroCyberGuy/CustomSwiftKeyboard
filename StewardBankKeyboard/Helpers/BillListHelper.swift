//
//  BillListHelper.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/8/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation


struct BillListHelper {
    
    
    
    //Validate billers images
    static func showBillerImage( code: String) -> String{
        
        var code = code
        switch code{
            
        case "TELONE":
            
            code = "telone"
            
            break
            
        case "ZETDC_PPE ":
            
            code = "zetdc"
            break
            
        case "ZOL":
            
            code = "l_zol"
            
            break
            
        case "KWESETV":
            
            code = "kwesetv"
            
            break
            
        case "EDGARS":
            
            code = "l_edgars"
            
            break
            
        case "SPCA":
            
            code = "spca"
            
            break
            
            
        default : break
            
            
        }
        
        return code
        
    }
    
    
}

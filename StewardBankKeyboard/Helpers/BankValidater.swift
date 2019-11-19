//
//  BankValidater.swift
//  Square App
//
//  Created by test on 7/11/2017.
//  Copyright © 2017 Steward Bank. All rights reserved.
//

import Foundation


class BankValidater{
    

    
    func validateBankCode(bankName: String) -> String{
        
        var code: String = ""
        
        switch (bankName) {

        case "AFC":
            
            code = "AFCNZWHA"
            
            break
        case "AGRIBANK":
            code = "AGRZZWHA"
            break
        case "BANC ABC":
            code = "FMBZZWHX"
            break
        case "BARCLAYS":
            code = "BARCZWHX"
            break
        case "CABS":
            code = "CABSZWHA"
            break
        case "CBZ":
            code = "COBZZWHA"
            break
        case "ECOBANK":
            code = "ECOCZWHX"
            break
        case "FBC":
            code = "FBCPZWHA"
            break
        case "IDBZ":
            code = "ZDBLZWHA"
            break
        case "NEDBANK":
            code = "MBCAZWHX"
            break
        case "NBS":
            code = "NABYZWHA"
            break
        case "NMB":
            code = "NMBLZWHX"
            break
        case "POSB":
            code = "PWSBZWHX"
            break
        case "STANBIC BANK":
            code = "SBICZWHX"
            break
        case "STANDARD CHARTERED":
            code = "SCBLZWHX"
            break
        case "ZB":
            code = "ZBCOZWHX"
            break
            
        default: break
       
        }
        
        return code
   
    }
    
    func validateZIPITBankCode(bankName: String) -> String{
        
        var institution: String  = ""
        switch (bankName){
            
        case "AFC":
            
            institution = "605966"
            break
        case "AGRIBANK":
            institution = "504875"
            
            break
        case "BANC ABC":
            institution = "502810"
            
            break
        case "BARCLAYS":
            
            institution = "589399"
            
            break
        case "CABS":
            institution = "588892"
            break
        case "CBZ":
            institution = "601237"
            break
        case "ECOBANK":
            
            institution = "903742"
            
            break
        case "FBC":
            institution = "601704"
            break
        case "IDBZ":
            institution = "0"
            break
            
        case "NEDBANK":
            
            institution = "639136"
            
            break
        case "NBS":
            
            institution = "607995"
        
            break
            
        case "NMB":
            
            institution = "421158"
            
            break
            
            
        case "POSB":
            
            institution = "800000"
            
            break
            
            
        case "STANBIC BANK":
            institution = "504453"
            break
            
            
        case "STANDARD CHARTERED":
            
            institution = "588832"
            
            break
            
        case "ZB":
            institution = "589485"
            
            break
        default: break
       
        }
        return institution;

    }

    
    
    func bankImageDisplay(bankName: String) -> String{
        
        var bankImage: String = ""
        
        switch (bankName){
            
        case "AFC":
            
            bankImage = "I_acl"
            
            break
            
            
        case "CBZ":
            
            bankImage = "l_cbz"
            
            break
            
        case "BANC ABC":
            
            bankImage = "l_banc_abc"
            
            break
            
        case "STANBIC BANK":
            
            bankImage = "l_stanbic"
            
            break
            
            
        case "ECOBANK":
            
            bankImage = "l_ecobank"
            
            break
            
            
        case "AGRIBANK":
            
            bankImage = "l_agribank"
            
            break
      
            
            
        case "CABS":
            
            bankImage = "l_cabs"
            
            break
            
            
            
        case "POSB":
            
            bankImage = "l_posb"
            
            break
            
            
        case "STANDARD CHARTERED":
            
            bankImage = "l_stan"
            
            break
            
        case "IDBZ":
            
            bankImage = "l_idbz"
            
            break
            
            
        case "NBS":
            
            bankImage = "l_nbs"
            
            break
            
            
        case "BARCLAYS":
            
            bankImage = "l_barclays"
            
            break
            
            
        case "FBC":
            
            bankImage = "l_fbc"
            
            break
            
        case "NEDBANK":
            
            bankImage = "l_mbca"
            
            break
            
            
        case "NMB":
            
            bankImage = "l_nmb"
            
            break
            
            
        case "ZB":
            
            bankImage = "l_zb"
            
            break

        case "STEWARD BANK":
            
            bankImage = "l_steward"
            
            break

            
            
        default:
            
            bankImage = "stanchart"
            
            break
        }
        
        return bankImage
        
        
    }
    
    
    
    
}

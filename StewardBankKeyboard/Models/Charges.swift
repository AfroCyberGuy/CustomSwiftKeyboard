//
//  Charges.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 1/3/19.
//  Copyright © 2019 mac pro. All rights reserved.
//

import Foundation
import ObjectMapper

class Charges: Mappable {
    
    var statusCode: String?
    var message: String?
    var chargesResponsebody: ChargesResponseBody?
    
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        statusCode <- map["statusCode"]
        message <- map["message"]
        chargesResponsebody <- map["responseBody"]
    
        
    }
    
}


class ChargesResponseBody: Mappable {
   
    var id: Int?
    var transactionType: String?
    var chargeAmount: Double?
    var system: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        id <- map["id"]
        transactionType <- map["transactionType"]
        chargeAmount <- map["chargeAmount"]
        system <- map["system"]
    }

}


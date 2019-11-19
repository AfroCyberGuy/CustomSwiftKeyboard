//
//  PurchaseZimModel.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/11/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import ObjectMapper


class PurchaseZimModel: Mappable {
    
    var statusCode: String?
    var message: String?
    var responseBody: String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        statusCode <- map["statusCode"]
        message <- map["message"]
        responseBody <- map["responseBody"]
        
    }
}



class PurchaseZimPostModel: Mappable {
    
    var  pan: String?
    var  pinBlock: String?
    var  imei: String?
    var  transactionAmount: String?
    var  biller: String?
    var  channel: String?
    var  customerMsisdn: String?
    var  expiryDate: String?
    
    
    init(pan: String, pinBlock: String, imei: String, transactionAmount: String, biller: String, channel: String, customerMsisdn: String) {
        
        
        self.pan = pan
        self.imei = imei
        self.pinBlock = pinBlock
        self.transactionAmount = transactionAmount
        self.biller = biller
        self.channel = channel
        self.customerMsisdn = customerMsisdn
       
    }
    
    
    init(pan: String, pinBlock: String, imei: String, transactionAmount: String, biller: String, channel: String, customerMsisdn: String, expiryDate: String) {
    
        
        self.pan = pan
        self.imei = imei
        self.pinBlock = pinBlock
        self.transactionAmount = transactionAmount
        self.biller = biller
        self.channel = channel
        self.customerMsisdn = customerMsisdn
        self.expiryDate = expiryDate
       
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {

        pan <- map["pan"]
        pinBlock <- map["pinBlock"]
        imei <- map["imei"]
        transactionAmount <- map["transactionAmount"]
        biller <- map["biller"]
        channel <- map["channel"]
        customerMsisdn <- map["customerMsisdn"]
        expiryDate <- map["expiryDate"]
        
    }
    
}



//
//  ZimswitchBalanceModell.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/18/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import ObjectMapper

class ZimswitchBalanceModel: Mappable {
    
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

class ZimswitchBalancePostModel: Mappable {
    
    var  pan: String?
    var  pinBlock: String?
    var  imei: String?
    var  channel: String?
    var  customerMsisdn: String?
    
    
    init(pan: String, pinBlock: String, imei: String, channel: String, customerMsisdn: String) {
        
        
        self.pan = pan
        self.imei = imei
        self.pinBlock = pinBlock
        self.channel = channel
        self.customerMsisdn = customerMsisdn
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        pan <- map["pan"]
        pinBlock <- map["pinBlock"]
        imei <- map["imei"]
        channel <- map["channel"]
        customerMsisdn <- map["customerMsisdn"]
        
    }
    

}


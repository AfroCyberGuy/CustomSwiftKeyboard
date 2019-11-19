//
//  InternalTransferModel.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/18/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import ObjectMapper

class InternalTransferModel: Mappable {
   
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

class InternalTransferPostModel: Mappable {
    
    
    var username: String?
    var password: String?
    var imei: String?
    var phone: String?
    var account: String?
    var amount: Double?
 
    
    init(username: String, password: String, imei: String, phone: String, account: String, amount: Double) {
    
        self.username = username
        self.password = password
        self.imei = imei
        self.phone = phone
        self.account = account
        self.amount = amount
       
        
    }
    
    
    required init?(map: Map) {
        
        
    }
    
    func mapping(map: Map) {
        
        username <- map["username"]
        password <- map["password"]
        imei <- map["imei"]
        phone <- map["phone"]
        account <- map["account"]
        amount <- map["amount"]
    }
    
}



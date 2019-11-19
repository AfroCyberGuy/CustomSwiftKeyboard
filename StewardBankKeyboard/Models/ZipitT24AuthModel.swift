//
//  ZipitT24AuthModel.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/25/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import ObjectMapper


class ZipitT24AuthModel: Mappable {
    
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



class ZipitT24AuthPostModel: Mappable {
    
    var finalConversion : String?
    var destinationAccount : String?
    var destinationInstitution : String?
    var accountNumber : String?
    var mobileNumber : String?
    var channel : String?
    var currency : String?
    
    
    init(finalConversion: String, destinationAccount: String, destinationInstitution: String, accountNumber: String,
         mobileNumber: String, channel: String, currency: String) {
        
        self.finalConversion = finalConversion
        self.destinationAccount = destinationAccount
        self.destinationInstitution = destinationInstitution
        self.accountNumber = accountNumber
        self.mobileNumber = mobileNumber
        self.channel = channel
        self.currency = currency
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        finalConversion <- map["finalConversion"]
        destinationAccount <- map["destinationAccount"]
        destinationInstitution <- map["destinationInstitution"]
        accountNumber <- map["accountNumber"]
        channel <- map["channel"]
        currency <- map["currency"]
    }
    
}

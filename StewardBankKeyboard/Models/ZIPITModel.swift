//
//  InternalTransferModel.swift
//  Square App
//
//  Created by Tatenda Kabike on 14/10/2017.
//  Copyright © 2017 Steward Bank. All rights reserved.
//

import ObjectMapper

class ZIPITModel: Mappable {
    
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

class ZIPITResponseBody: Mappable {
    
    var mobileNumber: String?
    var postilionRRN: String?
    var thirdPartyReference: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        mobileNumber <- map["mobileNumber"]
        postilionRRN <- map["postilionRRN"]
        thirdPartyReference <- map["thirdPartyReference"]
    }
    
}


class ZIPITPostModel: Mappable {
    
    var amount: String?
    var destinationAccount: String?
    var accountNumber: String?
    var destinationInstitution: String?
    var mobileNumber: String?
    var channel: String?
    var debitCurrency: String?
    var token: String?
    var provider: String?
    
    
    init(amount: String, destinationAccount: String, accountNumber: String, destinationInstitution: String, mobileNumber: String,
         channel: String, debitCurrency: String, token: String, provider: String) {
        
        self.amount = amount
        self.destinationAccount = destinationAccount
        self.accountNumber = accountNumber
        self.mobileNumber = mobileNumber
        self.channel = channel
        self.debitCurrency = debitCurrency
        self.token = token
        self.provider = provider
        self.destinationInstitution = destinationInstitution

    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        amount <- map["amount"]
        destinationAccount <- map["destinationAccount"]
        accountNumber <- map["accountNumber"]
        mobileNumber <- map["mobileNumber"]
        channel <- map["channel"]
        debitCurrency <- map["debitCurrency"]
        token <- map["token"]
        provider <- map["provider"]
        destinationInstitution <- map["destinationInstitution"]
    }
    
}

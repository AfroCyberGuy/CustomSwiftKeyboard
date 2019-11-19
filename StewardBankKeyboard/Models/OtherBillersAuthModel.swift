//
//  OtherBillersAuthModel.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/25/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import ObjectMapper

class OtherBillersAuthModel: Mappable {
   
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


class OtherBillersAuthPostModel: Mappable {
    
    
    var billAccount: String?
    var billAmount: String?
    var cardReference: String?
    var channel: String?
    var debitAccountNumber: String?
    var debitCurrency: String?
    var payerMsisdn: String?
    var payerName: String?
    var provider: String?
    var providerProduct: String?
    
    init(billAccount: String,billAmount: String, cardReference: String, channel: String, debitAccountNumber: String, debitCurrency: String
    , payerMsisdn: String, provider: String, providerProduct: String) {
        
        self.billAccount = billAccount
        self.billAmount = billAmount
        self.cardReference = cardReference
        self.channel = channel
        self.debitAccountNumber = debitAccountNumber
        self.debitCurrency = debitCurrency
        self.payerMsisdn = payerMsisdn
        self.provider = provider
        self.providerProduct = providerProduct
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        billAccount <- map["billAccount"]
        billAmount <- map["billAmount"]
        cardReference <- map["cardReference"]
        channel <- map["channel"]
        debitAccountNumber <- map["debitAccountNumber"]
        debitCurrency <- map["debitCurrency"]
        payerMsisdn <- map["payerMsisdn"]
        provider <- map["provider"]
        providerProduct <- map["providerProduct"]
        
    }
    
}

//
//  OtherBillersPayModel.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/25/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import ObjectMapper


class OtherBillersPayModel: Mappable{
    
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


class OtherBillersPayPostModel: Mappable {
    
    
    var cardReference: String?
    var payerMsisdn: String?
    var payerName: String?
    var billAccount: String?
    var billAmount: String?
    var billProvider: String?
    var channel: String?
    var debitAccountnumber: String?
    var debitCurrency: String?
    var token: String?
    var provider: String?
    var providerProduct: String?
    var participantReference: String?
    
    init(cardReference: String, payerMsisdn: String,  payerName: String, billAccount: String, billAmount: String, billProvider: String,
        channel: String, debitAccountnumber: String, debitCurrency: String, token: String, provider: String, providerProduct: String,participantReference: String) {
        
        self.cardReference = cardReference
        self.payerMsisdn = payerMsisdn
        self.payerName = payerName
        self.billAccount = billAccount
        self.billAmount = billAmount
        self.billProvider = billProvider
        self.channel = channel
        self.debitAccountnumber = debitAccountnumber
        self.debitCurrency = debitCurrency
        self.token = token
        self.provider = provider
        self.providerProduct = providerProduct
        self.participantReference = participantReference
        
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        
        cardReference <- map["cardReference"]
        payerMsisdn <- map["payerMsisdn"]
        payerName <- map["payerName"]
        billAccount <- map["billAccount"]
        billAmount <- map["billAmount"]
        billProvider <- map["billProvider"]
        channel <- map["channel"]
        debitAccountnumber <- map["debitAccountnumber"]
        debitCurrency <- map["debitCurrency"]
        token <- map["token"]
        provider <- map["provider"]
        providerProduct <- map["providerProduct"]
        participantReference <- map["participantReference"]
        
    }
    
}

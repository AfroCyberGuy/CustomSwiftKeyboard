//
//  AirtimeModel.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 11/4/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import ObjectMapper

class AirtimeModel: Mappable {

    var statusCode: String?
    var message: String?
    var airtimeResponseBody: String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        statusCode <- map["statusCode"]
        message <- map["message"]
        airtimeResponseBody <- map["responseBody"]
    }
    
}


class AirtimeAuthPostModel: Mappable {
    
    var cardReference: String?
    var payerMsisdn: String?
    var payerName: String?
    var billAccount: String?
    var billAmount: Double?
    var billProvider: String?
    var channel: String?
    var debitAccountnumber: String?
    var debitCurrency: String?
    var provider: String?
    var providerProduct: String?
    
    
    init(cardReference: String, payerMsisdn: String, payerName: String, billAccount: String,
         billAmount: Double, billProvider: String, channel: String, debitAccountnumber: String, debitCurrency: String,
         provider: String, providerProduct: String) {
        
        self.cardReference = cardReference
        self.payerName = payerName
        self.payerMsisdn = payerMsisdn
        self.billAccount = billAccount
        self.billAmount = billAmount
        self.billProvider = billProvider
        self.channel = channel
        self.debitAccountnumber = debitAccountnumber
        self.debitCurrency = debitCurrency
        self.provider = provider
        self.providerProduct = providerProduct
        
    }
    

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        
        payerName <- map["payerName"]
        cardReference <- map["cardReference"]
        providerProduct <- map["providerProduct"]
        payerMsisdn <- map["payerMsisdn"]
        billAccount <- map["billAccount"]
        billAmount <- map["billAmount"]
        billProvider <- map["billProvider"]
        channel <- map["channel"]
        debitAccountnumber <- map["debitAccountnumber"]
        debitCurrency <- map["debitCurrency"]
        provider <- map["provider"]
        providerProduct <- map["providerProduct"]
        
        
        
    }
    
}


class AirtimePayModel: Mappable {
    
    
    var statusCode: String?
    var message: String?
    var airtimeResponseBody: String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        statusCode <- map["statusCode"]
        message <- map["message"]
        airtimeResponseBody <- map["responseBody"]
    }
    
}

class AirtimePayPostModel: Mappable {
    
    var cardReference: String?
    var payerMsisdn: String?
    var payerName: String?
    var billAccount: String?
    var billAmount: Int?
    var billProvider: String?
    var channel: String?
    var debitAccountnumber: String?
    var debitCurrency: String?
    var token: String?
    var provider: String?
    var providerProduct: String?
    var participantReference: String?
    
    
    init(cardReference: String, payerMsisdn: String, payerName: String, billAccount: String,
         billAmount: Int, billProvider: String,  channel: String, debitAccountnumber: String,
         debitCurrency: String, token: String, provider: String, providerProduct: String, participantReference: String) {
        
        
        self.cardReference = cardReference
        self.payerName = payerName
        self.payerMsisdn = payerMsisdn
        self.billAccount = billAccount
        self.billAmount = billAmount
        self.billProvider = billProvider
        self.channel = channel
        self.debitAccountnumber =  debitAccountnumber
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
        payerName <- map["payerName"]
        
    }
    
}

            

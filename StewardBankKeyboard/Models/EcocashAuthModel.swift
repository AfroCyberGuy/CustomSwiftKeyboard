//
//  EcocashAuthModel.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/22/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import ObjectMapper

class EcocashAuthModel: Mappable {
    
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

class EcocashAuthPostModel: Mappable {
    
    var amount: Double?
    var correlater: String?
    var reference: String?
    var status: String?
    var ecocashReference: String?
    var ecocashStatus: String?
    var phone: String?
    var id: Int?
    var channel: String?
    var biller: String?
    
   
    init(amount: Double,correlater: String, reference: String, status: String,
         ecocashReference: String, ecocashStatus: String, phone: String, id: Int, channel: String, biller: String) {
    
        
        self.amount = amount
        self.correlater = correlater
        self.reference = reference
        self.status = status
        self.ecocashReference = ecocashReference
        self.ecocashStatus = ecocashStatus
        self.phone = phone
        self.id = id
        self.channel = channel
        self.biller = biller
    }

 
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        amount <- map["amount"]
        correlater <- map["correlater"]
        reference <- map["reference"]
        status <- map["status"]
        ecocashReference <- map["ecocashReference"]
        ecocashStatus <- map["ecocashStatus"]
        phone <- map["phone"]
        id <- map["id"]
        channel <- map["channel"]
        biller <- map["biller"]
        
    }
    
}



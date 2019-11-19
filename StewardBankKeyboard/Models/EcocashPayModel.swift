//
//  EcocashPayModel.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/18/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import ObjectMapper


class EcocashPayModel: Mappable {
    
    var statusCode: String?
    var message: String?
    var responseBody: EcocashPayResponseBody?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        statusCode <- map["statusCode"]
        message <- map["message"]
        responseBody <- map["responseBody"]
        
    }
    
}


class EcocashPayResponseBody: Mappable {
   
    var amount: Double?
    var associatedCode: String?
    var correlater: String?
    var reference: String?
    var status: String?
    var ecocashReference: String?
    var ecocashStatus: String?
    var phone: String?
    var id: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        amount <- map["amount"]
        associatedCode <- map["associatedCode"]
        correlater <- map["correlater"]
        reference <- map["reference"]
        status <- map["status"]
        ecocashReference <- map["ecocashReference"]
        ecocashStatus <- map["ecocashStatus"]
        phone <- map["phone"]
        id <- map["id"]
    }
    
}


class EcocashPayPostModel: Mappable {
   
    var amount: String?
    var channel: String?
    var biller: String?
    var phone: String?

    
    
    init(amount: String, channel: String, biller: String, phone: String) {
    
        self.amount = amount
        self.channel = channel
        self.biller = biller
        self.phone = phone
   
        
    }
    

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        amount <- map["amount"]
        channel <- map["channel"]
        biller <- map["biller"]
        phone <- map["phone"]
   
        
    }
}

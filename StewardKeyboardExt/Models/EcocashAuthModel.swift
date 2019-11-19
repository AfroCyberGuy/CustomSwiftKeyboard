//
//  EcocashActivateModel.swift
//  StewardKeyboardExt
//
//  Created by mac pro on 10/11/18.
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
    
    var ecocashNumber : String?
    var phone : String?
    var imei : String?

    
    init(ecocashNumber: String, phone: String, imei: String) {
    
        self.ecocashNumber = ecocashNumber
        self.phone = phone
        self.imei = imei
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        ecocashNumber <- map["ecocashNumber"]
        phone <- map["phone"]
        imei <- map["imei"]
        
    }
    
}

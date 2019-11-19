//
//  EcocashActivateModel.swift
//  StewardKeyboardExt
//
//  Created by mac pro on 10/11/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import ObjectMapper

class SquareAuthModel: Mappable {
    
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

class SquareAuthPostModel: Mappable {
    
    var username : String?
    var password : String?
    var phone : String?
    var imei : String?

    
    init(username: String, password: String, phone: String, imei: String) {
    
        self.username = username
        self.password = password
        self.phone = phone
        self.imei = imei
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        username <- map["username"]
        password <- map["password"]
        phone <- map["phone"]
        imei <- map["imei"]
    }
    
}

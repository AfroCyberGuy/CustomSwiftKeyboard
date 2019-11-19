//
//  EcocashActivateModel.swift
//  StewardKeyboardExt
//
//  Created by mac pro on 10/11/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import ObjectMapper

class SquareActivateModel: Mappable {
    
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

class SquareActivatePostModel: Mappable {
    
    var username : String?
    var password : String?
    var phone : String?
    var imei : String?
    var otp : String?
    var phoneType: String?

    
    init(username: String, password: String, phone: String, imei: String, otp: String, phoneType: String) {
    
        self.username = username
        self.password = password
        self.phone = phone
        self.imei = imei
        self.otp = otp
        self.phoneType = phoneType
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        username <- map["username"]
        password <- map["password"]
        phone <- map["phone"]
        imei <- map["imei"]
        otp <- map["otp"]
        phoneType <- map["phoneType"]
    }
    
}

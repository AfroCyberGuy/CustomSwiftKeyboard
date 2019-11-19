//
//  ProfileAuthModel.swift
//  StewardKeyboardExt
//
//  Created by mac pro on 10/10/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import ObjectMapper


class ProfileAuthModel: Mappable {
    
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

class ProfileAuthPostModel: Mappable {
    
    var mobileNumber: String?
    var imei: String?
    
    init(mobileNumber: String, imei: String?) {
        
        
        self.mobileNumber = mobileNumber
        self.imei = imei
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        imei <- map["imei"]
        mobileNumber <- map["mobileNumber"]
        
    }
    
    
}

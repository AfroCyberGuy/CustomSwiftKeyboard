//
//  SquareBalanceModel.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/18/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import ObjectMapper

class SquareBalanceModel: Mappable {
   
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


class SquareBalancePostModel: Mappable {
    
    var phone: String?
    var username: String?
    var password: String?
    
    
    init(phone: String, username: String, password: String) {
    
       self.phone = phone
       self.username = username
       self.password = password
        
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        phone <- map["phone"]
        username <- map["username"]
        password <- map["password"]
    }
}

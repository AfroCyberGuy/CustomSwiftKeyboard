//
//  SquarePurchaseModel.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 11/16/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import ObjectMapper

class SquarePurchaseModel: Mappable {
   
    var username: String?
    var password: String?
    var phone: String?
    var amount: Double?
    var biller: String?
    
    init(username: String, password: String, phone: String, amount: Double, biller: String) {
        
        self.username = username
        self.password = password
        self.phone = phone
        self.amount = amount
        self.biller = biller
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        username <- map["username"]
        password <- map["password"]
        phone <- map["phone"]
        amount <- map["amount"]
        biller <- map["biller"]
        
    }
    
}

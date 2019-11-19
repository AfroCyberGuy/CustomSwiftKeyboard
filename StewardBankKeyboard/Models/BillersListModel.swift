//
//  BillersListModel.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 10/2/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import UIKit


class BillersListModel {
    
    var billImage: String?
    var billerName: String?
    var billerCode: String?
    
    
    init(billImage: String, billerName: String, billerCode: String) {

        self.billImage = billImage
        self.billerName = billerName
        self.billerCode = billerCode
    }
    
}

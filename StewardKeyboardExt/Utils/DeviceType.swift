//
//  DeviceType.swift
//  StewardKeyboardExt
//
//  Created by mac pro on 10/11/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import Device_swift

struct DeviceType {
    
    static func phoneType() -> String {
        
        return UIDevice.current.deviceType.rawValue
    }
}

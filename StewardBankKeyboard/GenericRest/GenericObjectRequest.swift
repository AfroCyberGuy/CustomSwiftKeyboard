//
//  GenericObjectRequest.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 9/12/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

enum BackendError: Error {
    case network(error: Error) // Capture any underlying Error from the URLSession API
    case dataSerialization(error: Error)
    case jsonSerialization(error: Error)
    case xmlSerialization(error: Error)
    case objectSerialization(reason: String)
}

protocol ResponseObjectSerializable {
    
     init?(response: HTTPURLResponse, representation: Any)
}

extension DataRequest {
    
    
    
    
    
    
}

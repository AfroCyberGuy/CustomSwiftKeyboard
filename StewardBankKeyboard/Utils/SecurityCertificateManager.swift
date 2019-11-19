//
//  SecurityCertificateManager.swift
//  Square App
//
//  Created by Tatenda Kabike on 25/10/2017.
//  Copyright © 2017 Steward Bank. All rights reserved.
//

import Foundation
import Alamofire

class SecurityCertificateManager {
    static let sharedInstance = SecurityCertificateManager()

    
//    manager.session.configuration.timeoutIntervalForRequest = 30
    

    let defaultManager: Alamofire.SessionManager = {
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "mobilebanking.stewardbank.co.zw": .disableEvaluation]

        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 30

        return Alamofire.SessionManager(
            configuration: configuration,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
    }()
    
    
//    let defaultManager: Alamofire.SessionManager = {
//        let serverTrustPolicies: [String: ServerTrustPolicy] = [
//            "endpoint.digitalbanking.stewardbank.co.zw": .disableEvaluation]
//
//        let configuration = URLSessionConfiguration.default
//        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
//        configuration.timeoutIntervalForRequest = 30
//
//        return Alamofire.SessionManager(
//            configuration: configuration,
//            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
//        )
//    }()
    
    
    
    //MARK LOCAL
//    let defaultManager = Alamofire.SessionManager.default
    
//    MARK: - REQUEST MANAGER
//    let defaultManager: Alamofire.SessionManager = {
//
//        return Alamofire.SessionManager.default
//    }()
}




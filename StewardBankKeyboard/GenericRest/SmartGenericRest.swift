//
//  SmartGenericRest.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 9/12/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper
import Alamofire

class SmartGenericREST {
    
    let headers: HTTPHeaders = ["Content-Type": "application/json"]
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- GET SINGLE JSON OBJECT
    //----------------------------------------------------------------
    
    
    func getDataFromNetwork<T: Mappable>(urlString: String, completion: @escaping(T?, NSError?) -> Void) {
        
        SecurityCertificateManager.sharedInstance.defaultManager
            .request(urlString, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseObject{(response: DataResponse<T>) in
                
                guard response.result.isSuccess else {
                    print("Error while fetching: \(response.result.error!)")
                    
                    completion(nil, response.result.error! as NSError)
                    
                    return
                }
                
                if let responseObject = response.result.value {
                    
                    print(responseObject)
                    completion(responseObject, nil)
                }
                
        }

    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- GET JSON ARRAY
    //----------------------------------------------------------------
    
    func getDataCollectionFromNetwork<T: Mappable>(urlString: String, completion: @escaping ([T]?, NSError?) -> Void) {
        
        SecurityCertificateManager.sharedInstance.defaultManager
            .request(urlString, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseArray{ ( response: DataResponse<[T]>) in
                
                guard response.result.isSuccess else {
                     print("Error while fetching: \(response.result.error!)")
                     completion(nil, response.result.error! as NSError)
                    
                    return
                    
                }
                
                if let responseObject = response.result.value {
                    
                    print(responseObject)
                    completion(responseObject, nil)
                }
                
        }
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- GET JSON ARRAY WITH KEY PATH
    //----------------------------------------------------------------
    
    func getDataCollectionWithKeyPathFromNetwork<T: Mappable>(urlString: String, keyPath: String, completion: @escaping([T]?, NSError?) -> Void) {
        
        SecurityCertificateManager.sharedInstance.defaultManager
            .request(urlString, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseArray{( response: DataResponse<[T]>) in
                
                guard response.result.isSuccess else {
                    
                    print("Error while fetching: \(response.result.error!)")
                    completion(nil, response.result.error! as NSError)
                    
                    return
                }
                
                if let responseObject = response.result.value {
                    
                    print(responseObject)
                    completion(responseObject, nil)
                }
        }
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- POST WITH SINGLE OBJECT RESPONSE
    //----------------------------------------------------------------
    
    func postDataWithObjectResponse<T: Mappable>(urlString: String, parameters: [String : Any], completion: @escaping (T?, NSError?) -> Void) {
        
        SecurityCertificateManager.sharedInstance.defaultManager
            .request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseObject{( response: DataResponse<T>) in
             
                guard response.result.isSuccess else {
                    
                     print("Error while fetching: \(response.result.error!)")
                     completion(nil, response.result.error! as NSError)
                    
                     return
                }
                
                if let responseObject = response.result.value {
                    
                    print(responseObject)
                    completion(responseObject, nil)
                }
        
        }
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- POST WITH ARRAY RESPONSE
    //----------------------------------------------------------------
    
    func postDataWithArrayResponse<T: Mappable>(urlString: String, parameters: [String : Any], completion: @escaping ([T]?, NSError?) -> Void) {
        
        SecurityCertificateManager.sharedInstance.defaultManager
            .request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseArray{ ( response: DataResponse<[T]>) in
                
                guard response.result.isSuccess else {
                    
                    print("Error while fetching: \(response.result.error!)")
                    
                    completion(nil, response.result.error! as NSError)
                    
                    return
                }
                
                if let responseObject = response.result.value {
                    print(responseObject)
                    completion(responseObject, nil)
                }
        }
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    //-------------------------------------------------------------------
    // MARK:-
    // MARK:- POST WITH ARRAY RESPONSE WITH KEY PATH
    //-------------------------------------------------------------------
    
    func postDataWithArrayResponseKeyPath<T: Mappable>(urlString: String, keyPath: String, parameters: [String : Any], completion: @escaping ([T]?, NSError?) -> Void) {
        
        SecurityCertificateManager.sharedInstance.defaultManager
            .request(urlString, method: .post,parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseArray(keyPath: keyPath) {(response: DataResponse<[T]>) in
            
            guard response.result.isSuccess else {
               
                print("Error while fetching: \(response.result.error!)")
                
                completion(nil, response.result.error! as NSError)
                
                return
            }
            
                if let responseObject = response.result.value {
                    
                    print(responseObject)
                    
                    completion(responseObject, nil)
                }
        }
    
    }
    
    //----------------------------------------------------------------
    

}

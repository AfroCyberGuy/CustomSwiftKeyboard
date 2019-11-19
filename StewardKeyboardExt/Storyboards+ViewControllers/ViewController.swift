//
//  ViewController.swift
//  StewardKeyboardExt
//
//  Created by mac pro on 8/27/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func gotoHomeScreen(_ sender: Any) {
        
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        self.present(newViewController, animated: true, completion: nil)
        
        let parameters = Mapper().toJSON(ProfileAuthPostModel(mobileNumber: "263771222254", imei: SharedPreference.getIMEI()))
        let url = BaseEndPoint.LOCAL_BASE_URL + "/api/sosho/socialMedia/secured/sosho/createProfileAuth"
        
    
        SmartGenericREST().postDataWithObjectResponse(urlString: url, parameters: parameters) { (response: ProfileAuthModel?, error) in
            
            ANLoader.pulseAnimation = true
            ANLoader.activityColor = .purple
            ANLoader.showLoading("Sending information", disableUI: false)
            
            print("CREATE PROFILE URL: \(url)")
            print("CREATE PROFILE PARAMS: \(parameters)")
            
            if error != nil {
                
                ANLoader.hide()
                print("ERROR: \(error!.localizedFailureReason!)")
                
                
            }else {
                
                ANLoader.hide()
                print(response!.toJSONString(prettyPrint: true)!)
                
                print(response!.message!)
            }
        }
        
    
    }
    

}


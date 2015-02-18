//
//  API.swift
//  RailsRequest
//
//  Created by Jeanie House on 2/17/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

import Foundation



let API_URL = "https://warm-spire-6158.herokuapp.com/"



class APIRequest {
    
    class func requestWithOptions(options: [String: AnyObject], andCompletion completion: (responseInfo: [String:AnyObject]) -> ()) {
       
        
        var url = NSURL(string: API_URL + (options["endpoint"] as String))
        var request = NSMutableURLRequest(URL: url!)
        
        request.HTTPMethod = options["method"] as String
        
        ////BODY
        
        let bodyInfo = options["body"] as [String:AnyObject]
        
        let requestData = NSJSONSerialization.dataWithJSONObject(bodyInfo, options: NSJSONWritingOptions.allZeros, error: nil)
        let jsonString = NSString(data: requestData!, encoding: NSUTF8StringEncoding)
        let postLength = "\(jsonString!.length)"
        
        request.setValue(postLength, forHTTPHeaderField: "Content-Length")
        let postData = jsonString?.dataUsingEncoding(NSASCIIStringEncoding, allowLossyConversion: true)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = postData
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            
            if error == nil {
                
                //do something with data
                
                let json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: nil) as [String:AnyObject]
                
                 completion(responseInfo: json)
                
            }else{
                
                println(error)
                
            
            
         }
            
      }
        
    
        
    }
    
}


private let _currentUser = User()

class User {
    
    var token: String? {
        
        didSet {
            
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(token, forKey: "token")
            defaults.synchronize()
         
            
        }
        
        
    }
    
    init() {
        
         let defaults = NSUserDefaults.standardUserDefaults()
         token = defaults.objectForKey("token") as? String 
    
    
    
    }
 
    class func currentUser() -> User { return _currentUser }
    
    
    func getUserToken() {
    
        let options: [String:AnyObject] = [
            
        "endpoint" : "users",
        "method" : "POST",
        "body" : [
        
            "user" : [ "email" : "macho_man_alanmatthews2@gmail.com", "password" : "nachooooescheese"]
            
            
        ]
        
        
    ]
        
        APIRequest.requestWithOptions(options, andCompletion: { (responseInfo) -> () in
            
            println(responseInfo)
            
            let dataInfo = responseInfo["user"] as [String:String]
            self.token = dataInfo["token_auth"]
            
            
            // do something here after the request is done
            
        })
        
        // APIRequest.requestWithOptions(options, andCompletion: { (responseInfo) -> () in
            
            
            //do something else here
            
            
        //})
    
    }
    
    


    
    
    
    
    
    
    
    
    
}//END





//
//  LoginViewController.swift
//  Checkers
//
//  Created by Jeanie House on 2/18/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBOutlet weak var buttonBottomConstraint: NSLayoutConstraint!
    
    
    @IBAction func login(sender: AnyObject) {
        
        if let token = User.currentUser().token {
            
            println(token)
            
        }else{
            
            User.currentUser().getUserToken(usernameField.text, password: passwordField.text)
            
            
            
        }
        
        

        
    }
    
   override func viewDidLoad() {
        super.viewDidLoad()
    

    
    
    
    
    
    
    
    
    
    NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillShowNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
        
        var kbSize = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size
        
        self.buttonBottomConstraint.constant = 20 + kbSize!.height
        
        // self.view.frame.origin.y = -kbSize.height
        
        self.view.layoutIfNeeded()
        
    }
    
    
    NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillHideNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
        
        
        self.buttonBottomConstraint.constant = 20
        
        
        self.view.layoutIfNeeded()
        
    }
    
    }
    
    
    
    
//    @IBAction func login(sender: AnyObject) {
//     
//        var username:NSString = usernameField.text
//        var password:NSString = passwordField.text
//        
//        if ( username.isEqualToString("") || password.isEqualToString("") ) {
//            
//            var alertView:UIAlertView = UIAlertView()
//            alertView.title = "Sign in Failed!"
//            alertView.message = "Please enter Username and Password"
//            alertView.delegate = self
//            alertView.addButtonWithTitle("OK")
//            alertView.show()
//        } else {
//            
//            var post:NSString = "email=\(usernameField.text)&password=\(passwordField.text)"
//            
//            println(post)
//            
//            var url:NSURL = NSURL(string: "https://warm-spire-6158.herokuapp.com/")!
//            
//            var postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!
//            
//            var postLength:NSString = String( postData.length )
//            
//            var request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
//            request.HTTPMethod = "POST"
//            request.HTTPBody = postData
//            request.setValue(postLength, forHTTPHeaderField: "Content-Length")
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            request.setValue("application/json", forHTTPHeaderField: "Accept")
//            
//            
//            var reponseError: NSError?
//            var response: NSURLResponse?
//            
//            var urlData: NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse:&response, error:&reponseError)
//            
//            if ( urlData != nil ) {
//                let res = response as NSHTTPURLResponse!;
//                
//                println(res.statusCode)
//                
//                if (res.statusCode >= 200 && res.statusCode < 300)
//                {
//                    var responseData:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
//                    
//                    println(responseData)
//                    
//                    var error: NSError?
//                    
//                    let jsonData:NSDictionary = NSJSONSerialization.JSONObjectWithData(urlData!, options:NSJSONReadingOptions.MutableContainers , error: &error) as NSDictionary
//                    
//                    
//                    let success:NSInteger = jsonData.valueForKey("success") as NSInteger
//                    
//                    //[jsonData[@"success"] integerValue];
//                    
//                    println(success)
//                    
//                    if(success == 1)
//                    {
//                        NSLog("Login SUCCESS");
//                        
//                        var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
//                        prefs.setObject(username, forKey: "USERNAME")
//                        prefs.setInteger(1, forKey: "ISLOGGEDIN")
//                        prefs.synchronize()
//                        
//                        self.dismissViewControllerAnimated(true, completion: nil)
//                    } else {
//                        var error_msg:NSString
//                        
//                        if jsonData["error_message"] as? NSString != nil {
//                            error_msg = jsonData["error_message"] as NSString
//                        } else {
//                            error_msg = "Unknown Error"
//                        }
//                        var alertView:UIAlertView = UIAlertView()
//                        alertView.title = "Sign in Failed!"
//                        alertView.message = error_msg
//                        alertView.delegate = self
//                        alertView.addButtonWithTitle("OK")
//                        alertView.show()
//                        
//                    }
//                    
//                } else {
//                    var alertView:UIAlertView = UIAlertView()
//                    alertView.title = "Sign in Failed!"
//                    alertView.message = "Connection Failed"
//                    alertView.delegate = self
//                    alertView.addButtonWithTitle("OK")
//                    alertView.show()
//                }
//            } else {
//                var alertView:UIAlertView = UIAlertView()
//                alertView.title = "Sign in Failed!"
//                alertView.message = "Connection Failure"
//                if let error = reponseError {
//                    alertView.message = (error.localizedDescription)
//                }
//                alertView.delegate = self
//                alertView.addButtonWithTitle("OK")
//                alertView.show()
//            }
//        }
//        
//    }
//
//
//        // Do any additional setup after loading the view.
//    


    
    
    
   

    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

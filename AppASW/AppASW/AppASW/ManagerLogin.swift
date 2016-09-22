//
//  ManagerLogin.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 21/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import Foundation


public class ManagerLogin{

    static public var bodyStr: String = ""
    static public var token:String = ""

    static public func getlogin(user:String, password:String,result:(result:Bool)->(Void)) {
        
        //var flag: Bool = false
        
       /* if (user == "" || password == "") {
            let alertView = UIAlertController(title: "Login failed",
                                              message: "Wrong username or password." as String, preferredStyle:.Alert)
            let okAction = UIAlertAction(title: "Try Again!", style: .Default, handler: nil)
            alertView.addAction(okAction)
            //self.presentViewController(alertView, animated: true, completion: nil)
            //flag=false
            result(result: false)
            //return
        }else{*/
            
            
            
            // Build the body message to request the token to the web app
            self.bodyStr = "grant_type=password&username=" + user + "&password=" + password;
            
            // Setup the request
            let myURL = NSURL(string: "http://192.168.1.2/WSTRH/Token")!
            let request = NSMutableURLRequest(URL: myURL)
            request.HTTPMethod = "POST"
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            //request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.HTTPBody = bodyStr.dataUsingEncoding(NSUTF8StringEncoding)!
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
                (data, response, error) -> Void in
                if let unwrappedData = data {
                    print(unwrappedData)
                    print("------")
                    print(data)
                    print("------")
                    
                    do {
                        
                        // Convert the Json object to an array of dictionaries
                        let tokenDictionary:NSDictionary = try NSJSONSerialization.JSONObjectWithData(unwrappedData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                        
                        // Get the token
                        self.token = tokenDictionary["access_token"] as! String
                        //flag=true
                        print("------")
                        print(token)
                        print("------")
                        
                        // Keep record of the token
                        //let saveToken:Bool = KeychainWrapper.setString(token, forKey: "access_token")
                        result(result: true)
                        
                        
                        
                        
                    }
                        
                    catch {
                        result(result: false)
                        //flag=true
                        
                        //                            // Setup the alert
                        //                            let alertView = UIAlertController(title: "Login failed",
                        //                                                              message: "Wrong username or password." as String, preferredStyle:.Alert)
                        //                            let okAction = UIAlertAction(title: "Try Again!", style: .Default, handler: nil)
                        //                            alertView.addAction(okAction)
                        //                            //self.presentViewController(alertView, animated: true, completion: nil)
                        //                            return flag
                    }
                    
                }
                // result(result: false)
            }
            
            task.resume()
        //}
        //return
        
        
    }

    


}
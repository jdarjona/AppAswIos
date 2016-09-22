//
//  ManagerJson.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 21/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import Foundation
import EVReflection

public class ManagerJson {

    static public var basicURL: String = "http://192.168.1.2/WSTRH/%@"
    static public var bodyStr: String = ""

    static public func getList<T where T:EVObject>(result: T, Url: String, DatosCallBack:(datosCallBack:[T])->Void){
        
        
        let urlAPI = String(format: basicURL, Url)
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlAPI)!
        //result = [T]()
        
        // Make the POST call and handle it in a completion handler
        session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            // Make sure we get an OK response
            
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            // Read the JSON
            do {
                if let ipString = NSString(data:data!, encoding: NSUTF8StringEncoding) {
                    
                    
                    let dataJSON = ipString as String
                    let resultJson = [T](json: dataJSON)
                    DatosCallBack(datosCallBack:resultJson)
                    
                    
                }
            } catch {
                print("bad things happened")
            }
        }).resume();
        
        
    }
    
    static func getJson(Url:String,DatosCallBack:(json:String)->()) -> () {
        
        let urlAPI = String(format: basicURL, Url)
        let session = NSURLSession.sharedSession()
        
        //let urlDefinitva = String(urlAPI.characters.map { $0 == "/" ? "_" : $0 })
        let url = NSURL(string: urlAPI)!
        //result = [T]()
        
        // Make the POST call and handle it in a completion handler
        session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            // Make sure we get an OK response
            
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            // Read the JSON
            do {
                if let ipString = NSString(data:data!, encoding: NSUTF8StringEncoding) {
                    
                    
                    let dataJSON = ipString as String
                    DatosCallBack(json:dataJSON)
                    
                    
                }
            } catch {
                print("bad things happened")
            }
        }).resume();
        
    }
    

    static public func updateJson<T where T:EVObject>(dato: T, Url: String, DatosCallBack:(json:String) -> Void) -> () {
    
       // let urlAPI = String(format: basicURL, Url)
        //let session = NSURLSession.sharedSession()
        //let url = NSURL(string: urlAPI)!
        
        self.bodyStr = dato.toJsonString()
        
        // Setup the request
        let myURL = NSURL(string: Url)!
        let request = NSMutableURLRequest(URL: myURL)
        request.HTTPMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
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
                    if let ipString = NSString(data:data!, encoding: NSUTF8StringEncoding) {
                        
                        
                        let dataJSON = ipString as String
                        DatosCallBack(json:dataJSON)
                        
                        
                    }

                }
                catch {
                
                }
            }
        
        }
        
            task.resume()
            
        }
}

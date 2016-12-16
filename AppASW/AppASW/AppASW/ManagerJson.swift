//
//  ManagerJson.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 21/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import ObjectMapper
import Alamofire

open class ManagerJson {

    //static public var basicURL: String = "http://192.168.1.2/WSTRH/%@"
    //Alamofire.request("https://httpbin.org/get")
    static open var basicURL: String = "" //"http://intranet.trh-be.com/WSTRH/%@"
    static open var bodyStr: String = ""
    static open var basicURLTok: String = ""
    
    
    
    enum WifiEmpresa: String{
        case wifiSevilla = "TRH_Admin"
        case wifiLiege = "TRH Liege"
        case wifiLiege2 = "TRH_admin"
    }
    
    enum Empresa: String{
        case Sevilla = "Sevilla"
        case Liege = "Liege"
    }
    
    
    
    static var empresaSeleccionada: Empresa = .Sevilla{
        
        
        didSet{
            let  ssid = AppDelegate.fetchSSIDInfo()
            let  wifiEmpresa  = WifiEmpresa.wifiSevilla.rawValue
            
            
            if empresaSeleccionada == .Sevilla{
               
                if(ssid == wifiEmpresa ){
                    
                    basicURL = "http://192.168.1.2/WSTRH/%@"
                    basicURLTok = "http://192.168.1.2/WSTRH/Token"
                }else {
                    
                    basicURL = "http://intranet.trh-es.com/WSTRH/%@"
                    basicURLTok = "http://intranet.trh-es.com/WSTRH/Token"
                }

            }
            
            if (empresaSeleccionada == .Liege){
                
                if ((ssid==String(describing: WifiEmpresa.wifiLiege.rawValue) || ssid==String(describing: WifiEmpresa.wifiLiege2.rawValue) || ssid=="")){
                           
                    basicURL = "http://192.168.1.2/WSTRH/%@"
                    basicURLTok = "http://192.168.1.2/WSTRH/Token"
                    
                }else {
                    
                    basicURL = "http://intranet.trh-be.com/WSTRH/%@"
                    basicURLTok = "http://intranet.trh-be.com/WSTRH/Token"
                }
            }
        }
    }
    
//    
//    
//    static func establecerRuta(conect: String,ssid: String){
//        
//        let tabEmpresa="Sevilla"
//        
//        if (ssid == "TRH_Admin" || ssid == "TRH Admin"){
//            basicURL = "http://192.168.1.2/WSTRH/%@"
//        }else if(tabEmpresa=="Sevilla"){
//            basicURL = "http://intranet.trh-es.com/WSTRH/%@"
//        }else{
//            basicURL = "http://intranet.trh-be.com/WSTRH/%@"
//        }
//        
//    }
    
    

    static open func getList<T>(_ result: T, Url: String, DatosCallBack:@escaping (_ datosCallBack:[T])->Void) where T:Mappable{
                
        let urlAPI = String(format: basicURL, Url)
        
        let url = URL(string: urlAPI)!
        
        /*Alamofire.request("https://httpbin.org/get").validate().responseJSON { response in
            switch response.result {
            case .success:
                print("Validation Successful")
            case .failure(let error):
                print(error)
            }
        }       */
        let token:String = NSString(format: "Bearer %@" , ManagerLogin.token) as String //"Bearer \(ManagerLogin.token)"
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared.dataTask(with: request, completionHandler: { ( data, response, error) -> Void in
            // Make sure we get an OK response
            if error != nil {
                
                print(error!.localizedDescription)
                
            } else {
                
                do {
            
//            guard let realResponse = response as? HTTPURLResponse ,
//                realResponse.statusCode == 200 else {
//                    
//                    print("Not a 200 response")
//                    if let repuesta = response as? HTTPURLResponse {
//                        print(repuesta.statusCode)
//                        if let errores = NSString(data:data!, encoding: String.Encoding.utf8.rawValue) {
//                        
//                         print(errores)
//                        }
//                       
//                        
//                    }
//                    
//                    return
//            }
            
            // Read the JSON
           // do {
                    if let datos=data {
                        
                        if let ipString = NSString(data:(datos), encoding: String.Encoding.utf8.rawValue) {
                            
                            
                          
                            let dataJSON:String? = ipString as String
                            if dataJSON != "null"{
                                let resultJson = [T](JSONString: dataJSON!)
                                //let resultJson = [T](dataJSON)
                                DatosCallBack(resultJson!)
                            }else{
                                print("Devolcion de null a la llamada   \(urlAPI)")
                            }
                            
                        
                            
                            
                        }
                    
                    }else {
                    
                        print("Devolcion de null a la llamada   \(urlAPI)")
                    }
                
            } catch {
                print("bad things happened")
            }
            }
        })
        session.resume();
        
        
    }
    
    static func getJson(_ Url:String,DatosCallBack:@escaping (_ json:String)->()) -> () {
        
        let urlAPI = String(format: basicURL, Url)
        let url = URL(string: urlAPI)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(ManagerLogin.token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared.dataTask(with: request, completionHandler: { ( data, response, error) -> Void in
            // Make sure we get an OK response
            if error != nil {
                
                print(error!.localizedDescription)
                
            } else {
                
                do {
//            guard let realResponse = response as? HTTPURLResponse ,
//                realResponse.statusCode == 200 else {
//                    print("Not a 200 response")
//                    return
//            }
//            
//            // Read the JSON
//            do {
                if let ipString = NSString(data:data!, encoding: String.Encoding.utf8.rawValue) {
                    
                    
                    let dataJSON = ipString as String
                    let resultJson = (JSONString: dataJSON)
                    DatosCallBack(resultJson)
                    
                    
                }
            } catch {
                print("bad things happened")
            }
            }
        })
        session.resume();
        
    }
    
    static func postJson(_ Url:String,DatosCallBack:@escaping (_ json:String)->()) -> () {
        
        let urlAPI = String(format: basicURL, Url)
        let url = URL(string: urlAPI)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(ManagerLogin.token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared.dataTask(with: request, completionHandler: { ( data: Data?, response: URLResponse?, error: NSError?) -> Void in
            
            
            guard let realResponse = response as? HTTPURLResponse ,
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    if let repuesta = response as? HTTPURLResponse {
                            print(repuesta.statusCode)
                            print(data)
                    
                    }
                    
                    
                    return
            }
            
            // Read the JSON
            do {
                if let ipString = NSString(data:data!, encoding: String.Encoding.utf8.rawValue) {
                    
                    
                    let dataJSON = ipString as String
                    DatosCallBack(dataJSON)
                    
                    
                }
            } catch {
                print("bad things happened")
            }
        
        } as! (Data?, URLResponse?, Error?) -> Void)
            session.resume()
    
    }
    static open func updateJson<T>(_ dato: T, Url: String, DatosCallBack:@escaping (_ json:String) -> Void) -> () where T:Mappable {
    
       // let urlAPI = String(format: basicURL, Url)
        //let session = NSURLSession.sharedSession()
        //let url = NSURL(string: urlAPI)!
        
        self.bodyStr =  dato.toJSONString()!
        
        // Setup the request
        //let myURL = NSURL(string: Url)!
        let urlAPI = String(format: basicURL, Url)
        let myURL = URL(string: urlAPI)!

        var request = URLRequest(url: myURL)
        request.httpMethod = "PUT"
        request.setValue("Bearer \(ManagerLogin.token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = bodyStr.data(using: String.Encoding.utf8)!
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: {
            (data, response, error) -> Void in
            if let unwrappedData = data {
                print(unwrappedData)
                print("------")
                print(data)
                print("------")
        
                do {
                    if let ipString = NSString(data:data!, encoding: String.Encoding.utf8.rawValue) {
                        
                        
                        let dataJSON = ipString as String
                        DatosCallBack(dataJSON)
                        
                        
                    }

                }
                catch {
                
                }
            }
        
        }) 
        
            task.resume()
            
        }
}

//
//  AccesoDatos.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 6/7/16.
//  Copyright © 2016 Juande. All rights reserved.
//
import Foundation
import UIKit
import EVReflection
import SystemConfiguration
import NetworkExtension
import SystemConfiguration.CaptiveNetwork
public class AccesoDatos: NSObject {
    
    public var basicURL: String = "http://192.168.1.2/WSTRH/%@"
    public var bodyStr: String = ""
    
    /*func fetchSSIDInfo() ->  String {
        var currentSSID = ""
        let interfaces = CNCopySupportedInterfaces()
        if interfaces != nil {
            let interfacesArray = Array(arrayLiteral: interfaces)
            if interfacesArray.count > 0 {
                let interfaceName =  String(interfacesArray[0])
                let unsafeInterfaceData = CNCopyCurrentNetworkInfo(interfaceName)
                if unsafeInterfaceData != nil {
                    let interfaceData = unsafeInterfaceData.takeRetainedValue() as Dictionary!
                    currentSSID = interfaceData[kCNNetworkInfoKeySSID] as! String
                    let ssiddata = NSString(data:interfaceData[kCNNetworkInfoKeySSIDData]! as! NSData, encoding:NSUTF8StringEncoding) as! String
                    // ssid data from hex
                    print(ssiddata)
                }
            }
        }
        return currentSSID    }
    
    */
    
    public func getlogin(user:String, password:String,result:(result:Bool)->(Void)) {
    
        //var flag: Bool = false
        
        if (user == "" || password == "") {
            let alertView = UIAlertController(title: "Login failed",
                                              message: "Wrong username or password." as String, preferredStyle:.Alert)
            let okAction = UIAlertAction(title: "Try Again!", style: .Default, handler: nil)
            alertView.addAction(okAction)
            //self.presentViewController(alertView, animated: true, completion: nil)
            //flag=false
            result(result: false)
            //return
        }else{
        
        
                
                // Build the body message to request the token to the web app
                self.bodyStr = "grant_type=password&username=" + user + "&password=" + password;
                
                // Setup the request
                let myURL = NSURL(string: "http://intranet.trh-be.com/WSTRH/Token")!
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
                            let token:String = tokenDictionary["access_token"] as! String
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
        }
        //return
        
        
    }
    
        private func isConnetedToNetWork() -> Bool {
        
            var hotspotQueue:dispatch_queue_t{
                return dispatch_get_main_queue()
            }
        
        
        let prueba = NEHotspotHelper.registerWithOptions([kNEHotspotHelperOptionDisplayName: "Hotspot"], queue: hotspotQueue, handler: {(cmd: NEHotspotHelperCommand) -> Void in
            
            
            
            for item in cmd.networkList!{
                
                
                print(item.SSID)
                
            }
        })
            return prueba
            
    }
    private func getList<T where T:EVObject>(result: T, Url: String, DatosCallBack:(datosCallBack:[T])->Void){
        
        
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
    
    func getJson(Url:String,DatosCallBack:(json:String)->()) -> () {

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
    
    func getListMonitorizacion(result:(result:[MonitorCarga])->Void)->Void{
        //isConnetedToNetWork()
        //fetchSSIDInfo()
        let listMonitor: MonitorCarga = MonitorCarga()
        let url = "api/ListadoMonitorizacion"
        getList(listMonitor, Url: url , DatosCallBack: {(datosCallBack: [MonitorCarga])->Void in
            
            result(result:datosCallBack)
        })
        
    }
    
    func getPedido(codPedido:String, result:(result:PedidoVenta)->Void)->Void{
        
        let codPedidoUrl = String(codPedido.characters.map { $0 == "/" ? "_" : $0 })
        var url = "api/Pedidos?codPedido=%@"
        url = String(format: url,codPedidoUrl)
        //let pedidoVenta: PedidoVenta = PedidoVenta()
        getJson(url ,DatosCallBack:{(json:String)->Void in
            
            let pedido = PedidoVenta(json:json)
            
            result(result:pedido)
        })
        
    }
    
    func getOferta(codOferta:String, result:(result:OfertaVenta)->Void)->Void{
        
        let codOfertaUrl = String(codOferta)
        var url = "api/Ofertas?codOferta=%@"
        url = String(format: url,codOfertaUrl)
        //let pedidoVenta: PedidoVenta = PedidoVenta()
        getJson(url ,DatosCallBack:{(json:String)->Void in
            
            let oferta = OfertaVenta(json:json)
            
            result(result:oferta)
        })
        
    }

    /*private func get<T where T:NSObject>(result: T, Url: String, DatosCallBack:(datosCallBack:T)->Void){
        
        
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
                    let resultJson = T(json: dataJSON)
                    DatosCallBack(datosCallBack:resultJson)
                    
                    
                }
            } catch {
                print("bad things happened")
            }
        }).resume();
        
        
    }*/



    
    
}

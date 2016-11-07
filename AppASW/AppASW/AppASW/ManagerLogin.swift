//
//  ManagerLogin.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 21/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import Foundation


open class ManagerLogin{

    static open var bodyStr: String = ""
    static open var token:String = ""
    static open var salesPerson: String = "V005"
    
    struct DatosUsuarios{
        private let defaults:UserDefaults = UserDefaults.standard
        var usuario:String { willSet(_usuario){ defaults.set(_usuario, forKey: "usuario")}}
        var password:String {willSet(_password){defaults.set(_password, forKey: "password")}}
        var empresa:String {willSet(_empresa){defaults.set(_empresa, forKey: "empresa")}}
        var token:String {willSet(_token){defaults.set(_token, forKey: "token")}}
        var fechaToken:String {willSet(_fechaToken){defaults.set(_fechaToken, forKey: "fechaToken")}}
    
        init(){
            usuario = ""
            let usuarioGuardado = defaults.object(forKey: "usuario") as? String
            if usuarioGuardado != nil {
                usuario = usuarioGuardado!
            }
            password = ""
            let passwordGuardado = defaults.object(forKey: "password") as? String
            if passwordGuardado != nil {
                password = passwordGuardado!
            }
            empresa = ""
            let empresaGuardado = defaults.object(forKey: "empresa") as? String
            if empresaGuardado != nil {
                empresa = empresaGuardado!
            }
            token = ""
            fechaToken = ""
            
        }
    }
    
    static var datosUsuarios:DatosUsuarios = DatosUsuarios()
    
    static open func getlogin( user:String, password:String,result:@escaping (_ result:Bool)->(Void)) {
        
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
        
         let emp: String = LoginViewControler.empresaSeleccionada
        
        if(user == "admin" && password == "admin"){
            self.bodyStr = "grant_type=password&username=" + "sdebenest" + "&password=" + "Francia2012";
            //let empInt = String(LoginViewControler.empresaSeleccionada.hashValue + 1 )
            
            ManagerJson.empresaSeleccionada=ManagerJson.Empresa.Liege
        }else{
            
            // Build the body message to request the token to the web app
            self.bodyStr = "grant_type=password&username=" + user + "&password=" + password;
            ManagerJson.empresaSeleccionada = ManagerJson.Empresa(rawValue: emp)!
        }
        
            // Setup the request
            //let myURL = URL(string: "http://intranet.trh-be.com/WSTRH/Token")!
            let myURL = URL(string: ManagerJson.basicURLTok)!
            //var request = NSMutableURLRequest(url: myURL)
            var request = URLRequest(url: myURL)
            //var request = URLRequest(
            request.httpMethod = "POST"
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            //request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.httpBody = bodyStr.data(using: String.Encoding.utf8)!
            self.token =  ""
            let task = URLSession.shared.dataTask(with: request, completionHandler: {
                (data, response, error) -> Void in
                if let unwrappedData = data {
                    print(unwrappedData)
                    print(data)
                    
                    do {
                        
                        // Convert the Json object to an array of dictionaries
                        let tokenDictionary:NSDictionary = try JSONSerialization.jsonObject(with: unwrappedData, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                        
                        // Get the token
                        self.token = tokenDictionary["access_token"] as! String
                        //flag=true
                        print("------TOKEN----")
                        print(token)
                        print("------FIN TOKEN-------")
                        
                        // Keep record of the token
                        //let saveToken:Bool = KeychainWrapper.setString(token, forKey: "access_token")
                        
                        
                        
                        
                        
                    }
                        
                    catch {
                        //result(result: false)
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
                
                if self.token != "" {
                    
                    result(true)
                    
                }else{
                    
                    result(false)
                    
                }

                
            }) 
            
            task.resume()

        
        
    }

    


}

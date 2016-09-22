//
//  Log.swift
//  AppASW
//
//  Created by Administrador on 20/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import Foundation
import UIKit

class LoginViewControler:UIViewController{
  
    let datos:AccesoDatos = AccesoDatos()
    var logon:Bool = false
    
    @IBOutlet weak var usuarioTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    @IBAction func AceptarLoginTouchUpInside(sender: UIButton) {
        
        let usuario: String = self.usuarioTextField.text!
        let password: String = self.passwordTextField.text!
        
        let spinner: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
        spinner.startAnimating()
        
        if usuario != "" || password != "" {
            
            ManagerLogin.getlogin(usuario, password: password,result: {(result: Bool)->Void in

                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MenuLateral")
                    self.presentViewController(viewController, animated: true, completion: nil)
                })
                
                
                
                
                
                
                
                
                
                
                
                
//                dispatch_async(dispatch_get_main_queue(), {
//                    
//                    spinner.stopAnimating()
//                    
//                    if result{
//                        self.performSegueWithIdentifier("Login", sender: self)
//                    }else{
//                        let alertView = UIAlertController(title: "Error en Login",
//                        message: "Usuario o Password incorrectos." as String, preferredStyle:.Alert)
//                        let okAction = UIAlertAction(title: "Intentelo de nuevo!", style: .Default, handler: nil)
//                        alertView.addAction(okAction)
//                        self.presentViewController(alertView, animated: true, completion: nil)
//                    }
//                })
            })
            
        }else{
            
            let alertView = UIAlertController(title: "Error en Login",
                                              message: "Usuario o Password incorrectos." as String, preferredStyle:.Alert)
            let okAction = UIAlertAction(title: "Intentelo de nuevo!", style: .Default, handler: nil)
            alertView.addAction(okAction)
            self.presentViewController(alertView, animated: true, completion: nil)
            
        }
        
    }

}


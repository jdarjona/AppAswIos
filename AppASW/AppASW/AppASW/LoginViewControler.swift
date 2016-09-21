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
        
        
            
            
        self.datos.getlogin(self.usuarioTextField.text!, password: self.passwordTextField.text!,result: {(result: Bool)->Void in
        dispatch_async(dispatch_get_main_queue(), {
                
            if result{
                self.performSegueWithIdentifier("Login", sender: self)
            }else{
              let alertController = UIAlertController(title: "Autentificación", message:
              "No Autorizada", preferredStyle: UIAlertControllerStyle.Alert)
              alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
              self.presentViewController(alertController, animated: true, completion: nil)
            }
        })
    })
            
            
        
        
        
    }
    
    /*override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        print("No ze que aze ezto")
        return true

    }
*/
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        

    }
}


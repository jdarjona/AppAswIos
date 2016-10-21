//
//  Log.swift
//  AppASW
//
//  Created by Administrador on 20/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import Foundation
import UIKit

class LoginViewControler:UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
  
    let datos:AccesoDatos = AccesoDatos()
    var logon:Bool = false
    
    
    @IBOutlet weak var usuarioTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    

    @IBOutlet weak var picker: UIPickerView!
    
    var pickerData = ["Sevilla", "Liege"]
    static var empresaSeleccionada: String = ""

    
    @IBAction func AceptarLoginTouchUpInside(_ sender: UIButton) {
        
        
        let usuario: String = self.usuarioTextField.text!
        let password: String = self.passwordTextField.text!
        //LoginViewControler.empresaSeleccionada = pickerData[]
        
        let spinner: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 150, height: 150)) as UIActivityIndicatorView
        spinner.startAnimating()
        
        if usuario != "" || password != "" {
            
            ManagerLogin.getlogin(usuario, password: password,result: {(result: Bool)->Void in

                DispatchQueue.main.async(execute: { () -> Void in
                    
                    if result{
                        ManagerVentas.initialize()
                        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "rootController")
                        self.present(viewController, animated: true, completion: nil)
                        
                    }else{
                        let alertView = UIAlertController(title: "Error en Login",
                                                message: "Usuario o Password incorrectos." as String, preferredStyle:.alert)
                                                let okAction = UIAlertAction(title: "Intentelo de nuevo!", style: .default, handler: nil)
                                                alertView.addAction(okAction)
                                                self.present(alertView, animated: true, completion: nil)
                    }
                })
            })
            
        }else{
            
            let alertView = UIAlertController(title: "Error en Login",
                                              message: "Usuario o Password incorrectos." as String, preferredStyle:.alert)
            let okAction = UIAlertAction(title: "Intentelo de nuevo!", style: .default, handler: nil)
            alertView.addAction(okAction)
            self.present(alertView, animated: true, completion: nil)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoginViewControler.empresaSeleccionada = pickerData[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         LoginViewControler.empresaSeleccionada = pickerData[row]
    }

}


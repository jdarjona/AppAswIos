//
//  Log.swift
//  AppASW
//
//  Created by Administrador on 20/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications


class LoginViewControler:UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
  
    let datos:AccesoDatos = AccesoDatos()
    var logon:Bool = false
    
    @IBOutlet weak var activityInicator: UIActivityIndicatorView!
    
    
    @IBOutlet weak var usuarioTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    

    @IBOutlet weak var picker: UIPickerView!
    
    
    var pickerData = ["Sevilla", "Liege"]
    static var empresaSeleccionada: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Permiso Notificaciones
        LoginViewControler.empresaSeleccionada = pickerData[0]
        if ManagerLogin.datosUsuarios.empresa != "" {
        
            let position = pickerData.index(of: ManagerLogin.datosUsuarios.empresa)
            
            if position != nil {
                picker.selectRow(position!, inComponent: 0, animated: false)
                //picker.selectedRow(inComponent: position!)
                LoginViewControler.empresaSeleccionada = pickerData[position!]
            }
            
        }
        
     
        //Rescatamos datos configuracion
        usuarioTextField.text = ManagerLogin.datosUsuarios.usuario
        passwordTextField.text = ManagerLogin.datosUsuarios.password
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Actions

    @IBAction func AceptarLoginTouchUpInside(_ sender: UIButton) {
        
        
        // Request Notification Settings
        /*UNUserNotificationCenter.current().getNotificationSettings { (notificationSettings) in
            switch notificationSettings.authorizationStatus {
            case .notDetermined:
                self.requestAuthorization(completionHandler: { (success) in
                    guard success else { return }
                    
                    // Schedule Local Notification
                    self.scheduleLocalNotification()
                })
            case .authorized:
                // Schedule Local Notification
                self.scheduleLocalNotification()
            case .denied:
                print("Application Not Allowed to Display Notifications")
            }
        }*/

        
        let usuario: String = self.usuarioTextField.text!
        let password: String = self.passwordTextField.text!
        //LoginViewControler.empresaSeleccionada = pickerData[]
        
        let spinner: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 150, height: 150)) as UIActivityIndicatorView
        spinner.startAnimating()
        
        if usuario != "" || password != "" {
            print("Usuario: \(usuario) Password \(password) Empresa Seleccionada: \(LoginViewControler.empresaSeleccionada)")
            self.activityInicator.startAnimating()
            ManagerLogin.getlogin(user: usuario, password: password,result: {(result: Bool)->Void in

                DispatchQueue.main.async(execute: { () -> Void in
                    
                    self.activityInicator.stopAnimating()
                    if result{
                        
                        //Guardamos el usuario y contraseña si es la primera vez
                        
                        if ManagerLogin.datosUsuarios.password == "" {
                            ManagerLogin.datosUsuarios.password = password
                        }
                        if ManagerLogin.datosUsuarios.usuario == "" {
                            ManagerLogin.datosUsuarios.usuario = usuario
                        }
                        if ManagerLogin.datosUsuarios.empresa == "" {
                            ManagerLogin.datosUsuarios.empresa = LoginViewControler.empresaSeleccionada
                        }
                        
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
    
    
    // MARK: - Private Methods
    
    private func requestAuthorization(completionHandler: @escaping (_ success: Bool) -> ()) {
        // Request Authorization
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (success, error) in
            if let error = error {
                print("Request Authorization Failed (\(error), \(error.localizedDescription))")
            }
            
            completionHandler(success)
        }
    }

    private func scheduleLocalNotification() {
        // Create Notification Content
        let notificationContent = UNMutableNotificationContent()
        
        // Configure Notification Content
        notificationContent.title = "Cocoacasts"
        notificationContent.subtitle = "Local Notifications"
        notificationContent.body = "In this tutorial, you learn how to schedule local notifications with the User Notifications framework."
        
        // Add Trigger
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 10.0, repeats: false)
        
        // Create Notification Request
        let notificationRequest = UNNotificationRequest(identifier: "cocoacasts_local_notification", content: notificationContent, trigger: notificationTrigger)
        
        // Add Request to User Notification Center
        UNUserNotificationCenter.current().add(notificationRequest) { (error) in
            if let error = error {
                print("Unable to Add Notification Request (\(error), \(error.localizedDescription))")
            }
        }
    }


}

extension LoginViewControler: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert])
    }
    
}

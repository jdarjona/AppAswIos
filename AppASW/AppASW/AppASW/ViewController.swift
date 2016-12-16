//
//  ViewController.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 3/7/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import UIKit
import Firebase
import DropDown
import UserNotifications

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,UITabBarDelegate{

    var listaMonitorizacion: NSMutableArray = NSMutableArray()
    var listaMonitorizacion2: [MonitorCarga] = []
    
    var ref:FIRDatabaseReference!
    let urlLieja = "Pedidos/TRH Liege"
    let urlSevilla = "Pedidos/TRH"
    var firebaseHadled:UInt = 0
    
    var rightMenu = DropDown()
    var ordernDescente = true
    var ordenSeleccionado = -1
    let datos:AccesoDatos = AccesoDatos()
    let app = UIApplication.shared

    
    @IBOutlet weak var tablaViewMonitorizacion: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tabBarMonitorizacion: UITabBar!
    
    @IBOutlet weak var labelCodPedido: UILabel!
    
    @IBOutlet weak var tabBarItemSevilla: UITabBarItem!
    @IBOutlet weak var tabBarItemLiege: UITabBarItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes))
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        // Por defecto seleccionamos el primer tab
        if(LoginViewControler.empresaSeleccionada == "Liege"){
            tabBarMonitorizacion.selectedItem = tabBarItemLiege
            ManagerJson.empresaSeleccionada = .Liege
        }else{
            tabBarMonitorizacion.selectedItem = tabBarItemSevilla
            ManagerJson.empresaSeleccionada = .Sevilla
        }
        
        getListadoMonitorizacion()
        
        self.ref = FIRDatabase.database().reference()
        
        
        
        let menuTextos = ["Ordenar por fecha","Ordenar por estado", "Ordenar por cliente", "Ordenar por comercial"]
        
        self.rightMenu.anchorView = view
        self.rightMenu.dataSource = menuTextos
        self.rightMenu.selectionAction = { [weak self] (index: Int, item: String)  in
            if self!.ordenSeleccionado == index{
                self!.ordernDescente = !self!.ordernDescente
            }else{
            
                self!.ordernDescente = true
            }
            self!.ordenSeleccionado = index
            switch index{
            case 0:
                if (self!.ordernDescente) {
                    self!.listaMonitorizacion2 = self!.listaMonitorizacion2.sorted(by: { $0.Fecha_Carga_Requerida.compare($1.Fecha_Carga_Requerida  ) == .orderedDescending })
                }else{
                    self!.listaMonitorizacion2 = self!.listaMonitorizacion2.sorted(by: { $0.Fecha_Carga_Requerida.compare($1.Fecha_Carga_Requerida ) == .orderedAscending })
                }
           case 1:
            if (self!.ordernDescente) {
                 self!.listaMonitorizacion2 = self!.listaMonitorizacion2.sorted(by: { $0.Estado>$1.Estado})
            }else{
                 self!.listaMonitorizacion2 = self!.listaMonitorizacion2.sorted(by: { $0.Estado<$1.Estado})
            }

                

           case 2:
                if (self!.ordernDescente) {
                    self!.listaMonitorizacion2 = self!.listaMonitorizacion2.sorted(by: { $0.Nombre_Agencia>$1.Nombre_Agencia})
                }else{
                    self!.listaMonitorizacion2 = self!.listaMonitorizacion2.sorted(by: { $0.Nombre_Agencia<$1.Nombre_Agencia})
                }
                
            case 3:
                if (self!.ordernDescente) {
                    self!.listaMonitorizacion2 = self!.listaMonitorizacion2.sorted(by: { $0.inicialesComercial>$1.inicialesComercial})
                }else{
                    self!.listaMonitorizacion2 = self!.listaMonitorizacion2.sorted(by: { $0.inicialesComercial<$1.inicialesComercial})
                }

                
            default:
                self!.listaMonitorizacion2 = self!.listaMonitorizacion2.sorted(by: { $0.Fecha_Carga_Requerida.compare($1.Fecha_Carga_Requerida ) == .orderedAscending })

            }
            
            self!.activityIndicator.startAnimating()
            self!.app.beginIgnoringInteractionEvents()
            DispatchQueue.main.async(execute: {
                
                
                
                self!.tablaViewMonitorizacion.reloadData()
                self!.app.endIgnoringInteractionEvents()
                self!.activityIndicator.stopAnimating()
            })
            print(index)
        }
        
        let rightButton = UIBarButtonItem(title: "Orden", style: .plain, target: self, action: #selector(ViewController.showRightDropdown))
            //UIBarButtonItem(image: UIImage(named: "Orden"), style: .Plain, target: self, action: #selector(ViewController.showRightDropdown))
        
        self.navigationItem.rightBarButtonItem = rightButton
        //self.navigationItem.setRightBarButtonItem(rightButton, animated: false)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        var url:String
        if ManagerJson.empresaSeleccionada == .Liege {
            url = self.urlLieja
        }else{
            url = self.urlSevilla
        }
        
        firebaseHadled = ref.child(url).observe(FIRDataEventType.childChanged, with: { (data) in
           // self.getListadoMonitorizacion()
            
            
            let pedido = data.value as! NSDictionary
            
            let codPedido:String = pedido["codPedido"]! as! String
            let descripcion:String = pedido["descripcion"]! as! String
            
            let cargas:[MonitorCarga] = self.listaMonitorizacion2.filter({$0.Cod__Agrupacion_Pedido == codPedido})
            
            for carga in cargas {
                carga.estadoDescripcion = descripcion
                carga.Estado = pedido["estado"]! as! Int
            }
            
            DispatchQueue.main.async(execute: {
                self.tablaViewMonitorizacion.reloadData()
                self.app.endIgnoringInteractionEvents()
                self.activityIndicator.stopAnimating()
            })

            
          })
 
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.ref.removeAllObservers()
        
        /*if firebaseHadled != 0 {
        
            self.ref.removeObserver(withHandle: firebaseHadled)
        }*/
    }
    
    func showRightDropdown() {
        if self.rightMenu.isDescendant(of: self.view) == true {
            self.rightMenu.hide() //hideMenu()
        } else {
            self.rightMenu.show() // showMenuFromView(self.view)
        }
    }
    
    
    func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        
        if (sender.direction == .left) {
           
            if self.tabBarMonitorizacion.selectedItem !=  self.tabBarItemLiege {
                self.tabBarMonitorizacion.selectedItem =  self.tabBarItemLiege
                tabBar(self.tabBarMonitorizacion, didSelect: self.tabBarItemLiege)
            }
            
            //self.tabBarMonitorizacion.selectedItem =  self.tabBarItemLiege
        }
        
        if (sender.direction == .right) {
            
            if self.tabBarMonitorizacion.selectedItem !=  self.tabBarItemSevilla {
                self.tabBarMonitorizacion.selectedItem =  self.tabBarItemSevilla
                tabBar(self.tabBarMonitorizacion, didSelect: self.tabBarItemSevilla)
            }
            //self.tabBarMonitorizacion.selectedItem =  self.tabBarItemSevilla
         
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: FireBase
    
  
    // MARK: TableView

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //var numeroPedidoEnRuta = 0
        
        let pedidosEnRuta:[MonitorCarga] = self.listaMonitorizacion2.filter({ $0.Estado == 6 })
        var tmPedidosRutaDouble:Double = 0
        for pedido in pedidosEnRuta {
                
           tmPedidosRutaDouble += pedido.pesoKg/1000
        }
        
        let tmPedidosRuta:Int = Int(round(tmPedidosRutaDouble))
        let fechaHoy = Date()
        let pedidosPendienteRuta:[MonitorCarga] = self.listaMonitorizacion2.filter({ fechaHoy.compare($0.Fecha_Carga_Requerida ) == .orderedDescending || fechaHoy.compare($0.Fecha_Carga_Requerida ) == .orderedSame })
        
        //var numeroPedidoPendienteRuta = 0
        var tmPedidoPendienteRutaDouble:Double = 0
        
        for pedido in pedidosPendienteRuta {
                
                tmPedidoPendienteRutaDouble += pedido.pesoKg/1000
        }
        
        let tmPedidoPendienteRuta: Int = Int(round(tmPedidoPendienteRutaDouble))
        
        
        let pedidosEnCarga:[MonitorCarga] = self.listaMonitorizacion2.filter({$0.Estado == 3 || $0.Estado == 4 || $0.Estado == 5 })
        var tmPedidosEnCargaDouble:Double = 0
        for pedido in pedidosEnCarga{
            
                tmPedidosEnCargaDouble += pedido.pesoKg/1000
            
        }
        let tmPedidoEnCarga:Int = Int(round(tmPedidosEnCargaDouble))
        
        let title = NSString(format: "%d Tm enviadas de %d previstas hoy", tmPedidosRuta , tmPedidoPendienteRuta ) as String
        let subTitle = NSString(format: "%d Tm en carga",tmPedidoEnCarga) as String
        
        self.navigationItem.titleView = setTitle(title, subtitle: subTitle)
        
        let numeroFila = self.listaMonitorizacion2.count
        
        return numeroFila
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MonitorCell") as MonitorTableViewCell;
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MonitorCell", for: indexPath) as! MonitorTableViewCell
        
        cell.codPedido = self.listaMonitorizacion2[(indexPath as NSIndexPath).row].Cod__Agrupacion_Pedido
        cell.codPedidoLabel?.text = NSString(format: "%@-%@", self.listaMonitorizacion2[(indexPath as NSIndexPath).row].Cod__Agrupacion_Pedido,self.listaMonitorizacion2[(indexPath as NSIndexPath).row].Cod__Pedido_Transporte) as String //self.listaMonitorizacion[indexPath.row]["Cod__Agrupacion_Pedido"] as? String
        cell.clienteLabel?.text = self.listaMonitorizacion2[(indexPath as NSIndexPath).row].Nombre_Agencia//self.listaMonitorizacion[indexPath.row]["Nombre_Agencia"] as? String
        let inicialesComercial = self.listaMonitorizacion2[(indexPath as NSIndexPath).row].inicialesComercial //self.listaMonitorizacion[indexPath.row]["inicialesComercial"] as? String
        cell.comercialLabel?.text = inicialesComercial;
        cell.estadoLabel?.text = self.listaMonitorizacion2[(indexPath as NSIndexPath).row].estadoDescripcion //self.listaMonitorizacion[indexPath.row]["estadoDescripcion"] as? String
        let estado: Int = self.listaMonitorizacion2[(indexPath as NSIndexPath).row].Estado//(self.listaMonitorizacion[indexPath.row]["Estado"] as? Int)!
        cell.estadoLabel?.backgroundColor = colorEstado(estado)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat="dd/MM/yy"
        //let fecha = dateFormatter.string(from: self.listaMonitorizacion2[(indexPath as NSIndexPath).row].Fecha_Carga_Requerida )

        cell.fechaLabel?.text = dateFormatter.string(from: self.listaMonitorizacion2[(indexPath as NSIndexPath).row].Fecha_Carga_Requerida )
        
        /*
        let fechaCargaRequerida = self.listaMonitorizacion[indexPath.row]["Fecha_Carga_Requerida"] as? String
        cell.fechaLabel?.text = ""
                dateFormatter.dateFormat="yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        if fechaCargaRequerida != nil {
           let dateFechaCargaRequerida = dateFormatter.dateFromString(fechaCargaRequerida!)
           cell.fechaLabel?.text = dateFormatter.stringFromDate(dateFechaCargaRequerida!)
        }
        */
     
        
        
        
        
        
        return cell;
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let identicador = segue.identifier {
        
            if identicador == "DetallePedido" {
            
                if let destinationVC = segue.destination as? DetallePedidoViewController {
                    let celda = sender as! MonitorTableViewCell
                    destinationVC.datos = self.datos
                    destinationVC.codigoPedido = celda.codPedido
                }
            }
        }
    }
    
    // MARK: Tab
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        switch item.tag {
        case 0:
            ManagerJson.empresaSeleccionada = .Liege
          
        case 1:
            ManagerJson.empresaSeleccionada = .Sevilla
            
        default:
            break

        }
        getListadoMonitorizacion()
    }
    
    
    // MARK: Fin Tab

    
        func colorEstado(_ estado: Int ) -> UIColor{
    
        switch estado {
        case 0:
            return UIColor.red
            
        case 1:
             return UIColor.red
            
        case 2:
             return UIColor.orange
            
        case 3:
             return UIColor.white
            
            
        case 4:
             return UIColor.white
            
        case 5:
             return UIColor.green
            
        case 6:
             return UIColor.green
            
            
        default:
             return UIColor.red
        }
    
    }
    func getListadoMonitorizacion(){
    
        /*//Configurar activityIndicator
        tablaViewMonitorizacion.backgroundView = activityIndicator
        tablaViewMonitorizacion.separatorStyle = UITableViewCellSeparatorStyle.none
        //self.activityIndicatorView = activityIndicatorView
        tablaViewMonitorizacion.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //tablaViewMonitorizacion.register(UITableViewCell.self, forCellReuseIdentifier: "cell")*/
        self.activityIndicator.startAnimating()
        app.beginIgnoringInteractionEvents()
            datos.getListMonitorizacion({(result:[MonitorCarga])->Void in
        
        
                self.listaMonitorizacion2 = result.sorted(by: { $0.Fecha_Carga_Requerida.compare($1.Fecha_Carga_Requerida ) == .orderedAscending })
                
                DispatchQueue.main.async(execute: {
                    
                    
                    
                    self.tablaViewMonitorizacion.reloadData()
                    self.app.endIgnoringInteractionEvents()
                    self.activityIndicator.stopAnimating()
                })
                
            
        
            })
    }
    
    func setTitle(_ title:String, subtitle:String) -> UIView {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: -5, width: 0, height: 0))
        
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = UIColor.gray
        titleLabel.font = UIFont.boldSystemFont(ofSize: 12)
        titleLabel.textAlignment = .center
        titleLabel.text = title
        titleLabel.sizeToFit()
        
        let subtitleLabel = UILabel(frame: CGRect(x: 0, y: 18, width: 0, height: 0))
        subtitleLabel.textAlignment = .center
        subtitleLabel.backgroundColor = UIColor.clear
        subtitleLabel.textColor = UIColor.black
        subtitleLabel.font = UIFont.systemFont(ofSize: 8)
        subtitleLabel.text = subtitle
        subtitleLabel.sizeToFit()
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: max(titleLabel.frame.size.width, subtitleLabel.frame.size.width), height: 30))
        titleLabel.frame = CGRect(x: 0, y: 0, width: max(titleLabel.frame.size.width, subtitleLabel.frame.size.width), height: 15)
        subtitleLabel.frame = CGRect(x: 0, y: 15, width: max(titleLabel.frame.size.width, subtitleLabel.frame.size.width), height: 28)
        titleView.addSubview(titleLabel)
        titleView.addSubview(subtitleLabel)
        
       // let widthDiff = subtitleLabel.frame.size.width - titleLabel.frame.size.width
        
        
        
       /* if widthDiff > 0 {
            let widthLabel = subtitleLabel.frame.width
            var frame = CGRectMake(0, widthLabel + widthDiff/2, 0, 0)titleLabel.frame
            //frame.origin.x = subtitleLabel.frame.width//widthDiff / 2
            frame.origin = frame.width + widthDiff/2
            titleLabel.frame = CGRectIntegral(frame)
        } else {
            var frame = subtitleLabel.frame
            //frame.origin.x = subtitleLabel.frame.width//abs(widthDiff) / 2
            titleLabel.frame = CGRectIntegral(frame)
        }*/
        
        return titleView
    }
    
    /*func notificacion(codigoPedido:String, estadoDescripcion:String){
    
        
        UNUserNotificationCenter.current().getNotificationSettings { (notificationSettings) in
            switch notificationSettings.authorizationStatus {
            case .notDetermined:
                let center = UNUserNotificationCenter.current();
                center.requestAuthorization(completionHandler: { (success, error) in
                    guard success else { return }
                    
                    // Schedule Local Notification
                    //self.scheduleLocalNotification()
                    // Create Notification Content
                    let notificationContent = UNMutableNotificationContent()
                    
                    // Configure Notification Content
                    notificationContent.title = estadoDescripcion
                    notificationContent.subtitle = "Pedido \(codigoPedido)"
                    notificationContent.body = "Estado \(estadoDescripcion)"
                    
                    // Add Trigger
                    let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 2.0, repeats: false)
                    
                    // Create Notification Request
                    let notificationRequest = UNNotificationRequest(identifier: "cocoacasts_local_notification", content: notificationContent, trigger: notificationTrigger)
                    
                    // Add Request to User Notification Center
                    UNUserNotificationCenter.current().add(notificationRequest) { (error) in
                        if let error = error {
                            print("Unable to Add Notification Request (\(error), \(error.localizedDescription))")
                        }
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                })
            case .authorized:
                // Schedule Local Notification
                //self.scheduleLocalNotification()
                let notificationContent = UNMutableNotificationContent()
                
                // Configure Notification Content
                notificationContent.title = estadoDescripcion
                notificationContent.subtitle = "Pedido \(codigoPedido)"
                notificationContent.body = "Estado \(estadoDescripcion)"
                
                // Add Trigger
                let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 2.0, repeats: false)
                
                // Create Notification Request
                let notificationRequest = UNNotificationRequest(identifier: "cocoacasts_local_notification", content: notificationContent, trigger: notificationTrigger)
                
                // Add Request to User Notification Center
                UNUserNotificationCenter.current().add(notificationRequest) { (error) in
                    if let error = error {
                        print("Unable to Add Notification Request (\(error), \(error.localizedDescription))")
                    }
                }
                
            case .denied:
                print("Application Not Allowed to Display Notifications")
            }
        }
        
     
    
    
    }*/

}

extension ViewController: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert])
    }
    
}



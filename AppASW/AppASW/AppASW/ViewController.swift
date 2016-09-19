//
//  ViewController.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 3/7/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import UIKit
import Firebase
import AZDropdownMenu


class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,UITabBarDelegate{

    var listaMonitorizacion: NSMutableArray = NSMutableArray()
    var listaMonitorizacion2: [MonitorCarga] = []
    var ref:FIRDatabaseReference!
    let notification = UILocalNotification()
    var rightMenu: AZDropdownMenu?
    var ordernDescente = true
    var ordenSeleccionado = -1
    let datos:AccesoDatos = AccesoDatos()
    
    
    @IBOutlet weak var tablaViewMonitorizacion: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tabBarMonitorizacion: UITabBar!
    
    @IBOutlet weak var labelCodPedido: UILabel!
    
    @IBOutlet weak var tabBarItemSevilla: UITabBarItem!
    @IBOutlet weak var tabBarItemLiege: UITabBarItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.translucent = false
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes))
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        // Por defecto seleccionamos el primer tab
        tabBarMonitorizacion.selectedItem = tabBarItemLiege
        
        
        getListadoMonitorizacion()
        
        self.ref = FIRDatabase.database().reference()
        let notificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
        initFireBase()
        
        let menuTextos = ["Ordenar por fecha","Ordenar por estado", "Ordenar por cliente", "Ordenar por comercial"]
        self.rightMenu = AZDropdownMenu(titles: menuTextos)
        self.rightMenu!.cellTapHandler = { [weak self] (indexPath: NSIndexPath) -> Void in
            if self!.ordenSeleccionado == indexPath.row {
                self!.ordernDescente = !self!.ordernDescente
            }else{
            
                self!.ordernDescente = true
            }
            self!.ordenSeleccionado = indexPath.row
            switch indexPath.row {
            case 0:
                if (self!.ordernDescente) {
                    self!.listaMonitorizacion2 = self!.listaMonitorizacion2.sort({ $0.Fecha_Carga_Requerida.compare($1.Fecha_Carga_Requerida) == .OrderedDescending })
                }else{
                    self!.listaMonitorizacion2 = self!.listaMonitorizacion2.sort({ $0.Fecha_Carga_Requerida.compare($1.Fecha_Carga_Requerida) == .OrderedAscending })
                }
           case 1:
            if (self!.ordernDescente) {
                 self!.listaMonitorizacion2 = self!.listaMonitorizacion2.sort({ $0.Estado>$1.Estado})
            }else{
                 self!.listaMonitorizacion2 = self!.listaMonitorizacion2.sort({ $0.Estado<$1.Estado})
            }

                

           case 2:
                if (self!.ordernDescente) {
                    self!.listaMonitorizacion2 = self!.listaMonitorizacion2.sort({ $0.Nombre_Agencia>$1.Nombre_Agencia})
                }else{
                    self!.listaMonitorizacion2 = self!.listaMonitorizacion2.sort({ $0.Nombre_Agencia<$1.Nombre_Agencia})
                }
                
            case 3:
                if (self!.ordernDescente) {
                    self!.listaMonitorizacion2 = self!.listaMonitorizacion2.sort({ $0.inicialesComercial>$1.inicialesComercial})
                }else{
                    self!.listaMonitorizacion2 = self!.listaMonitorizacion2.sort({ $0.inicialesComercial<$1.inicialesComercial})
                }

                
            default:
                self!.listaMonitorizacion2 = self!.listaMonitorizacion2.sort({ $0.Fecha_Carga_Requerida.compare($1.Fecha_Carga_Requerida) == .OrderedAscending })

            }
            
            
            dispatch_async(dispatch_get_main_queue(), {
                
                
                
                self!.tablaViewMonitorizacion.reloadData()
            })
            print(indexPath.row)
        }
        
        let rightButton = UIBarButtonItem(title: "Orden", style: .Plain, target: self, action: #selector(ViewController.showRightDropdown))
            //UIBarButtonItem(image: UIImage(named: "Orden"), style: .Plain, target: self, action: #selector(ViewController.showRightDropdown))
        
        self.navigationItem.rightBarButtonItem = rightButton
        //self.navigationItem.setRightBarButtonItem(rightButton, animated: false)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func showRightDropdown() {
        if self.rightMenu?.isDescendantOfView(self.view) == true {
            self.rightMenu?.hideMenu()
        } else {
            self.rightMenu?.showMenuFromView(self.view)
        }
    }
    
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        
        if (sender.direction == .Left) {
           
            if self.tabBarMonitorizacion.selectedItem !=  self.tabBarItemLiege {
                self.tabBarMonitorizacion.selectedItem =  self.tabBarItemLiege
                tabBar(self.tabBarMonitorizacion, didSelectItem: self.tabBarItemLiege)
            }
            
            //self.tabBarMonitorizacion.selectedItem =  self.tabBarItemLiege
        }
        
        if (sender.direction == .Right) {
            
            if self.tabBarMonitorizacion.selectedItem !=  self.tabBarItemSevilla {
                self.tabBarMonitorizacion.selectedItem =  self.tabBarItemSevilla
                tabBar(self.tabBarMonitorizacion, didSelectItem: self.tabBarItemSevilla)
            }
            //self.tabBarMonitorizacion.selectedItem =  self.tabBarItemSevilla
         
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: FireBase
    
    func initFireBase()->(){
    
        
        
        /*ref.child("Pedidos/TRH Liege").observeSingleEventOfType(.Value, withBlock: { (snapshot) in
            // Get user value
            let username = snapshot.value!
            
            print(username)
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }*/
        
        let refHandle = ref.child("Pedidos/TRH Liege").observeEventType(FIRDataEventType.ChildChanged, withBlock: { (snapshot) in
            let postDict = snapshot.value as! [String : AnyObject]
            print(postDict)
            
            
            var codigoPedido = ""
            var estado = ""
            
            for (key, value) in postDict {
            
                switch key {
                
                    case "codPedido" :
                     codigoPedido = value as! String
                    break
                    case "descripcion" :
                        estado = value as! String
                    break
                    
                    default: break
                }
                
                
                
                
            }
            let settings = UIApplication.sharedApplication().currentUserNotificationSettings()
            if settings!.types == .None {
                let ac = UIAlertController(title: "Can't schedule", message: "Either we don't have permission to schedule notifications, or we haven't asked yet.", preferredStyle: .Alert)
                ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                self.presentViewController(ac, animated: true, completion: nil)
                return
            }
            
         
            
            self.notification.fireDate = NSDate(timeIntervalSinceNow: 2)
            self.notification.alertBody = NSString(format: "%@" , estado) as String
            self.notification.alertAction = NSString(format: "%@ %@", codigoPedido, estado) as String
            self.notification.alertTitle = NSString(format: "%@", codigoPedido) as String

           
            
            self.notification.soundName = UILocalNotificationDefaultSoundName
            self.notification.userInfo = ["codPedido": codigoPedido, "estado" : estado]
            
            UIApplication.sharedApplication().scheduleLocalNotification(self.notification)
           
            // ...
        })
        print(refHandle)

        
        
        
    }

    // MARK: TableView

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //var numeroPedidoEnRuta = 0
        
        let pedidosEnRuta:[MonitorCarga]? = self.listaMonitorizacion2.filter({ $0.Estado == 6 })
        var tmPedidosRuta:Int = 0
        if let _pedidosEnRuta = pedidosEnRuta {
        
           // numeroPedidoEnRuta = _pedidosEnRuta.count
            for pedido in _pedidosEnRuta {
                
                tmPedidosRuta += Int(pedido.pesoKg/1000)
            }
        }
        
        let fechaHoy = NSDate()
        let pedidosPendienteRuta:[MonitorCarga]? = self.listaMonitorizacion2.filter({ fechaHoy.compare($0.Fecha_Carga_Requerida) == .OrderedDescending || fechaHoy.compare($0.Fecha_Carga_Requerida) == .OrderedSame })
        
        //var numeroPedidoPendienteRuta = 0
        var tmPedidoPendienteRuta: Int = 0
        if let _pedidosPendienteRuta = pedidosPendienteRuta {
          //  numeroPedidoPendienteRuta = _pedidosPendienteRuta.count
            for pedido in _pedidosPendienteRuta {
                
                tmPedidoPendienteRuta += Int(pedido.pesoKg/1000)
            }
        }
       
        self.navigationItem.titleView = setTitle("Monitorización", subtitle: NSString(format: "%d Tm enviadas de %d previstas", tmPedidosRuta , tmPedidoPendienteRuta ) as String)
        
        let numeroFila = self.listaMonitorizacion2.count
        
        return numeroFila
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MonitorCell") as MonitorTableViewCell;
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MonitorCell", forIndexPath: indexPath) as! MonitorTableViewCell
        
        cell.codPedido = self.listaMonitorizacion2[indexPath.row].Cod__Agrupacion_Pedido
        cell.codPedidoLabel?.text = NSString(format: "%@-%@", self.listaMonitorizacion2[indexPath.row].Cod__Agrupacion_Pedido,self.listaMonitorizacion2[indexPath.row].Cod__Pedido_Transporte) as String //self.listaMonitorizacion[indexPath.row]["Cod__Agrupacion_Pedido"] as? String
        cell.clienteLabel?.text = self.listaMonitorizacion2[indexPath.row].Nombre_Agencia//self.listaMonitorizacion[indexPath.row]["Nombre_Agencia"] as? String
        let inicialesComercial = self.listaMonitorizacion2[indexPath.row].inicialesComercial //self.listaMonitorizacion[indexPath.row]["inicialesComercial"] as? String
        cell.comercialLabel?.text = inicialesComercial;
        cell.estadoLabel?.text = self.listaMonitorizacion2[indexPath.row].estadoDescripcion //self.listaMonitorizacion[indexPath.row]["estadoDescripcion"] as? String
        let estado: Int = self.listaMonitorizacion2[indexPath.row].Estado//(self.listaMonitorizacion[indexPath.row]["Estado"] as? Int)!
        cell.estadoLabel?.backgroundColor = colorEstado(estado)
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat="dd/MM/yy"
        
        cell.fechaLabel?.text = dateFormatter.stringFromDate(self.listaMonitorizacion2[indexPath.row].Fecha_Carga_Requerida)
        
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let identicador = segue.identifier {
        
            if identicador == "DetallePedido" {
            
                if let destinationVC = segue.destinationViewController as? DetallePedidoViewController {
                    let celda = sender as! MonitorTableViewCell
                    destinationVC.datos = self.datos
                    destinationVC.codigoPedido = celda.codPedido
                }
            }
                
            
        }
        
        
    }
    // MARK: Tab
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        
        switch item.tag {
        case 0:
            datos.basicURL = "http://192.168.1.2/WSTRH/%@"
          
        case 1:
            datos.basicURL = "http://intranet.trh-es.com/WSTRH/%@"
            
        default:
            datos.basicURL = "http://192.168.1.2/WSTRH/%@"
        }
        getListadoMonitorizacion()
    }
    
    
    // MARK: Fin Tab

    
        func colorEstado(estado: Int ) -> UIColor{
    
        switch estado {
        case 0:
            return UIColor.redColor()
            
        case 1:
             return UIColor.redColor()
            
        case 2:
             return UIColor.orangeColor()
            
        case 3:
             return UIColor.whiteColor()
            
            
        case 4:
             return UIColor.whiteColor()
            
        case 5:
             return UIColor.greenColor()
            
        case 6:
             return UIColor.greenColor()
            
            
        default:
             return UIColor.redColor()
        }
    
    }
    func getListadoMonitorizacion(){
    
        
        self.activityIndicator.startAnimating()
        
            datos.getListMonitorizacion({(result:[MonitorCarga])->Void in
        
        
                self.listaMonitorizacion2 = result.sort({ $0.Fecha_Carga_Requerida.compare($1.Fecha_Carga_Requerida) == .OrderedAscending })
                
                dispatch_async(dispatch_get_main_queue(), {
                    
                    
                    
                    self.tablaViewMonitorizacion.reloadData()
                    
                    self.activityIndicator.stopAnimating()
                })
                
            
        
            })
     }
    
    func setTitle(title:String, subtitle:String) -> UIView {
        let titleLabel = UILabel(frame: CGRectMake(0, -5, 0, 0))
        
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.textColor = UIColor.grayColor()
        titleLabel.font = UIFont.boldSystemFontOfSize(12)
        titleLabel.textAlignment = .Center
        titleLabel.text = title
        titleLabel.sizeToFit()
        
        let subtitleLabel = UILabel(frame: CGRectMake(0, 18, 0, 0))
        subtitleLabel.textAlignment = .Center
        subtitleLabel.backgroundColor = UIColor.clearColor()
        subtitleLabel.textColor = UIColor.blackColor()
        subtitleLabel.font = UIFont.systemFontOfSize(8)
        subtitleLabel.text = subtitle
        subtitleLabel.sizeToFit()
        
        let titleView = UIView(frame: CGRectMake(0, 0, max(titleLabel.frame.size.width, subtitleLabel.frame.size.width), 30))
        titleLabel.frame = CGRectMake(0, 0, max(titleLabel.frame.size.width, subtitleLabel.frame.size.width), 15)
        subtitleLabel.frame = CGRectMake(0, 15, max(titleLabel.frame.size.width, subtitleLabel.frame.size.width), 28)
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

}


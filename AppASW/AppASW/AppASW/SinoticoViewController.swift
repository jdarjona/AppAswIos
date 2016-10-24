//
//  SinoticoViewController.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 2/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import UIKit
import Firebase
import DropDown


class SinoticoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITabBarDelegate {

    let urlLieja = "Maquinas/TRH Liege"
    let urlSevilla = "Maquinas/TRH"
    var url = ""

    var ref:FIRDatabaseReference!
    var rightMenu = DropDown()
    
    var listaSinoptico: [SinopticoFabrica] = []
    var listaSinopticoCompleta: [SinopticoFabrica] = []
    var listSinoptico:Dictionary = Dictionary<String,SinopticoFabrica>()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var sinopticoTableView: UITableView!
    @IBOutlet weak var sinopticoTabBar: UITabBar!
    
    @IBOutlet weak var tabBarItemSevilla: UITabBarItem!
    @IBOutlet weak var tabBarItemLiege: UITabBarItem!
    
    enum ModoSinoptico:String {
    
        case DiaCompleto = "Dia Completo"
        case MomentoActual = "Momento Actual"
        static let ToArray = ["Dia Completo","Momento Actual"]
    }
    
    var modoSinoptico:ModoSinoptico = .MomentoActual
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController!.title = "Sinóptico"
        navigationController?.navigationBar.isTranslucent = false
        self.ref = FIRDatabase.database().reference()
        self.url = self.urlLieja
        
        // Por defecto seleccionamos el primer tab
        sinopticoTabBar.selectedItem = tabBarItemLiege
        initFireBase()
        
        //Configuramos menus de la barra 
        self.rightMenu.anchorView = view
        self.rightMenu.dataSource = ModoSinoptico.ToArray
       let valores = ModoSinoptico.RawValue()
        print(valores)
        self.rightMenu.selectionAction = { [weak self] (index: Int, item: String)  in
            self?.activityIndicator.startAnimating()
            switch index {
            case 0:
                self?.modoSinoptico = .DiaCompleto
                
                self?.listaSinoptico = (self?.listaSinopticoCompleta.sorted(by: { (s1:SinopticoFabrica, s2:SinopticoFabrica) -> Bool in
                    s1.SeccionMaquina>s2.SeccionMaquina
                }))!
                
            default:
                self?.modoSinoptico = .MomentoActual
                self?.listaSinoptico = (self?.listaSinopticoCompleta.sorted(by: { (s1:SinopticoFabrica, s2:SinopticoFabrica) -> Bool in
                    s1.SeccionMaquina>s2.SeccionMaquina
                }).filter({$0.CantidadObjectivo != 0 || $0.Conexion==true}))!
              
            }
            
            DispatchQueue.main.async(execute: {
                
                
                
                self?.sinopticoTableView.reloadData()
                
                self?.activityIndicator.stopAnimating()
            })

        
        }
        let rightButton = UIBarButtonItem(title: "Modo", style: .plain, target: self, action: #selector(ViewController.showRightDropdown))
        //UIBarButtonItem(image: UIImage(named: "Orden"), style: .Plain, target: self, action: #selector(ViewController.showRightDropdown))
        
        self.navigationItem.rightBarButtonItem = rightButton
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showRightDropdown() {
        if self.rightMenu.isDescendant(of: self.view) == true {
            self.rightMenu.hide() //hideMenu()
        } else {
            self.rightMenu.show() // showMenuFromView(self.view)
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    /*
     Mark: -Firebase
     */
    var dictionaryOfRecommendations:[NSDictionary] = [NSDictionary]()
    
    func initFireBase()->(){
        
        
        self.listaSinopticoCompleta = []
        ref.child(url).observeSingleEvent(of: .value, with: { (snapshot) in
         // Get user value
            var tempDict = [NSDictionary]()
            
            for item in snapshot.children {
                
                let child = item as! FIRDataSnapshot
                let dict = child.value as! NSDictionary
                //print(dict)
                self.listaSinopticoCompleta.append(self.ParseFirebaseData(dict))
                tempDict.append(dict)
                
            }
            
           self.sinopticoFireBase()
        
            self.listaSinoptico = self.listaSinopticoCompleta.sorted(by: { (s1:SinopticoFabrica, s2:SinopticoFabrica) -> Bool in
                s1.SeccionMaquina>s2.SeccionMaquina
            }).filter({$0.CantidadObjectivo != 0 || $0.Conexion==true})
        
            self.activityIndicator.startAnimating()
            
           
            
                DispatchQueue.main.async(execute: {
                    
                    
                    
                    self.sinopticoTableView.reloadData()
                    
                    self.activityIndicator.stopAnimating()
                })
                
                
            
         // ...
         }) { (error) in
         print(error.localizedDescription)
         }
        
        
        
        
    }
    
    func sinopticoFireBase(){
        
        _ = ref.child(url).observe(FIRDataEventType.childChanged , with: { (snapshot) in
            
        
            
            //for item in snapshot.value {
            
                let dict = snapshot.value as! NSDictionary
                let maquina = self.ParseFirebaseData(dict)
                
                if self.listaSinopticoCompleta.contains(where: { (s:SinopticoFabrica) -> Bool in
                    s.IdMaquina==maquina.IdMaquina
                })
                {
                    for (index, value) in self.listaSinopticoCompleta.enumerated() {
                        print("Item \(index + 1): \(value)")
                        if value.IdMaquina == maquina.IdMaquina{
                            self.listaSinopticoCompleta[index]=maquina
                            break
                        }
                    }
                }else {
                 self.listaSinopticoCompleta.append(maquina)
                }
                
           // }
        })
        
        
    }

    func ParseFirebaseData(_ jsonDictionary:NSDictionary)->SinopticoFabrica {
        // Parse data from Firebase
        
        // Loop through each dictionary and assign values to location object
       
        //for index in 0...dictionaryOfRecommendations.count - 1 {
            
            // Current Json dictionary
            //let jsonDictionary:NSDictionary = self.dictionaryOfRecommendations[index]
            let sinotico:SinopticoFabrica = SinopticoFabrica()
            
            sinotico.CantidadProducidad = jsonDictionary["CantidadProducidad"] as! Double!
            sinotico.Marcha = jsonDictionary["Marcha"] as! Bool!
            sinotico.PesoObjetivo = jsonDictionary["PesoObjetivo"] as! Double!
            sinotico.CantidadObjectivo = jsonDictionary["CantidadObjectivo"] as! Double!
            sinotico.Conexion = jsonDictionary["Conexion"] as! Bool!
            sinotico.Rendimiento = jsonDictionary["Rendimiento"] as! Int!
            sinotico.SeccionMaquina = jsonDictionary["SeccionMaquina"] as! Int!
            sinotico.IdMaquina = jsonDictionary["IdMaquina"] as! String!
            sinotico.PesoProducido = jsonDictionary["PesoProducido"] as! Double!
            sinotico.CodOperario = jsonDictionary["CodOperario"] as! String!
            sinotico.CodProducto = jsonDictionary["CodProducto"] as! String!
            sinotico.Operario1 = ""
            if let operario1 = jsonDictionary["Operario1"] as? String {
                sinotico.Operario1 = operario1
            }
            sinotico.Operario2 = ""
            if let operario2 = jsonDictionary["Operario2"] as? String {
                    sinotico.Operario2 = operario2
            }
            sinotico.UnidadMedida = jsonDictionary["UnidadMedida"] as! String!
        
            //Valores Acumulados
            sinotico.CantidadObjectivoDia = jsonDictionary["CantidadObjectivo"] as! Double!
            sinotico.CantidadProducidadDia = jsonDictionary["CantidadProducidadDia"] as! Double!
            sinotico.PesoObjetivoDia = jsonDictionary["PesoObjetivoDia"] as! Double!
            sinotico.PesoProducidoDia = jsonDictionary["PesoProducidoDia"] as! Double!
            sinotico.RendimientoDia = jsonDictionary["RendimientoDia"] as! Int!
        
            
            
            return sinotico
            // Append to Locations Array and start new Location
        
            //self.currentlyConstructingLocation = Location()
            
        //}
    }
    // MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.listaSinoptico.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let localizacion:Locale = Locale(identifier: "es_ES")
        //numberFormatter.stringFromNumber(pesoKg)
        numberFormatter.locale = localizacion

        let cell = tableView.dequeueReusableCell(withIdentifier: "SinopticoCell") as! SinopticoTableViewCell
        
        
        var cantidadObjetivo:Int
        var cantidadProducida:Int
        var rendimiento:Int
        var operario:String = ""
        var producto = ""
        let unidadMedida = listaSinoptico[(indexPath as NSIndexPath).row].UnidadMedida
        
        switch modoSinoptico {
        
        case .DiaCompleto:
            cantidadObjetivo = Int(listaSinoptico[(indexPath as NSIndexPath).row].CantidadObjectivoDia)
            cantidadProducida = Int(listaSinoptico[(indexPath as NSIndexPath).row].CantidadProducidadDia)
            rendimiento = Int(listaSinoptico[(indexPath as NSIndexPath).row].RendimientoDia)
            producto = listaSinoptico[(indexPath as NSIndexPath).row].CodProductoDia
          
        case .MomentoActual:
            
           operario = listaSinoptico[(indexPath as NSIndexPath).row].Operario1
           producto = listaSinoptico[(indexPath as NSIndexPath).row].CodProducto
           cantidadObjetivo = Int(listaSinoptico[(indexPath as NSIndexPath).row].CantidadObjectivo)
           cantidadProducida = Int(listaSinoptico[(indexPath as NSIndexPath).row].CantidadProducidad)
           rendimiento = Int(listaSinoptico[(indexPath as NSIndexPath).row].Rendimiento)
        
        }
        
        
        //Rellenamos la celda
        cell.maquinaLabel.text =  listaSinoptico[(indexPath as NSIndexPath).row].IdMaquina
        cell.maquinaImage.image = UIImage(named: listaSinoptico[(indexPath as NSIndexPath).row].IdMaquina)
        cell.rendimientoLabel.text = NSString(format: "%@%@",String(rendimiento),"%") as String
        cell.rendimientoLabel.textColor = colorRendimiento(rendimiento)
        cell.objetivoLabel.text = NSString(format: " %@ %@/%@ %@ Objetivo",numberFormatter.string(from: NSNumber(integerLiteral: cantidadProducida))!,unidadMedida,numberFormatter.string(from: NSNumber(integerLiteral: cantidadObjetivo))!,unidadMedida) as String
        cell.productoLabel.text = producto
        cell.operarioLabel.text = operario
        switch listaSinoptico[(indexPath as NSIndexPath).row].Conexion {
        case true:
            cell.conexionImage.image = UIImage(named: "conexionOk")
        case false:
            cell.conexionImage.image = UIImage(named: "conexionNoOk")
            
        }
        switch listaSinoptico[(indexPath as NSIndexPath).row].Marcha {
        case true:
            cell.marchaImagen.image = UIImage(named: "marcha")
        case false:
            cell.marchaImagen.image = UIImage(named: "marchaNo")
        }

        cell.rendimientoProgress.setProgress(Float(rendimiento)/100, animated: true)
        cell.rendimientoProgress.progressTintColor = colorRendimiento(rendimiento)
        
        
        
        return cell
    }
    
    func colorRendimiento(_ rendimiento: Int ) -> UIColor{
        
        if  rendimiento >= 75 {
        
            return UIColor.green
            
        }else if (rendimiento < 75 && rendimiento >= 50) {
            return UIColor.orange
            
          
        }else{
        
            return UIColor.red
        }
        
    }

    // MARK: Tab
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        

        
        switch item.tag {
        case 0:
            
            
            url = self.urlLieja
            
        case 1:
            
            url = self.urlSevilla
            
        default:
           url = self.urlLieja
            
        }
       initFireBase()
    }
    
    
    // MARK: Fin Tab
    

}

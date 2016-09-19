//
//  SinoticoViewController.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 2/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import UIKit
import Firebase
import EVReflection

class SinoticoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITabBarDelegate {

    let urlLieja = "Maquinas/TRH Liege"
    let urlSevilla = "Maquinas/TRH"
    
    var url = ""
    
    var ref:FIRDatabaseReference!
    @IBOutlet weak var sinopticoTableView: UITableView!
    var listaSinoptico:[SinopticoFabrica] = []
    var listSinoptico:Dictionary = Dictionary<String,SinopticoFabrica>()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var sinopticoTabBar: UITabBar!
    
    @IBOutlet weak var tabBarItemSevilla: UITabBarItem!
    @IBOutlet weak var tabBarItemLiege: UITabBarItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         self.navigationController!.title = "Sinóptico"
         self.ref = FIRDatabase.database().reference()
        self.url = self.urlLieja
        initFireBase()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        
        self.listaSinoptico = []
        ref.child(url).observeSingleEventOfType(.Value, withBlock: { (snapshot) in
         // Get user value
            var tempDict = [NSDictionary]()
            
            for item in snapshot.children {
                
                let child = item as! FIRDataSnapshot
                let dict = child.value as! NSDictionary
                //print(dict)
                self.listaSinoptico.append(self.ParseFirebaseData(dict))
                tempDict.append(dict)
                
            }
            
           self.sinopticoFireBase()
        
            self.listaSinoptico = self.listaSinoptico.sort({ (s1:SinopticoFabrica, s2:SinopticoFabrica) -> Bool in
                s1.SeccionMaquina>s2.SeccionMaquina
            }).filter({$0.CantidadObjectivo != 0 || $0.Conexion==true})
        
            self.activityIndicator.startAnimating()
            
           
            
                dispatch_async(dispatch_get_main_queue(), {
                    
                    
                    
                    self.sinopticoTableView.reloadData()
                    
                    self.activityIndicator.stopAnimating()
                })
                
                
            
         // ...
         }) { (error) in
         print(error.localizedDescription)
         }
        
        
        
        
    }
    
    func sinopticoFireBase(){
        
        _ = ref.child(url).observeEventType(FIRDataEventType.ChildChanged , withBlock: { (snapshot) in
            
        
            
            //for item in snapshot.value {
            
                let dict = snapshot.value as! NSDictionary
                let maquina = self.ParseFirebaseData(dict)
                
                if self.listaSinoptico.contains({ (s:SinopticoFabrica) -> Bool in
                    s.IdMaquina==maquina.IdMaquina
                })
                {
                    for (index, value) in self.listaSinoptico.enumerate() {
                        print("Item \(index + 1): \(value)")
                        if value.IdMaquina == maquina.IdMaquina{
                            self.listaSinoptico[index]=maquina
                            break
                        }
                    }
                }else {
                 self.listaSinoptico.append(maquina)
                }
                
           // }
        })
        
      /*  let refHandleAdd = ref.child(url).observeEventType(FIRDataEventType.ChildAdded , withBlock: { (snapshot) in
            
            
            
            for item in snapshot.children {
                
                let child = item as! FIRDataSnapshot
                print(child)
                let dict = child.value as! NSDictionary
                let maquina = self.ParseFirebaseData(dict)
                
                if self.listaSinoptico.contains({ (s:SinopticoFabrica) -> Bool in
                    s.IdMaquina==maquina.IdMaquina
                })
                {
                    for (index, value) in self.listaSinoptico.enumerate() {
                        print("Item \(index + 1): \(value)")
                        if value.IdMaquina == maquina.IdMaquina{
                            self.listaSinoptico[index]=maquina
                        }
                    }
                }else {
                    self.listaSinoptico.append(maquina)
                }
                
            }
        })

        */
    
       // print(refHandle)
    
    }

    func ParseFirebaseData(jsonDictionary:NSDictionary)->SinopticoFabrica {
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
            sinotico.Operario1 = jsonDictionary["Operario1"] as! String!
            sinotico.Operario2 = jsonDictionary["Operario2"] as! String!
            sinotico.UnidadMedida = jsonDictionary["UnidadMedida"] as! String!
        
           // sinotico.CodOperario = jsonDictionary["CodOperario"] as! String!
            
            
            return sinotico
            // Append to Locations Array and start new Location
        
            //self.currentlyConstructingLocation = Location()
            
        //}
    }
    // MARK: TableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listaSinoptico.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .DecimalStyle
        
        let localizacion:NSLocale = NSLocale(localeIdentifier: "es_ES")
        //numberFormatter.stringFromNumber(pesoKg)
        numberFormatter.locale = localizacion

        let cell = tableView.dequeueReusableCellWithIdentifier("SinopticoCell") as! SinopticoTableViewCell
        
        let cantidadObjetivo = numberFormatter.stringFromNumber(Int(listaSinoptico[indexPath.row].CantidadObjectivo))
        let cantidadProducida = numberFormatter.stringFromNumber(Int(listaSinoptico[indexPath.row].CantidadProducidad))
         numberFormatter.numberStyle = .NoStyle
        let rendimiento = numberFormatter.stringFromNumber(listaSinoptico[indexPath.row].Rendimiento)
        let unidadMedida = listaSinoptico[indexPath.row].UnidadMedida
        
        cell.rendimientoLabel.text = NSString(format: "%@%@",rendimiento!,"%") as String
        cell.rendimientoLabel.textColor = colorRendimiento(listaSinoptico[indexPath.row].Rendimiento)
        cell.productoLabel.text = ""
        cell.objetivoLabel.text = NSString(format: " %@ %@/%@ %@ Objetivo",cantidadProducida!,unidadMedida,cantidadObjetivo!,unidadMedida) as String
        cell.productoLabel.text = listaSinoptico[indexPath.row].CodProducto
        cell.operarioLabel.text = listaSinoptico[indexPath.row].Operario1
        switch listaSinoptico[indexPath.row].Conexion {
        case true:
            cell.conexionImage.image = UIImage(named: "conexionOk")
        case false:
            cell.conexionImage.image = UIImage(named: "conexionNoOk")
       
        }
        switch listaSinoptico[indexPath.row].Marcha {
        case true:
            cell.marchaImagen.image = UIImage(named: "marcha")
        case false:
            cell.marchaImagen.image = UIImage(named: "marchaNo")
                }
        cell.maquinaLabel.text =  listaSinoptico[indexPath.row].IdMaquina
        cell.maquinaImage.image = UIImage(named: listaSinoptico[indexPath.row].IdMaquina)
        cell.rendimientoProgress.setProgress(Float(listaSinoptico[indexPath.row].Rendimiento)/100, animated: true)
        cell.rendimientoProgress.progressTintColor = colorRendimiento(listaSinoptico[indexPath.row].Rendimiento)
        return cell
    }
    
    func colorRendimiento(rendimiento: Int ) -> UIColor{
        
        if  rendimiento >= 75 {
        
            return UIColor.greenColor()
            
        }else if (rendimiento < 75 && rendimiento >= 50) {
            return UIColor.orangeColor()
            
          
        }else{
        
            return UIColor.redColor()
        }
        
    }

    // MARK: Tab
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        
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

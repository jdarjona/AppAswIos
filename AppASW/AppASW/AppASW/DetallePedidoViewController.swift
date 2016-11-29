//
//  DetallePedidoViewController.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 17/8/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import UIKit

class DetallePedidoViewController: UIViewController,UITableViewDataSource, UITableViewDelegate  {

    var codigoPedido:String = ""
    var pedidoDetalle:PedidoVenta = PedidoVenta()
    var datos:AccesoDatos = AccesoDatos()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var pedidoDetalleTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDetallePedido(codigoPedido)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*override func viewWillAppear(_ animated: Bool) {
        let cells = pedidoDetalleTableView.visibleCells
       
        
        for i in cells {
            let cell = i as! DetallePedidoTableViewCell
            cell.animateCantidad()
        }
    }*/
    
    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
    }
    */
    
    // MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if pedidoDetalle.SalesLines.count != 0{
            
            let lineas = pedidoDetalle.SalesLines
            
            var totalTm:Int = 0
            var totalPrecio: Float = 0
            
            for linea in lineas {
            
                totalTm += Int(linea.Cantidad_KG/1000)
                totalPrecio += linea.PrecioLineaTotal
            
            }
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let localizacion:Locale = Locale(identifier: "es_ES")
            numberFormatter.locale = localizacion
            
            self.navigationItem.titleView = setTitle(pedidoDetalle.Sell_to_Customer_Name, subtitle: (String(totalTm) + " Tm " +  String(totalPrecio) + " €") )//NSString(format: "%d Tm, %@ €", totalTm , (totalPrecio) ) as String )
        }
        
        
        
        return pedidoDetalle.SalesLines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetallePedidoCell", for: indexPath) as! DetallePedidoTableViewCell
       
        let i = (indexPath as NSIndexPath).row
        
        cell.productoLabel.text = pedidoDetalle.SalesLines[i].Alias
        cell.caracteristicasLabel.text = pedidoDetalle.SalesLines[i].Description
       
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let localizacion:Locale = Locale(identifier: "es_ES")
        numberFormatter.locale = localizacion
        
        let pesoKg = pedidoDetalle.SalesLines[i].Cantidad_KG
        let peso = NSString(format: "%.2f", pesoKg) as String
        cell.pesoLabel.text = NSString(format: "%@ Kg",peso) as String
        let numeroPaquetes = NSString(format: "%.0f", pedidoDetalle.SalesLines[i].Cantidad_PAQ) as String
        
        cell.paquetesLabel.text = numeroPaquetes
        
       
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let cellPedidoDetalle = cell as! DetallePedidoTableViewCell
        cellPedidoDetalle.backgroundColor = UIColor.darkGray
        UIView.animate(withDuration: 0.8, delay: 0, options: UIViewAnimationOptions(), animations: {() -> Void in
            
            cellPedidoDetalle.paquetesLabel.layer.cornerRadius = cellPedidoDetalle.paquetesLabel.frame.width/2
            cellPedidoDetalle.paquetesLabel.clipsToBounds = true
           
            cellPedidoDetalle.backgroundColor = UIColor.white
        })
        
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cellPedidoDetalle = cell as! DetallePedidoTableViewCell
        
        cellPedidoDetalle.animateCantidad()
    }
 
    // FIN TableView
    
    func getDetallePedido(_ codigoPedido:String) -> () {
        
        //dispatch_async(dispatch_get_main_queue()) { [unowned self] in
            
        
            self.activityIndicator.startAnimating()
            datos.getPedido(codigoPedido, result: { (result:PedidoVenta) in
                
                self.pedidoDetalle = result
                self.pedidoDetalle.SalesLines = self.pedidoDetalle.SalesLines.filter({$0.Cantidad_PAQ != 0})
                DispatchQueue.main.async(execute: {
                    
                    self.pedidoDetalleTableView.reloadData()
                    self.activityIndicator.stopAnimating()
                })
                
                
           })
            
            
        //}
    }
    func setTitle(_ title:String, subtitle:String) -> UIView {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: -5, width: 0, height: 0))
        
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = UIColor.gray
        titleLabel.font = UIFont.boldSystemFont(ofSize: 12)
        titleLabel.textAlignment = .left
        titleLabel.text = title
        titleLabel.sizeToFit()
        
        let subtitleLabel = UILabel(frame: CGRect(x: 0, y: 18, width: 0, height: 0))
        subtitleLabel.textAlignment = .left
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

}

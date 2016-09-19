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
    

    
    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
    }
    */
    
    // MARK: TableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if pedidoDetalle.SalesLines.count != 0{
            
            let lineas = pedidoDetalle.SalesLines
            
            var totalTm:Int = 0
            var totalPrecio: Float = 0
            
            for linea in lineas {
            
                totalTm += Int(linea.Cantidad_KG/1000)
                totalPrecio += linea.PrecioLineaTotal
            
            }
            let numberFormatter = NSNumberFormatter()
            numberFormatter.numberStyle = .DecimalStyle
            let localizacion:NSLocale = NSLocale(localeIdentifier: "es_ES")
            numberFormatter.locale = localizacion
            
            self.navigationItem.titleView = setTitle(pedidoDetalle.Sell_to_Customer_Name, subtitle: NSString(format: "%d Tm, %@ €", totalTm , numberFormatter.stringFromNumber(totalPrecio)! ) as String)
        }
        
        
        
        return pedidoDetalle.SalesLines.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("DetallePedidoCell", forIndexPath: indexPath) as! DetallePedidoTableViewCell
       
        let i = indexPath.row
        
        cell.productoLabel.text = pedidoDetalle.SalesLines[i].Alias
        cell.caracteristicasLabel.text = pedidoDetalle.SalesLines[i].Description
       
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .DecimalStyle
        let localizacion:NSLocale = NSLocale(localeIdentifier: "es_ES")
        numberFormatter.locale = localizacion
        
        let pesoKg = pedidoDetalle.SalesLines[i].Cantidad_KG
        let peso = numberFormatter.stringFromNumber(pesoKg)//NSString(format: "%.2f", pesoKg) as String
        cell.pesoLabel.text = NSString(format: "%@ Kg",peso!) as String
        let numeroPaquetes = NSString(format: "%.0f", pedidoDetalle.SalesLines[i].Cantidad_PAQ) as String
        
        cell.paquetesLabel.text = numeroPaquetes
    
        
        return cell
        
    }
    
    
    // FIN TableView
    
    func getDetallePedido(codigoPedido:String) -> () {
        
        //dispatch_async(dispatch_get_main_queue()) { [unowned self] in
            
        
            
            datos.getPedido(codigoPedido, result: { (result:PedidoVenta) in
                
                self.pedidoDetalle = result
                self.pedidoDetalle.SalesLines = self.pedidoDetalle.SalesLines.filter({$0.Cantidad_PAQ != 0})
                dispatch_async(dispatch_get_main_queue(), {
                    
                     self.pedidoDetalleTableView.reloadData()
                })
                
                
           })
            
            
        //}
    }
    func setTitle(title:String, subtitle:String) -> UIView {
        let titleLabel = UILabel(frame: CGRectMake(0, -5, 0, 0))
        
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.textColor = UIColor.grayColor()
        titleLabel.font = UIFont.boldSystemFontOfSize(12)
        titleLabel.textAlignment = .Left
        titleLabel.text = title
        titleLabel.sizeToFit()
        
        let subtitleLabel = UILabel(frame: CGRectMake(0, 18, 0, 0))
        subtitleLabel.textAlignment = .Left
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

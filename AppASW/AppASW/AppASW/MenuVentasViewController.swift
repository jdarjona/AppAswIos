//
//  MenuVentasViewController.swift
//  AppASW
//
//  Created by Administrador on 20/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import Foundation
import UIKit

class MenuVentasViewController: UIViewController {
    
    @IBOutlet weak var nuevaOferta: UIButton!
    @IBOutlet weak var listadoOfertas: UIButton!
    @IBOutlet weak var listadoPedidos: UIButton!
    @IBOutlet weak var listadoProductos: UIButton!
    
    var oferta:OfertaVenta = OfertaVenta()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        ManagerVentas.getOferta("DEV-V16/0589") { (result) in
            
            self.oferta = result
            
            self.oferta.doble_DescargaField = true
            
            ManagerVentas.updateOferta(self.oferta, result: { (result) in
                
                self.oferta = result
            })
            
        }
    }
}

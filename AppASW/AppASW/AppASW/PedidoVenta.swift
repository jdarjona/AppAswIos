//
//  PedidoVenta.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 7/7/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import UIKit
import EVReflection

public class PedidoVenta: EVObject {

    var Key: String = ""
    var Sell_to_Customer_Name: String = ""
    
    var SalesLines: [Sales_Order_Subform_ws] = [Sales_Order_Subform_ws]()
    
    required public init(){
    
    }

}

public class Sales_Order_Subform_ws:EVObject{

    var Key: String = ""
    var No: String = ""
    var Alias: String = ""
    var Description: String = ""
    var Cantidad_KG: Double = 0
    var Cantidad_PAQ: Double = 0
    var Line_Amount: Double = 0
    var PrecioLineaTotal:Float = 0
    
    

    
 }



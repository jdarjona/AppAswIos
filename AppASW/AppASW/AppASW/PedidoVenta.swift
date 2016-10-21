//
//  PedidoVenta.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 7/7/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import UIKit
import ObjectMapper

public class PedidoVenta:NSObject, Mappable {

    var Key: String = ""
    var Sell_to_Customer_Name: String = ""
    
    var SalesLines: [Sales_Order_Subform_ws] = [Sales_Order_Subform_ws]()
    
    
    override init() {
        super.init()
    }
    
    convenience required public init?(map: Map){
        self.init()
    }
    
    public func mapping(map: Map) {
     Key <- map["keyField"] // String = ""
     Sell_to_Customer_Name <- map["sell_to_Customer_NameField"] // String = ""
     SalesLines <- map["salesLinesField"] // [Sales_Order_Subform_ws] = [Sales_Order_Subform_ws]()
    }
}

public class Sales_Order_Subform_ws:NSObject, Mappable{

    var Key: String = ""
    var No: String = ""
    var Alias: String = ""
    var Description: String = ""
    var Cantidad_KG: Double = 0
    var Cantidad_PAQ: Double = 0
    var Line_Amount: Double = 0
    var PrecioLineaTotal:Float = 0
    
    
    override init() {
        super.init()
    }
    
    convenience required public init?(map: Map){
        self.init()
    }
    
    public func mapping(map: Map) {
     Key <- map["keyField"] // String = ""
     No <- map["noField"] // String = ""
     Alias <- map["aliasField"] // String = ""
     Description <- map["descriptionField"] // String = ""
     Cantidad_KG <- map["cantidad_KGField"] // Double = 0
     Cantidad_PAQ <- map["cantidad_PAQField"] // Double = 0
     Line_Amount <- map["line_AmountField"] // Double = 0
     PrecioLineaTotal <- map["precioLineaTotalField"] //Float = 0
    }
 }



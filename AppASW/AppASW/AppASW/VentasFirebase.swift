//
//  VentasFirebase.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 31/10/16.
//  Copyright © 2016 TRH. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper
import AlamofireObjectMapper

class VentasFirebase: NSObject, Mappable {
    
    var codPedido:String = ""
    var descripcion:String = ""
    var estado:Int = 0
    var incidencia:Bool = false
    var oferta:Bool = false
    
    override init() {
        super.init()
    }
    
    convenience required public init?(map: Map){
        self.init()
    }
    
    public func mapping(map: Map) {
        
        codPedido <- map["codPedido"]
        descripcion <- map["descripcion"]
        estado <- map["estado"]
        incidencia <- map["incidencia"]
        oferta <- map["oferta"]
    
    }

}

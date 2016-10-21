//
//  Almacenes.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 22/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import Foundation
import ObjectMapper

public class Almacen:NSObject, Mappable {
    
    var keyField: String = ""
    var idAlmacenField:Int = 0
    var idAlmacenFieldSpecified: Bool = false
    var nombreAlmacenField: String = ""
    var idClienteField: String = ""
    var idComercialField: String = ""
    
    override init() {
        super.init()
    }
    
    convenience required public init?(map: Map){
        self.init()
    }
    
    public func mapping(map: Map) {
     keyField <- map["keyField"] // String = ""
     idAlmacenField <- map["idAlmacenField"] //Int = 0
     idAlmacenFieldSpecified <- map["idAlmacenFieldSpecified"] // Bool = false
     nombreAlmacenField <- map["nombreAlmacenField"] // String = ""
     idClienteField <- map["idClienteField"] // String = ""
     idComercialField <- map["idComercialField"] // String = ""
    }
}

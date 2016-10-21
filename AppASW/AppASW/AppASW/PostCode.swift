//
//  PostCode.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 22/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import Foundation
import ObjectMapper

open class PostCode:NSObject, Mappable {
    
    var keyField: String = "" //": "sample string 1",
    var codeField: String = "" //": "sample string 2",
    var cityField: String = "" //": "sample string 3",
    var country_Region_CodeField: String = "" //": "sample string 4",
    var countyField: String = "" //": "sample string 5",
    var euros_TmField: Double = 0 //": 6.0,
    var euros_TmFieldSpecified: Bool = false//": true,
    var latitudField: Double = 0 //": 8.0,
    var latitudFieldSpecified: Bool = false //": true,
    var longitudField: Double = 0 //": 10.0,
    var longitudFieldSpecified: Bool = false //": true,
    var euros_Tm_ProveedorField: Double = 0 //": 12.0,
    var euros_Tm_ProveedorFieldSpecified: Bool = false //": true,
    var distancia_FabricaField: Double = 0 //": 14.0,
    var distancia_FabricaFieldSpecified: Bool = false //": true,
    //"PropertyChanged": null
    
    override init() {
        super.init()
    }
    
    convenience required public init?(map: Map){
        self.init()
    }
    
    
    public func mapping(map: Map) {
        keyField <- map["keyField"] // String = "" //" <- map["location"] // "sample string 1",
         codeField <- map["codeField"] // String = "" //" <- map["location"] // "sample string 2",
         cityField <- map["cityField"] // String = "" //" <- map["location"] // "sample string 3",
         country_Region_CodeField <- map["country_Region_CodeField"] // String = "" //" <- map["location"] // "sample string 4",
         countyField <- map["countyField"] // String = "" //" <- map["location"] // "sample string 5",
         euros_TmField <- map["euros_TmField"] // Double = 0 //" <- map["location"] // 6.0,
         euros_TmFieldSpecified <- map["euros_TmFieldSpecified"] // Bool = false//" <- map["location"] // true,
         latitudField <- map["latitudField"] // Double = 0 //" <- map["location"] // 8.0,
         latitudFieldSpecified <- map["latitudFieldSpecified"] // Bool = false //" <- map["location"] // true,
         longitudField <- map["longitudField"] // Double = 0 //" <- map["location"] // 10.0,
         longitudFieldSpecified <- map["longitudFieldSpecified"] // Bool = false //" <- map["location"] // true,
         euros_Tm_ProveedorField <- map["euros_Tm_ProveedorField"] // Double = 0 //" <- map["location"] // 12.0,
         euros_Tm_ProveedorFieldSpecified <- map["euros_Tm_ProveedorFieldSpecified"] // Bool = false //" <- map["location"] // true,
         distancia_FabricaField <- map["distancia_FabricaField"] // Double = 0 //" <- map["location"] // 14.0,
         distancia_FabricaFieldSpecified <- map["distancia_FabricaFieldSpecified"] // Bool = false //": true,
    }
    
}

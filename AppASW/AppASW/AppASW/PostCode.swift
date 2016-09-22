//
//  PostCode.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 22/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import Foundation
import EVReflection

public class PostCode: EVObject {
    
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

}

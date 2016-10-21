//
//  Productos.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 22/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import ObjectMapper

public class Productos:NSObject, Mappable{
    
    var keyField: String = "" // ": "sample string 1",
    var noField: String = "" //": "sample string 2",
    var descriptionField: String = "" //": "sample string 3",
    var search_DescriptionField: String = "" //": "sample string 4",
    var long_BarraField: Double = 0 //": 5.0,
    var long_BarraFieldSpecified: Bool = false //": true,
    var trans_BarraField: Double = 0 //": 7.0,
    var trans_BarraFieldSpecified: Bool = false //": true,
    var nº_Barras_TransField: Double = 0 //": 9.0,
    var nº_Barras_TransFieldSpecified: Bool = false //": true,
    var nº_Barras_LongField: Double = 0 //": 11.0,
    var nº_Barras_LongFieldSpecified: Bool = false //": true,
    var kGxM2Field: Double = 0 //": 13.0,
    var kGxM2FieldSpecified: Bool = false //": true,
    var paños_x_PaqueteField: Double = 0 //": 15.0,
    var paños_x_PaqueteFieldSpecified: Bool = false //": true,
    var kgs_PaqueteField: Double = 0 //": 17.0,
    var kgs_PaqueteFieldSpecified: Bool = false //": true,
    var m2_PaqueteField: Double = 0 //": 19.0,
    var m2_PaqueteFieldSpecified: Bool = false //: true,
    var item_Category_CodeField: String = "" //": "sample string 21",
    var product_Group_CodeField: String = "" //": "sample string 22",
    var last_Date_ModifiedField: Date = Date() //": "2016-09-22T10:55:43.7889489+02:00",
    var last_Date_ModifiedFieldSpecified: Bool = false //": true,
    var sales_Unit_of_MeasureField: String = "" //": "sample string 25",
    var grupoProductoDescripcionField: String = "" //": "sample string 26",
    var replenishment_SystemField: Int = 0 //": 0,
    var replenishment_SystemFieldSpecified: Bool = false //": true,
    var paquetes_por_CamiónField: Int = 0 //": 28,
    var paquetes_por_CamiónFieldSpecified: Bool = false //": true,
    var stockDisponibleField: Double = 0 //": 30.0,
    var stockDisponibleFieldSpecified: Bool = false // ": true,
    var paisField: String = "" //": "sample string 32",
    var almacenField: String = "" //": "sample string 33",
    //var PropertyChanged": null
    
    override init() {
        super.init()
    }
    
    convenience required public init?(map: Map){
        self.init()
    }
    public func mapping(map: Map) {
        
         keyField <- map["keyField"]
         noField <- map["noField"] //: String = "" //": "sample string 2",
         descriptionField <- map["descriptionField"] // String = "" //": "sample string 3",
         search_DescriptionField <- map["search_DescriptionField"] // String = "" //": "sample string 4",
         long_BarraField <- map["long_BarraField"] // Double = 0 //": 5.0,
         long_BarraFieldSpecified <- map["long_BarraFieldSpecified"] // Bool = false //": true,
         trans_BarraField <- map["trans_BarraField"] // Double = 0 //": 7.0,
         trans_BarraFieldSpecified <- map["trans_BarraFieldSpecified"] // Bool = false //": true,
         nº_Barras_TransField <- map["nº_Barras_TransField"] // Double = 0 //": 9.0,
         nº_Barras_TransFieldSpecified <- map["nº_Barras_TransFieldSpecified"] // Bool = false //": true,
         nº_Barras_LongField <- map["nº_Barras_LongField"] // Double = 0 //": 11.0,
         nº_Barras_LongFieldSpecified <- map["nº_Barras_LongFieldSpecified"] // Bool = false //": true,
         kGxM2Field <- map["kGxM2Field"] // Double = 0 //": 13.0,
         kGxM2FieldSpecified <- map["kGxM2FieldSpecified"] // Bool = false //": true,
         paños_x_PaqueteField <- map["paños_x_PaqueteField"] // Double = 0 //": 15.0,
         paños_x_PaqueteFieldSpecified <- map["paños_x_PaqueteFieldSpecified"] // Bool = false //": true,
         kgs_PaqueteField <- map["kgs_PaqueteField"] // Double = 0 //": 17.0,
         kgs_PaqueteFieldSpecified <- map["kgs_PaqueteFieldSpecified"] // Bool = false //": true,
         m2_PaqueteField <- map["m2_PaqueteField"] // Double = 0 //": 19.0,
         m2_PaqueteFieldSpecified <- map["m2_PaqueteFieldSpecified"] // Bool = false //: true,
         item_Category_CodeField <- map["item_Category_CodeField"] // String = "" //": "sample string 21",
         product_Group_CodeField <- map["product_Group_CodeField"] // String = "" //": "sample string 22",
         last_Date_ModifiedField <- map["last_Date_ModifiedField"] // Date = Date() //": "2016-09-22T10:55:43.7889489+02:00",
         last_Date_ModifiedFieldSpecified <- map["last_Date_ModifiedFieldSpecified"] // Bool = false //": true,
         sales_Unit_of_MeasureField <- map["sales_Unit_of_MeasureField"] // String = "" //": "sample string 25",
         grupoProductoDescripcionField <- map["grupoProductoDescripcionField"] // String = "" //": "sample string 26",
         replenishment_SystemField <- map["replenishment_SystemField"] // Int = 0 //": 0,
         replenishment_SystemFieldSpecified <- map["replenishment_SystemFieldSpecified"] // Bool = false //": true,
         paquetes_por_CamiónField <- map["paquetes_por_CamiónField"] // Int = 0 //": 28,
         paquetes_por_CamiónFieldSpecified  <- map["paquetes_por_CamiónFieldSpecified"] // Bool = false //": true,
         stockDisponibleField <- map["stockDisponibleField"] // Double = 0 //": 30.0,
         stockDisponibleFieldSpecified  <- map["stockDisponibleFieldSpecified"] // Bool = false // ": true,
         paisField <- map["paisField"] // String = "" //": "sample string 32",
         almacenField <- map["almacenField"] //
    }
}

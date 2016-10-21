//
//  MonitorCarga.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 5/7/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import Foundation
import ObjectMapper

open class MonitorCarga : NSObject, Mappable{
    
    var Id:Int = 1
    var Cod__Agrupacion_Pedido: String = ""
    var Cod__Pedido_Transporte = ""
    var Fecha_Carga_Requerida = Date()
    var FechaMinimaEntrega = Date()
    var Fecha_Minima_Entrega_Carga_1 = Date()
    var HoraSolicitud = Date()
    var Nombre_Agencia: String = ""
    var Nombre_Transportista = ""
    var Codigo_Agencia = ""
    var Code = ""
    var Estado: Int = 0
    var estadoDescripcion: String = ""
    var inicialesComercial: String = ""
    var precio = 0
    var pesoKg:Double = 0
    var Matricula_Camion = ""
    var Matricula_Remolque = ""
    var Transportista_DNI = ""
    var FechaSolicitud = Date()
    var Localidad_Carga_1 = ""
    var Localidad_Carga_2 = ""
    var Localidad = ""
    var Provincia = ""
    var Provincia_Carga_1 = ""
    var Provincia_Carga_2 = ""
    var Doble_Descarga = ""
    var Transporte_Cerrado = false
    var No__Albaran__Venta = ""
    var codigoPedido = ""
    var Enviado_Pdf = false
    var Camion_Grua = false
    var Tauliner = false
    var Distancia_Fabrica = 0
    var Search_Name = ""
    var indice = 0
    
    override init() {
        super.init()
    }
    
    convenience required public init?(map: Map){
        self.init()
    }
    
    
    public func mapping(map: Map) {
         Id <- map["Id"] //Int = 1
         Cod__Agrupacion_Pedido <- map["Cod__Agrupacion_Pedido"] // String = ""
         Cod__Pedido_Transporte <- map["Cod__Pedido_Transporte"]
        
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"//"yyyy-MM-dd'T'HH:mm:ssZ"
        
         if let dateString = map["Fecha_Carga_Requerida"].currentValue as? String, let _date = dateFormatter.date(from: dateString) {
            Fecha_Carga_Requerida = _date
         }
        
        
         //Fecha_Carga_Requerida <- (map["Fecha_Carga_Requerida"], DateTransform())// Date = Date()
         FechaMinimaEntrega <- (map["FechaMinimaEntrega"], DateTransform())
         Fecha_Minima_Entrega_Carga_1 <- (map["Fecha_Minima_Entrega_Carga_1"], DateTransform()) // = Date()
         HoraSolicitud <- (map["HoraSolicitud"], DateTransform()) // = Date()
         Nombre_Agencia <- map["Nombre_Agencia"] // String = ""
         Nombre_Transportista <- map["Nombre_Transportista"] // = ""
         Codigo_Agencia <- map["Codigo_Agencia"] // = ""
         Code <- map["Code"] // = ""
         Estado <- map["Estado"] // Int = 0
         estadoDescripcion <- map["estadoDescripcion"] // String = ""
         inicialesComercial <- map["inicialesComercial"] // String = ""
         precio <- map["precio"] // = 0
         pesoKg <- map["pesoKg"] //Double = 0
         Matricula_Camion <- map["Matricula_Camion"] // = ""
         Matricula_Remolque <- map["Matricula_Remolque"] // = ""
         Transportista_DNI <- map["Transportista_DNI"] // = ""
         FechaSolicitud  <- (map["FechaSolicitud"], DateTransform()) //= Date()
         Localidad_Carga_1 <- map["Localidad_Carga_1"] // = ""
         Localidad_Carga_2  <- map["Localidad_Carga_2"] //= ""
         Localidad  <- map["Localidad"] //= ""
         Provincia  <- map["Provincia"] //= ""
         Provincia_Carga_1  <- map["Provincia_Carga_1"] //= ""
         Provincia_Carga_2  <- map["Provincia_Carga_2"] //= ""
         Doble_Descarga  <- map["Doble_Descarga"] //= ""
         Transporte_Cerrado  <- map["Transporte_Cerrado"] //= false
         No__Albaran__Venta  <- map["No__Albaran__Venta"] //= ""
         codigoPedido  <- map["codigoPedido"] //= ""
         Enviado_Pdf  <- map["Enviado_Pdf"] //= false
         Camion_Grua  <- map["Camion_Grua"] //= false
         Tauliner  <- map["Tauliner"] //= false
         Distancia_Fabrica  <- map["Distancia_Fabrica"] //= 0
         Search_Name <- map["Search_Name"] // = ""
         indice <- map["indice"] // = 0
    
    }
    

}

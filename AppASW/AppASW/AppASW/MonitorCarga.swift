//
//  MonitorCarga.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 5/7/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import Foundation
import EVReflection

public class MonitorCarga : EVObject {
    
    var Id:Int = 1
    var Cod__Agrupacion_Pedido: String = ""
    var Cod__Pedido_Transporte = ""
    var Fecha_Carga_Requerida: NSDate = NSDate()
    var FechaMinimaEntrega = NSDate()
    var Fecha_Minima_Entrega_Carga_1 = NSDate()
    var HoraSolicitud = NSDate()
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
    var FechaSolicitud = NSDate()
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
    
    
    

}
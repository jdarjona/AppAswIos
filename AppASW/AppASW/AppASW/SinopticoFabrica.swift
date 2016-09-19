//
//  SinopticoFabrica.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 2/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import UIKit
import EVReflection

class SinopticoFabrica: EVObject {
    
    var IdMaquina:String = ""
    var CodOperario:String = ""
    var Operario1:String = ""
    var Operario2:String = ""
    var UnidadMedida = ""
    var CodProducto:String = ""
    var CantidadObjectivo:Double = 0
    var CantidadProducidad:Double = 0
    var Conexion:Bool = false
    var Marcha:Bool = false
    var PesoObjetivo:Double = 0
    var PesoProducido:Double = 0
    var Rendimiento:Int = 0
    var SeccionMaquina:Int = 2

    
}

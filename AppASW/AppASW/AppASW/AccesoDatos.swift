//
//  AccesoDatos.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 6/7/16.
//  Copyright © 2016 Juande. All rights reserved.
//
import Foundation
import UIKit

import SystemConfiguration
import NetworkExtension
import SystemConfiguration.CaptiveNetwork


open class AccesoDatos: NSObject {
    
        fileprivate func isConnetedToNetWork() -> Bool {
        
            var hotspotQueue:DispatchQueue{
                return DispatchQueue.main
            }

        let prueba = NEHotspotHelper.register(options: [kNEHotspotHelperOptionDisplayName: "Hotspot" as NSObject], queue: hotspotQueue, handler: {(cmd: NEHotspotHelperCommand) -> Void in

            for item in cmd.networkList!{
                print(item.ssid)
                
            }
        })
            return prueba
            
    }

    func getListMonitorizacion(_ result:@escaping (_ result:[MonitorCarga])->Void)->Void{

        let listMonitor: MonitorCarga = MonitorCarga()
        let url = "api/ListadoMonitorizacion"
        ManagerJson.getList(listMonitor, Url: url , DatosCallBack: {(datosCallBack: [MonitorCarga])->Void in
            
            result(datosCallBack)
        })
        
    }
    
    func getPedido(_ codPedido:String, result:@escaping (_ result:PedidoVenta)->Void)->Void{
        
        let codPedidoUrl = String(codPedido.characters.map { $0 == "/" ? "_" : $0 })
        var url = "api/Pedidos?codPedido=%@"
        url = String(format: url,codPedidoUrl)
        //let pedidoVenta: PedidoVenta = PedidoVenta()
        ManagerJson.getJson(url ,DatosCallBack:{(json:String)->Void in
            
            let pedido = PedidoVenta(JSONString: json)
            
            result(pedido!)
        })
        
    }
    
    func getOferta(_ codOferta:String, result:@escaping (_ result:OfertaVenta)->Void)->Void{
        
        let codOfertaUrl = String(codOferta)
        var url = "api/Ofertas?codOferta=%@"
        url = String(format: url,codOfertaUrl!)
        //let pedidoVenta: PedidoVenta = PedidoVenta()
        ManagerJson.getJson(url ,DatosCallBack:{(json:String)->Void in
            
            let oferta = OfertaVenta()
            
            result(oferta)
        })
        
    }
}

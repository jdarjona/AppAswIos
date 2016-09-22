//
//  ManagerVentas.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 21/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import Foundation


public class ManagerVentas {



    static public func getPedido(codPedido:String, result:(result:PedidoVenta)->Void)->Void{
        
        let codPedidoUrl = String(codPedido.characters.map { $0 == "/" ? "_" : $0 })
        var url = "api/Pedidos?codPedido=%@"
        url = String(format: url,codPedidoUrl)
        //let pedidoVenta: PedidoVenta = PedidoVenta()
        ManagerJson.getJson(url ,DatosCallBack:{(json:String)->Void in
            
            let pedido = PedidoVenta(json:json)
            
            result(result:pedido)
        })
        
    }
    
    static public func getOferta(codOferta:String, result:(result:OfertaVenta)->Void)->Void{
        
        let codOfertaUrl = String(codOferta)
        var url = "api/Ofertas?codOferta=%@"
        url = String(format: url,codOfertaUrl)
        //let pedidoVenta: PedidoVenta = PedidoVenta()
        ManagerJson.getJson(url ,DatosCallBack:{(json:String)->Void in
            
            let oferta = OfertaVenta(json:json)
            
            result(result:oferta)
        })
        
    }
    
    static public func updateOferta(oferta:OfertaVenta, result:(result:OfertaVenta)->Void)->Void {
    
        let url = "api/Ofertas"
        
        ManagerJson.updateJson(oferta, Url: url, DatosCallBack: { (json:String) in
            
            let oferta = OfertaVenta(json:json)
            result(result:oferta)
            
        })
    
    
    
    
    }




}
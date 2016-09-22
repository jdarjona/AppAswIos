//
//  ManagerVentas.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 21/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import Foundation


public class ManagerVentas {


// MARK: Pedidos
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
    
// MARK: Oferta
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
    
    static public func createOferta(codCliente:String, codAlmacen: String, result:(result: OfertaVenta)->Void)->Void {
        
        var url = "api/Ofertas?codCliente=%@&codAlmacen=%@"
        url = String(format: url, codCliente, codAlmacen)
        ManagerJson.getJson(url ,DatosCallBack:{(json:String)->Void in
            
            let oferta = OfertaVenta(json:json)
            
            result(result:oferta)
        })
        
        
        
        
    }

    
// MARK: Clientes
    
    static public func getClientes( Result:(result: [Clientes])->Void) ->Void{
    
    
        let url = "api/Clientes"
        let clientes: Clientes = Clientes()
        ManagerJson.getList(clientes, Url: url) { (datosCallBack:[Clientes]) in
            Result(result: datosCallBack)
        }
    
    
    }
    
// MARK: Almacenes
    
    static public func getAlmacenes( Result:(result: [Almacenes])->Void) ->Void{
        
        
        let url = "api/Almacenes"
        let almacenes: Almacenes = Almacenes()
        ManagerJson.getList(almacenes, Url: url) { (datosCallBack:[Almacenes]) in
            Result(result: datosCallBack)
        }
        
        
    }
    
// MARK: DireccionesEnvio
    
    static public func getDireccionesEnvio( Result:(result: [DireccionesEnvio])->Void) ->Void{
        
        
        let url = "api/DireccionesEnvio"
        let direccionesEnvio: DireccionesEnvio = DireccionesEnvio()
        ManagerJson.getList(direccionesEnvio, Url: url) { (datosCallBack:[DireccionesEnvio]) in
            Result(result: datosCallBack)
        }
        
        
    }

 // MARK: Productos
    
    static public func getDireccionesEnvio( Result:(result: [Productos])->Void) ->Void{
        
        
        let url = "api/Productos"
        let productos: Productos = Productos()
        ManagerJson.getList(productos, Url: url) { (datosCallBack:[Productos]) in
            Result(result: datosCallBack)
        }
        
        
    }

// MARK: PostCode
    
    static public func getPostCode( Result:(result: [PostCode])->Void) ->Void{
        
        
        let url = "api/PostCode"
        let postCode: PostCode = PostCode()
        ManagerJson.getList(postCode, Url: url) { (datosCallBack:[PostCode]) in
            Result(result: datosCallBack)
        }
        
        
    }

}
//
//  ManagerVentas.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 21/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import Foundation


open class ManagerVentas {


    static open var clientes:[Clientes] =  []
    static open var pedidos:[PedidoVenta] =  []
    static open var ofertas:[OfertaVenta] =  []
    static open var almacenes:[Almacen] =  []
    static open var contacto:[Contacto] = []
    static open var direccionesEnvio:[DireccionesEnvio] =  []
    static open var productos:[Productos] =  []
    static open var postCode:[PostCode] = []
    static open var nuevaOferta:OfertaVenta = OfertaVenta()

    
// MARK: Pedidos
    static func initialize(){
        
        getClientes { (result) in
            self.clientes = result
        }
        
        getPostCode { (result) in
            self.postCode = result
        }
        
//        getProductos {(result) in
//            self.productos = result
//        }
        
        getDireccionesEnvio {(result) in
            self.direccionesEnvio = result
        }
        
        getAlmacenes{(result) in
            self.almacenes = result
        }
        getContactos{(result) in
            self.contacto = result
        }
        
    
    }
    
    static open func getPedido(_ codPedido:String, result:@escaping (_ result:PedidoVenta)->Void)->Void{
        
        let codPedidoUrl = String(codPedido.characters.map { $0 == "/" ? "_" : $0 })
        var url = "api/Pedidos?codPedido=%@"
        url = String(format: url,codPedidoUrl)
        //let pedidoVenta: PedidoVenta = PedidoVenta()
        ManagerJson.getJson(url ,DatosCallBack:{(json:String)->Void in
            
            let pedido = PedidoVenta()
            
            result(pedido)
        })
        
    }
    
// MARK: Oferta
    static open func getOferta(_ codOferta:String, result:@escaping (_ result:OfertaVenta)->Void)->Void{
        
        let codOfertaUrl = String(codOferta)
        var url = "api/Ofertas?codOferta=%@"
        url = String(format: url,codOfertaUrl!)
        //let pedidoVenta: PedidoVenta = PedidoVenta()
        ManagerJson.getJson(url ,DatosCallBack:{(json:String)->Void in
            
            let oferta = OfertaVenta()
            
            result(oferta)
        })
        
    }
    
    static open func updateOferta(_ oferta:OfertaVenta, result:@escaping (_ result:OfertaVenta)->Void)->Void {
    
        let url = "api/Ofertas"
        
        ManagerJson.updateJson(oferta, Url: url, DatosCallBack: { (json:String) in
            
            let oferta = OfertaVenta()
            result(oferta)
            
        })
    
    
    
    
    }
    
    static open func createOferta(_ codCliente:String, codAlmacen: String, result:@escaping (_ result: OfertaVenta)->Void)->Void {
        
        var url = "api/Ofertas?codCliente=%@&codAlmacen=%@"
        url = String(format: url, codCliente, codAlmacen)
        ManagerJson.getJson(url ,DatosCallBack:{(json:String)->Void in
            
            let oferta = OfertaVenta()
            
            result(oferta)
        })       
    }

    
// MARK: Clientes
    
    static open func getClientes( _ Result:@escaping (_ result: [Clientes])->Void) ->Void{
    
    
        let url = "api/Clientes"
        let clientes: Clientes = Clientes()
        ManagerJson.getList(clientes, Url: url) { (datosCallBack:[Clientes]) in
            Result(datosCallBack)
        }
    
    
    }
    
// MARK: Almacenes
    
    static open func getAlmacenes( _ Result:@escaping (_ result: [Almacen])->Void) ->Void{
        
        
        let url = "api/Almacenes"
        let almacenes: Almacen = Almacen()
        ManagerJson.getList(almacenes, Url: url) { (datosCallBack:[Almacen]) in
            Result(datosCallBack)
        }
        
        
    }
// MARK: Contactos
    static open func getContactos( _ Result:@escaping (_ result: [Contacto])->Void) ->Void{
        
        
        let url = "api/Contactos"
        let contactos: Contacto = Contacto()
        ManagerJson.getList(contactos, Url: url) { (datosCallBack:[Contacto]) in
            Result(datosCallBack)
        }
        
        
    }
    
// MARK: DireccionesEnvio
    
    static open func getDireccionesEnvio( _ Result:@escaping (_ result: [DireccionesEnvio])->Void) ->Void{
        
        
        let url = "api/DireccionesEnvio"
        let direccionesEnvio: DireccionesEnvio = DireccionesEnvio()
        ManagerJson.getList(direccionesEnvio, Url: url) { (datosCallBack:[DireccionesEnvio]) in
            Result(datosCallBack)
        }
        
        
    }

 // MARK: Productos
    
    static open func getProductos( _ Result:@escaping (_ result: [Productos])->Void) ->Void{
        
        
        let url = "api/Productos"
        let productos: Productos = Productos()
        ManagerJson.getList(productos, Url: url) { (datosCallBack:[Productos]) in
            Result(datosCallBack)
        }
        
        
    }

// MARK: PostCode
    
    static open func getPostCode( _ Result:@escaping (_ result: [PostCode])->Void) ->Void{
        
        
        let url = "api/PostCode"
        let postCode: PostCode = PostCode()
        ManagerJson.getList(postCode, Url: url) { (datosCallBack:[PostCode]) in
            Result(datosCallBack)
        }
        
        
    }

}

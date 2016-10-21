//
//  OfertaVenta.swift
//  AppASW
//
//  Created by Administrador on 19/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper
import AlamofireObjectMapper

 public class OfertaVenta:NSObject, Mappable {
    
    var keyField: String = ""
    var noField: String = ""
    var sell_to_Customer_NoField: String = ""
    var sell_to_Contact_NoField: String = ""
    var sell_to_Customer_NameField: String = ""
    var sell_to_ContactField: String = ""
    var sell_to_AddressField: String = ""
    var sell_to_Address_2Field: String = ""
    var sell_to_CityField: String = ""
    var codigo_Cliente_ContactoField: String = ""
    var telefono_ClienteField: String = ""
    var fax_ClienteField: String = ""
    var email_ClienteField: String = ""
    var vAT_Registration_NoField: String = ""
    var no_of_Archived_VersionsField: Int = 0
    var no_of_Archived_VersionsFieldSpecified: Bool = false
    var order_DateField: Date = Date()
    var order_DateFieldSpecified: Bool = false
    var document_DateField: Date = Date()
    var document_DateFieldSpecified: Bool = false
    var requested_Delivery_DateField: Date = Date()
    var requested_Delivery_DateFieldSpecified: Bool = false
    var promised_Delivery_DateField: Date = Date()
    var promised_Delivery_DateFieldSpecified: Bool = false
    var numero_IncidenciasField: Int = 0
    var numero_IncidenciasFieldSpecified: Bool = false
    var salesperson_CodeField: String = ""
    var cod_Agrupacion_PedidoField: String = ""
    var statusField: Int = 0
    var statusFieldSpecified: Bool = false
    var eslingasField: Bool = false
    var eslingasFieldSpecified: Bool = false
    var fecha_Revision_PreciosField: Date = Date()
    var fecha_Revision_PreciosFieldSpecified: Bool = false
    var external_Document_NoField: String = ""
    var ship_to_CodeField: String = ""
    var ship_to_NameField: String = ""
    var ship_to_AddressField: String = ""
    var ship_to_Address_2Field: String = ""
    var ship_to_Post_CodeField: String = ""
    var ship_to_CityField: String = ""
    var ship_to_CountyField: String = ""
    var ship_to_ContactField: String = ""
    var ship_to_Country_Region_CodeField: String = ""
    var location_CodeField: String = ""
    var shipment_DateField: Date = Date()
    var shipment_DateFieldSpecified: Bool = false
    var coste_Total_TransporteField: Float = 0
    var coste_Total_TransporteFieldSpecified: Bool = false
    var euros_Tm_PorteField: Float = 0
    var euros_Tm_PorteFieldSpecified: Bool = false
    var tipo_Gestion_TransporteField: Int = 0
    var tipo_Gestion_TransporteFieldSpecified: Bool = false
    var nº_Camiones_CalField: Int = 0
    var nº_Camiones_CalFieldSpecified: Bool = false
    var telefono_ContactoField: String = ""
    var email_ContactoField: String = ""
    var movil_ContactoField: String = ""
    var fax_ContactoField: String = ""
    var cargo_ContactoField: String = ""
    var comentariosField: String = ""
    var email_EnvioField: String = ""
    var telefono_EnvioField: String = ""
    var fax_EnvioField: String = ""
    var doble_DescargaField: Bool = false
    var doble_DescargaFieldSpecified: Bool = false
    var cod_Agencia_TransporteField: String = ""
    var camion_GruaField: Bool = false
    var camion_GruaFieldSpecified: Bool = false
    var idAlmacenField: Int = 0
    var idAlmacenFieldSpecified: Bool = false
    var salesLinesField :[Sales_Quote_Subform_ws] = [Sales_Quote_Subform_ws]()
    
    override init() {
        super.init()
    }
    
    convenience required public init?(map: Map){
        self.init()
    }
    
    
    public func mapping(map: Map) {
         keyField <- map["keyField"] // String = ""
         noField <- map["lonoFieldcation"] // String = ""
         sell_to_Customer_NoField <- map["sell_to_Customer_NoField"] // String = ""
         sell_to_Contact_NoField <- map["sell_to_Contact_NoField"] // String = ""
         sell_to_Customer_NameField <- map["sell_to_Customer_NameField"] // String = ""
         sell_to_ContactField <- map["sell_to_ContactField"] // String = ""
         sell_to_AddressField <- map["sell_to_AddressField"] // String = ""
         sell_to_Address_2Field <- map["sell_to_Address_2Field"] // String = ""
         sell_to_CityField <- map["sell_to_CityField"] // String = ""
         codigo_Cliente_ContactoField <- map["codigo_Cliente_ContactoField"] // String = ""
         telefono_ClienteField <- map["telefono_ClienteField"] // String = ""
         fax_ClienteField <- map["fax_ClienteField"] // String = ""
         email_ClienteField <- map["email_ClienteField"] // String = ""
         vAT_Registration_NoField <- map["vAT_Registration_NoField"] // String = ""
         no_of_Archived_VersionsField <- map["no_of_Archived_VersionsField"] // Int = 0
         no_of_Archived_VersionsFieldSpecified <- map["no_of_Archived_VersionsFieldSpecified"] // Bool = false
         order_DateField <- (map["order_DateField"], DateTransform()) // Date = Date()
         order_DateFieldSpecified <- map["order_DateFieldSpecified"] // Bool = false
         document_DateField <- (map["document_DateField"], DateTransform()) // Date = Date()
         document_DateFieldSpecified <- map["document_DateFieldSpecified"] // Bool = false
         requested_Delivery_DateField <- (map["requested_Delivery_DateField"], DateTransform()) // Date = Date()
         requested_Delivery_DateFieldSpecified <- map["requested_Delivery_DateFieldSpecified"] // Bool = false
         promised_Delivery_DateField <- (map["promised_Delivery_DateField"], DateTransform()) // Date = Date()
         promised_Delivery_DateFieldSpecified <- map["promised_Delivery_DateFieldSpecified"] // Bool = false
         numero_IncidenciasField <- map["numero_IncidenciasField"] // Int = 0
         numero_IncidenciasFieldSpecified <- map["numero_IncidenciasFieldSpecified"] // Bool = false
         salesperson_CodeField <- map["salesperson_CodeField"] // String = ""
         cod_Agrupacion_PedidoField <- map["cod_Agrupacion_PedidoField"] // String = ""
         statusField <- map["statusField"] // Int = 0
         statusFieldSpecified <- map["statusFieldSpecified"] // Bool = false
         eslingasField <- map["eslingasField"] // Bool = false
         eslingasFieldSpecified <- map["eslingasFieldSpecified"] // Bool = false
         fecha_Revision_PreciosField <- (map["fecha_Revision_PreciosField"], DateTransform()) // Date = Date()
         fecha_Revision_PreciosFieldSpecified <- map["fecha_Revision_PreciosFieldSpecified"] // Bool = false
         external_Document_NoField <- map["external_Document_NoField"] // String = ""
         external_Document_NoField <- map["external_Document_NoField"] // String = ""
         ship_to_NameField <- map["ship_to_NameField"] // String = ""
         ship_to_AddressField <- map["ship_to_AddressField"] // String = ""
         ship_to_Address_2Field <- map["ship_to_Address_2Field"] // String = ""
         ship_to_Post_CodeField <- map["ship_to_Post_CodeField"] // String = ""
         ship_to_CityField <- map["ship_to_CityField"] // String = ""
         ship_to_CountyField <- map["locaship_to_CountyFieldtion"] // String = ""
         ship_to_ContactField <- map["ship_to_ContactField"] // String = ""
         ship_to_Country_Region_CodeField <- map["ship_to_Country_Region_CodeField"] // String = ""
         location_CodeField <- map["location_CodeField"] // String = ""
         shipment_DateField <- (map["shipment_DateField"], DateTransform()) // Date = Date()
         shipment_DateFieldSpecified <- map["shipment_DateFieldSpecified"] // Bool = false
         coste_Total_TransporteField <- map["coste_Total_TransporteField"] // Float = 0
         coste_Total_TransporteFieldSpecified <- map["coste_Total_TransporteFieldSpecified"] // Bool = false
         euros_Tm_PorteField <- map["euros_Tm_PorteField"] // Float = 0
         euros_Tm_PorteFieldSpecified <- map["euros_Tm_PorteFieldSpecified"] // Bool = false
         tipo_Gestion_TransporteField <- map["tipo_Gestion_TransporteField"] // Int = 0
         tipo_Gestion_TransporteFieldSpecified <- map["tipo_Gestion_TransporteFieldSpecified"] // Bool = false
         nº_Camiones_CalField <- map["nº_Camiones_CalField"] // Int = 0
         nº_Camiones_CalFieldSpecified <- map["nº_Camiones_CalFieldSpecified"] // Bool = false
         telefono_ContactoField <- map["telefono_ContactoField"] // String = ""
         email_ContactoField <- map["email_ContactoField"] // String = ""
         movil_ContactoField <- map["movil_ContactoField"] // String = ""
         fax_ContactoField <- map["fax_ContactoField"] // String = ""
         cargo_ContactoField <- map["cargo_ContactoField"] // String = ""
         comentariosField <- map["comentariosField"] // String = ""
         email_EnvioField <- map["email_EnvioField"] // String = ""
         telefono_EnvioField <- map["telefono_EnvioField"] // String = ""
         fax_EnvioField <- map["fax_EnvioField"] // String = ""
         doble_DescargaField <- map["doble_DescargaField"] // Bool = false
         doble_DescargaFieldSpecified <- map["doble_DescargaFieldSpecified"] // Bool = false
         cod_Agencia_TransporteField <- map["cod_Agencia_TransporteField"] // String = ""
         camion_GruaField <- map["camion_GruaField"] // Bool = false
         camion_GruaFieldSpecified <- map["camion_GruaFieldSpecified"] // Bool = false
         idAlmacenField <- map["idAlmacenField"] // Int = 0
         idAlmacenFieldSpecified <- map["idAlmacenFieldSpecified"] // Bool = false
         salesLinesField  <- map["salesLinesField"] //[Sales_Quote_Subform_ws] = [Sales_Quote_Subform_ws]()
    
    }

}

public class Sales_Quote_Subform_ws: NSObject, Mappable {
    
    var keyField: String = ""
    var document_NoField: String = ""
    var typeField: Int = 0
    var typeFieldSpecified:   Bool = false
    var noField: String = ""
    var variant_CodeField: String = ""
    var vAT_Prod_Posting_GroupField: String = ""
    var descriptionField: String = ""
    var location_CodeField: String = ""
    var quantityField: Float = 0
    var quantityFieldSpecified:   Bool = false   
    var unit_of_Measure_CodeField: String = ""
    var unit_of_MeasureField: String = ""
    var cantidad_PAQField: Float = 0
    var cantidad_PAQFieldSpecified:   Bool = false
    var cantidad_PAÑOField: Float = 0
    var cantidad_PAÑOFieldSpecified:   Bool = false    
    var cantidad_M2Field: Float = 0
    var cantidad_M2FieldSpecified:   Bool = false
    var cantidad_KGField: Float = 0
    var cantidad_KGFieldSpecified:   Bool = false
    var descuentoField: Float = 0
    var descuentoFieldSpecified:   Bool = false
    var unit_PriceField: Float = 0
    var unit_PriceFieldSpecified:   Bool = false
    var precio_Ud_DestinoField: Float = 0
    var precio_Ud_DestinoFieldSpecified:   Bool = false
    var line_AmountField: Float = 0
    var line_AmountFieldSpecified:   Bool = false
    var precio_M2_DestinoField: Float = 0
    var precio_M2_DestinoFieldSpecified:   Bool = false
    var precio_PANO_DestinoField: Float = 0
    var precio_PANO_DestinoFieldSpecified:   Bool = false
    var precio_TM_DestinoField: Float = 0
    var precio_TM_DestinoFieldSpecified:   Bool = false
    var paquetesPendientesCargarField: Float = 0
    var paquetesPendientesCargarFieldSpecified:   Bool = false
    var paquetes_CargadosField: Float = 0
    var paquetes_CargadosFieldSpecified:   Bool = false
    var line_NoField: Int = 0
    var line_NoFieldSpecified:   Bool = false
    var aliasField: String = ""
    var precio_Patio_M2Field: Float = 0
    var precio_Patio_M2FieldSpecified:   Bool = false
    var precio_Patio_TMField: Float = 0
    var precio_Patio_TMFieldSpecified:   Bool = false
    var precio_Patio_PanoField: Float = 0
    var precio_Patio_PanoFieldSpecified:   Bool = false
    var precioLineaTotalField: Float = 0
    var precioLineaTotalFieldSpecified:   Bool = false
    var precioLineaTotalPatioField: Float = 0
    var precioLineaTotalPatioFieldSpecified:   Bool = false
    
    override init() {
        super.init()
    }
    
    convenience required public init?(map: Map){
        self.init()
    }
    
    
    public func mapping(map: Map) {
         keyField <- map["keyField"] // String = ""
         document_NoField <- map["document_NoField"] // String = ""
         typeField <- map["typeField"] // Int = 0
         typeFieldSpecified <- map["typeFieldSpecified"] //   Bool = false
         noField <- map["noField"] // String = ""
         variant_CodeField <- map["variant_CodeField"] // String = ""
         vAT_Prod_Posting_GroupField <- map["vAT_Prod_Posting_GroupField"] // String = ""
         descriptionField <- map["descriptionField"] // String = ""
         location_CodeField <- map["location_CodeField"] // String = ""
         quantityField <- map["quantityField"] // Float = 0
         quantityFieldSpecified <- map["quantityFieldSpecified"] //   Bool = false
         unit_of_Measure_CodeField <- map["unit_of_Measure_CodeField"] // String = ""
         unit_of_MeasureField <- map["unit_of_MeasureField"] // String = ""
         cantidad_PAQField <- map["cantidad_PAQField"] // Float = 0
         cantidad_PAQFieldSpecified <- map["cantidad_PAQFieldSpecified"] //   Bool = false
         cantidad_PAÑOField <- map["cantidad_PAÑOField"] // Float = 0
         cantidad_PAÑOFieldSpecified <- map["cantidad_PAÑOFieldSpecified"] //   Bool = false
         cantidad_M2Field <- map["cantidad_M2Field"] // Float = 0
         cantidad_M2FieldSpecified <- map["cantidad_M2FieldSpecified"] //   Bool = false
         cantidad_KGField <- map["cantidad_KGField"] // Float = 0
         cantidad_KGFieldSpecified <- map["cantidad_KGFieldSpecified"] //   Bool = false
         descuentoField <- map["descuentoField"] // Float = 0
         descuentoFieldSpecified <- map["descuentoFieldSpecified"] //   Bool = false
         unit_PriceField <- map["unit_PriceField"] // Float = 0
         unit_PriceFieldSpecified <- map["unit_PriceFieldSpecified"] //   Bool = false
         precio_Ud_DestinoField <- map["precio_Ud_DestinoField"] // Float = 0
         precio_Ud_DestinoFieldSpecified <- map["precio_Ud_DestinoFieldSpecified"] //   Bool = false
         line_AmountField <- map["line_AmountField"] // Float = 0
         line_AmountFieldSpecified <- map["line_AmountFieldSpecified"] //   Bool = false
         precio_M2_DestinoField <- map["precio_M2_DestinoField"] // Float = 0
         precio_M2_DestinoFieldSpecified <- map["precio_M2_DestinoFieldSpecified"] //   Bool = false
         precio_PANO_DestinoField <- map["precio_PANO_DestinoField"] // Float = 0
         precio_PANO_DestinoFieldSpecified <- map["precio_PANO_DestinoFieldSpecified"] //   Bool = false
         precio_TM_DestinoField <- map["precio_TM_DestinoField"] // Float = 0
         precio_TM_DestinoFieldSpecified <- map["precio_TM_DestinoFieldSpecified"] //   Bool = false
         paquetesPendientesCargarField <- map["paquetesPendientesCargarField"] // Float = 0
         paquetesPendientesCargarFieldSpecified <- map["paquetesPendientesCargarFieldSpecified"] //   Bool = false
         paquetes_CargadosField <- map["paquetes_CargadosField"] // Float = 0
         paquetes_CargadosFieldSpecified <- map["paquetes_CargadosFieldSpecified"] //   Bool = false
         line_NoField <- map["line_NoField"] // Int = 0
         line_NoFieldSpecified <- map["line_NoFieldSpecified"] //   Bool = false
         aliasField <- map["aliasField"] // String = ""
         precio_Patio_M2Field <- map["precio_Patio_M2Field"] // Float = 0
         precio_Patio_M2FieldSpecified <- map["precio_Patio_M2FieldSpecified"] //   Bool = false
         precio_Patio_TMField <- map["precio_Patio_TMField"] // Float = 0
         precio_Patio_TMFieldSpecified <- map["precio_Patio_TMFieldSpecified"] //   Bool = false
         precio_Patio_PanoField <- map["precio_Patio_PanoField"] // Float = 0
         precio_Patio_PanoFieldSpecified <- map["precio_Patio_PanoFieldSpecified"] //   Bool = false
         precioLineaTotalField <- map["precioLineaTotalField"] // Float = 0
         precioLineaTotalFieldSpecified <- map["precioLineaTotalFieldSpecified"] //   Bool = false
         precioLineaTotalPatioField <- map["precioLineaTotalPatioField"] // Float = 0
         precioLineaTotalPatioFieldSpecified <- map["precioLineaTotalPatioFieldSpecified"] //   Bool = false
    }

}



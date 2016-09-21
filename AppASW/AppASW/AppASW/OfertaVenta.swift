//
//  OfertaVenta.swift
//  AppASW
//
//  Created by Administrador on 19/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import Foundation
import UIKit
import EVReflection

public class OfertaVenta : EVObject {
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
    var order_DateField: NSDate = NSDate()
    var order_DateFieldSpecified: Bool = false
    var document_DateField: NSDate = NSDate()
    var document_DateFieldSpecified: Bool = false
    var requested_Delivery_DateField: NSDate = NSDate()
    var requested_Delivery_DateFieldSpecified: Bool = false
    var promised_Delivery_DateField: NSDate = NSDate()
    var promised_Delivery_DateFieldSpecified: Bool = false
    var numero_IncidenciasField: Int = 0
    var numero_IncidenciasFieldSpecified: Bool = false
    var salesperson_CodeField: String = ""
    var cod_Agrupacion_PedidoField: String = ""
    var statusField: Int = 0
    var statusFieldSpecified: Bool = false
    var eslingasField: Bool = false
    var eslingasFieldSpecified: Bool = false
    var fecha_Revision_PreciosField: NSDate = NSDate()
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
    var shipment_DateField: NSDate = NSDate()
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
    required public init(){
        
    }

}

public class Sales_Quote_Subform_ws: EVObject {
    
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
    

}



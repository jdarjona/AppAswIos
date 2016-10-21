//
//  DireccionesEnvio.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 22/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import Foundation
import ObjectMapper

open class DireccionesEnvio:NSObject, Mappable {
    
    var keyField: String = "" //": "sample string 1",
    var codeField: String = "" //": "sample string 2",
    var nameField: String = "" //": "sample string 3",
    var addressField: String = "" //": "sample string 4",
    var address_2Field: String = "" //": "sample string 5",
    var post_CodeField: String = "" //": "sample string 6",
    var cityField: String = "" //": "sample string 7",
    var countyField: String = "" //": "sample string 8",
    var country_Region_CodeField: String = "" //": "sample string 9",
    var phone_NoField: String = "" //": "sample string 10",
    var contactField: String = "" //": "sample string 11",
    var otros_datosField: String = "" //": "sample string 12",
    var location_CodeField: String = "" //": "sample string 13",
    var shipment_Method_CodeField: String = "" //": "sample string 14",
    var shipping_Agent_CodeField: String = "" //": "sample string 15",
    var shipping_Agent_Service_CodeField: String = "" //": "sample string 16",
    var service_Zone_CodeField: String = "" //": "sample string 17",
    var last_Date_ModifiedField: Date = Date() //": "2016-09-22T11:18:29.8711078+02:00",
    var last_Date_ModifiedFieldSpecified: Bool = false //": true,
    var telex_NoField: String = "" //": "sample string 20",
    var fax_NoField: String = "" //": "sample string 21",
    var e_MailField: String = "" //": "sample string 22",
    var home_PageField: String = "" //": "sample string 23",
    var customer_NoField: String = "" //": "sample string 24",
    //"PropertyChanged": null

    
    override init() {
        super.init()
    }
    
    convenience required public init?(map: Map){
        self.init()
    }
    
    
    public func mapping(map: Map) {
         keyField <- map["keyField"] // String = "" //" <- map["location"] // "sample string 1",
         codeField <- map["codeField"] // String = "" //" <- map["location"] // "sample string 2",
         nameField <- map["nameField"] // String = "" //" <- map["location"] // "sample string 3",
         addressField <- map["addressField"] // String = "" //" <- map["location"] // "sample string 4",
         address_2Field <- map["address_2Field"] // String = "" //" <- map["location"] // "sample string 5",
         post_CodeField <- map["post_CodeField"] // String = "" //" <- map["location"] // "sample string 6",
         cityField <- map["cityField"] // String = "" //" <- map["location"] // "sample string 7",
         countyField <- map["countyField"] // String = "" //" <- map["location"] // "sample string 8",
         country_Region_CodeField <- map["country_Region_CodeField"] // String = "" //" <- map["location"] // "sample string 9",
         phone_NoField <- map["phone_NoField"] // String = "" //" <- map["location"] // "sample string 10",
         contactField <- map["contactField"] // String = "" //" <- map["location"] // "sample string 11",
         otros_datosField <- map["otros_datosField"] // String = "" //" <- map["location"] // "sample string 12",
         location_CodeField <- map["location_CodeField"] // String = "" //" <- map["location"] // "sample string 13",
         shipment_Method_CodeField <- map["shipment_Method_CodeField"] // String = "" //" <- map["location"] // "sample string 14",
         shipping_Agent_CodeField <- map["shipping_Agent_CodeField"] // String = "" //" <- map["location"] // "sample string 15",
         shipping_Agent_Service_CodeField <- map["shipping_Agent_Service_CodeField"] // String = "" //" <- map["location"] // "sample string 16",
         service_Zone_CodeField <- map["service_Zone_CodeField"] // String = "" //" <- map["location"] // "sample string 17",
         last_Date_ModifiedField <- map["last_Date_ModifiedField"] // Date = Date() //" <- map["location"] // "2016-09-22T11 <- map["location"] //18 <- map["location"] //29.8711078+02 <- map["location"] //00",
         last_Date_ModifiedFieldSpecified <- map["last_Date_ModifiedFieldSpecified"] // Bool = false //" <- map["location"] // true,
         telex_NoField <- map["telex_NoField"] // String = "" //" <- map["location"] // "sample string 20",
         fax_NoField <- map["fax_NoField"] // String = "" //" <- map["location"] // "sample string 21",
         e_MailField <- map["e_MailField"] // String = "" //" <- map["location"] // "sample string 22",
         home_PageField <- map["home_PageField"] // String = "" //" <- map["location"] // "sample string 23",
         customer_NoField <- map["customer_NoField"] // String = "" //": "sample string 24",
    }
}

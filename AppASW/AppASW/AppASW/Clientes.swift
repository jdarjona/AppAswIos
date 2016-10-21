//
//  Clientes.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 22/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import Foundation
import ObjectMapper

open class Clientes:NSObject, Mappable {
    
    var keyField: String = "" //": "sample string 1",
    var noField: String = ""//": "sample string 2",
    var nameField: String = ""//: "sample string 3",
    var location_CodeField: String = "" //": "sample string 4",
    var post_CodeField: String = "" //": "sample string 5",
    var country_Region_CodeField: String = "" //": "sample string 6",
    var phone_NoField: String = "" //": "sample string 7",
    var fax_NoField: String = "" //": "sample string 8",
    var addressField: String = "" //": "sample string 9",
    var address_2Field: String = "" //": "sample string 10",
    var cityField: String = "" //": "sample string 11",
    var contactField: String = "" //": "sample string 12",
    var salesperson_CodeField: String = "" //": "sample string 13",
    var dias_PagoField: String = "" //": "sample string 14",
    var forma_PagoField: String = "" //": "sample string 15",
    var search_NameField: String = "" //": "sample string 16",
    var credit_Limit_LCYField: Double = 0 //": 17.0,
    var credit_Limit_LCYFieldSpecified: Bool = false //": true,
    var cred_Max_CESCEField: Double = 0 //": 19.0,
    var cred_Max_CESCEFieldSpecified: Bool = false //": true,
    var balanceField: Double = 0 //": 21.0,
    var balanceFieldSpecified: Bool = false //": true,
    var e_MailField: String = "" //": "sample string 23",
    var home_PageField: String = "" //": "sample string 24",
    var vAT_Registration_NoField: String = "" //": "sample string 25",
    var countyField: String = "" //": "sample string 26",
    var name_2Field: String = "" //": "sample string 27",
    var codigo_Cliente_ContactoField: String = "" //": "sample string 28",
    var eMail_AdministrativoField: String = "" //": "sample string 29",
    var saldo_DisponibleField: Double = 0 //": 30.0,
    var saldo_DisponibleFieldSpecified: Bool = false //": true,
    var saldo_VencidosField: Double = 0 //": 32.0,
    var saldo_VencidosFieldSpecified: Bool = false //": true,
    var saldoField: Double = 0 //": 34.0,
    var saldoFieldSpecified: Bool = false//": true,
    //"PropertyChanged": null

    
    
    
    override init() {
        super.init()
    }
    
    convenience required public init?(map: Map){
        self.init()
    }
    
    
    public func mapping(map: Map) {
     keyField <- map["keyField"] // String = "" //" <- map["location"] // "sample string 1",
     noField <- map["noField"] // String = ""//" <- map["location"] // "sample string 2",
     nameField <- map["nameField"] // String = ""// <- map["location"] // "sample string 3",
     location_CodeField <- map["location_CodeField"] // String = "" //" <- map["location"] // "sample string 4",
     post_CodeField <- map["post_CodeField"] // String = "" //" <- map["location"] // "sample string 5",
     country_Region_CodeField <- map["country_Region_CodeField"] // String = "" //" <- map["location"] // "sample string 6",
     phone_NoField <- map["phone_NoField"] // String = "" //" <- map["location"] // "sample string 7",
     fax_NoField <- map["fax_NoField"] // String = "" //" <- map["location"] // "sample string 8",
     addressField <- map["addressField"] // String = "" //" <- map["location"] // "sample string 9",
     address_2Field <- map["address_2Field"] // String = "" //" <- map["location"] // "sample string 10",
     cityField <- map["cityField"] // String = "" //" <- map["location"] // "sample string 11",
     contactField <- map["contactField"] // String = "" //" <- map["location"] // "sample string 12",
     salesperson_CodeField <- map["salesperson_CodeField"] // String = "" //" <- map["location"] // "sample string 13",
     dias_PagoField <- map["dias_PagoField"] // String = "" //" <- map["location"] // "sample string 14",
     forma_PagoField <- map["forma_PagoField"] // String = "" //" <- map["location"] // "sample string 15",
     search_NameField <- map["search_NameField"] // String = "" //" <- map["location"] // "sample string 16",
     credit_Limit_LCYField <- map["credit_Limit_LCYField"] // Double = 0 //" <- map["location"] // 17.0,
     credit_Limit_LCYFieldSpecified <- map["credit_Limit_LCYFieldSpecified"] // Bool = false //" <- map["location"] // true,
     cred_Max_CESCEField <- map["cred_Max_CESCEField"] // Double = 0 //" <- map["location"] // 19.0,
     cred_Max_CESCEFieldSpecified <- map["cred_Max_CESCEFieldSpecified"] // Bool = false //" <- map["location"] // true,
     balanceField <- map["balanceField"] // Double = 0 //" <- map["location"] // 21.0,
     balanceFieldSpecified <- map["balanceFieldSpecified"] // Bool = false //" <- map["location"] // true,
     e_MailField <- map["e_MailField"] // String = "" //" <- map["location"] // "sample string 23",
     home_PageField <- map["home_PageField"] // String = "" //" <- map["location"] // "sample string 24",
     vAT_Registration_NoField <- map["vAT_Registration_NoField"] // String = "" //" <- map["location"] // "sample string 25",
     countyField <- map["countyField"] // String = "" //" <- map["location"] // "sample string 26",
     name_2Field <- map["name_2Field"] // String = "" //" <- map["location"] // "sample string 27",
     codigo_Cliente_ContactoField <- map["codigo_Cliente_ContactoField"] // String = "" //" <- map["location"] // "sample string 28",
     eMail_AdministrativoField <- map["eMail_AdministrativoField"] // String = "" //" <- map["location"] // "sample string 29",
     saldo_DisponibleField <- map["saldo_DisponibleField"] // Double = 0 //" <- map["location"] // 30.0,
     saldo_DisponibleFieldSpecified <- map["saldo_DisponibleFieldSpecified"] // Bool = false //" <- map["location"] // true,
     saldo_VencidosField <- map["saldo_VencidosField"] // Double = 0 //" <- map["location"] // 32.0,
     saldo_VencidosFieldSpecified <- map["saldo_VencidosFieldSpecified"] // Bool = false //" <- map["location"] // true,
     saldoField <- map["saldoField"] // Double = 0 //" <- map["location"] // 34.0,
     saldoFieldSpecified <- map["saldoFieldSpecified"] // Bool = false//": true,
    }
}

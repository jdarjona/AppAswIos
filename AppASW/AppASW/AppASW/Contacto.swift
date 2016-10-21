//
//  Contacto.swift
//  AppASW
//
//  Created by Administrador on 13/10/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import Foundation
import ObjectMapper

public class Contacto:NSObject, Mappable {
    
    
     var keyField: String = "" // 1 ,
     var noField: String = "" // 2 ,
     var typeField: Int = 0 //,
     var typeFieldSpecified: Bool = true //,
     var company_NoField: String = "" // 4 ,
     var company_NameField: String = "" // 5 ,
     var nameField: String = "" // 6 ,
     var addressField: String = "" // 7 ,
     var address_2Field: String = "" // 8 ,
     var post_CodeField: String = "" // 9 ,
     var countyField: String = "" // 10 ,
     var cityField: String = "" // 11 ,
     var country_Region_CodeField: String = "" // 12 ,
     var search_NameField: String = "" // 13 ,
     var phone_NoField: String = "" // 14 ,
     var salesperson_CodeField: String = "" // 15 ,
     var mobile_Phone_NoField: String = "" // 16 ,
     var fax_NoField: String = "" // 17 ,
     var telex_NoField: String = "" // 18 ,
     var e_MailField: String = "" // 19 ,
     var home_PageField: String = "" // 20 ,
     var language_CodeField: String = "" // 21 ,
     var integrationCustomerNoField: String = "" // 22 ,
     var first_NameField: String = "" // 23 ,
     var middle_NameField: String = "" // 24 ,
     var surnameField: String = "" // 25 ,
     var currency_CodeField: String = "" // 26 ,
     var territory_CodeField: String = "" // 27 ,
     var vAT_Registration_NoField: String = "" // 28 ,
     var no_SeriesField: String = "" // 29 ,
     var job_TitleField: String = "" // 30 ,
     var email_AdministrativoField: String = "" // 31 ,
     //var PropertyChanged : null
    
    override init() {
        super.init()
    }
    
    convenience required public init?(map: Map){
        self.init()
    }
    
    public func mapping(map: Map) {
  
         keyField <- map["keyField"] // String = "" // 1 ,
         noField <- map["noField"] // String = "" // 2 ,
         typeField <- map["typeField"] // Int = 0 //,
         typeFieldSpecified <- map["typeFieldSpecified"] // Bool = true //,
         company_NoField <- map["company_NoField"] // String = "" // 4 ,
         company_NameField <- map["company_NameField"] // String = "" // 5 ,
         nameField <- map["nameField"] // String = "" // 6 ,
         addressField <- map["addressField"] // String = "" // 7 ,
         address_2Field <- map["address_2Field"] // String = "" // 8 ,
         post_CodeField <- map["post_CodeField"] // String = "" // 9 ,
         countyField <- map["countyField"] // String = "" // 10 ,
         cityField <- map["cityField"] // String = "" // 11 ,
         country_Region_CodeField <- map["country_Region_CodeField"] // String = "" // 12 ,
         search_NameField <- map["search_NameField"] // String = "" // 13 ,
         phone_NoField <- map["phone_NoField"] // String = "" // 14 ,
         salesperson_CodeField <- map["salesperson_CodeField"] // String = "" // 15 ,
         mobile_Phone_NoField <- map["mobile_Phone_NoField"] // String = "" // 16 ,
         fax_NoField <- map["fax_NoField"] // String = "" // 17 ,
         telex_NoField <- map["telex_NoField"] // String = "" // 18 ,
         e_MailField <- map["e_MailField"] // String = "" // 19 ,
         home_PageField <- map["home_PageField"] // String = "" // 20 ,
         language_CodeField <- map["language_CodeField"] // String = "" // 21 ,
         integrationCustomerNoField <- map["integrationCustomerNoField"] // String = "" // 22 ,
         first_NameField <- map["first_NameField"] // String = "" // 23 ,
         middle_NameField <- map["middle_NameField"] // String = "" // 24 ,
         surnameField <- map["surnameField"] // String = "" // 25 ,
         currency_CodeField <- map["currency_CodeField"] // String = "" // 26 ,
         territory_CodeField <- map["territory_CodeField"] // String = "" // 27 ,
         vAT_Registration_NoField <- map["vAT_Registration_NoField"] // String = "" // 28 ,
         no_SeriesField <- map["no_SeriesField"] // String = "" // 29 ,
         job_TitleField <- map["job_TitleField"] // String = "" // 30 ,
         email_AdministrativoField <- map["email_AdministrativoField"] // String = ""
    }

    
   

}

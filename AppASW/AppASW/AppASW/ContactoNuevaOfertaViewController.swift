//
//  ContactoNuevaOfertaViewController.swift
//  AppASW
//
//  Created by Administrador on 23/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import UIKit



class ContactoNuevaOfertaViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate{

    var contactos:[Contacto] = [Contacto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contactos = ManagerVentas.contacto.filter({$0.company_NameField == ManagerVentas.nuevaOferta.sell_to_Customer_NameField})
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contactos.count
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactoVentaCell", for: indexPath) as! ContactoVentaViewCell
        
        let i = (indexPath as NSIndexPath).row
        
        //let numberFormatter = NumberFormatter()
        //let id = numberFormatter.stringFromNumber(contactos[i].noField)
        
        
        cell.label1ContactoVenta.text = "Contacto: " + contactos[i].nameField
        cell.label2ContactoVenta.text = "Tel.: " + contactos[i].phone_NoField
        cell.label3ContactoVenta.text = "Cargo: " + contactos[i].job_TitleField
        cell.idContacto = contactos[i].noField //Insertar en la nueva oferta Nº de Contacto
        
        return cell
    
    }
    
    
////     MARK: PrepareForSegue
//    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        let celda = sender as! ContactoVentaViewCell
//        ManagerVentas.nuevaOferta.idAlmacenField = celda.label1ContactoVenta;
//        
//    }
}

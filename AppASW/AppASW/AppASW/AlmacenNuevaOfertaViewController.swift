//
//  AlmacenNuevaOfertaViewController.swift
//  AppASW
//
//  Created by Administrador on 23/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import UIKit

class AlmacenNuevaOfertaViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate{

    
    var almacen:[Almacen] = [Almacen]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.almacen = ManagerVentas.almacenes.filter({$0.idClienteField == ManagerVentas.nuevaOferta.noField})
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return almacen.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlmacenVentaCell", for: indexPath) as! AlmacenVentaViewCell
        
        let i = (indexPath as NSIndexPath).row
        
        //let numberFormatter = NumberFormatter()
        //let id = "\(almacen[i].idAlmacenField)"
        
        cell.label2AlmacenVenta.text = almacen[i].nombreAlmacenField
        cell.label1AlmacenVenta.text = ""//String(id)
        
        cell.label3AlmacenVenta.text = ""//"Comercial: " + almacen[i].idComercialField
        
        cell.idAlmacen = almacen[i].idAlmacenField
        
        return cell
        
    }

    // MARK: PrepareForSegue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let celda = sender as! AlmacenVentaViewCell
        ManagerVentas.nuevaOferta.idAlmacenField = celda.idAlmacen;
        
    }

    // MARK: SearchBar
    
//    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
//        
//        if let textoBusqueda = searchBar.text {
//            if textoBusqueda != "" {
//                self.cliente = ManagerVentas.almacenes.filter({$0.nameField.lowercaseString.containsString(textoBusqueda.lowercaseString) &&
//                    ($0.salesperson_CodeField == ManagerLogin.salesPerson)})
//            }else {
//                self.cliente = ManagerVentas.almacenes.filter({$0.salesperson_CodeField == ManagerLogin.salesPerson})
//            }
//            self.clienteTableView.reloadData()
//            
//            
//        }
//        
//    }
    
}

//
//  NuevaOfertaViewCOntroller.swift
//  AppASW
//
//  Created by Administrador on 22/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import UIKit

class ClienteNuevaOfertaViewCOntroller: UIViewController ,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate
{
    
    
    var cliente:[Clientes] = [Clientes]()
    var clienteSouce:[Clientes] = [Clientes]()
    
    
    
    @IBOutlet weak var clienteTableView: UITableView!
    @IBOutlet weak var clienteIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var searchBarClientes: UISearchBar!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.searchBarClientes.delegate = self
        
        //ManagerJson.basicURL = "http://intranet.trh-be.com/WSTRH/%@"
        self.cliente = ManagerVentas.clientes
        
    }

    
    // MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return cliente.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClienteVentaCell", for: indexPath) as! ClienteVentaViewCell
        
        let i = (indexPath as NSIndexPath).row
        
        //Formato Números
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "es_ES")

        cell.clienteLabel.text = cliente[i].nameField
        cell.saldoClienteLabel.text  = "Saldo: " + formatter.string(from: (cliente[i].saldoField as NSNumber))!
        cell.creditoMaxClienteLabel.text =  "Crédito Max.: " + formatter.string(from: (cliente[i].cred_Max_CESCEField) as NSNumber)!
        cell.codCliente = cliente[i].noField
        
        return cell
        
    }
 
    // MARK: PrepareForSegue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let celda = sender as! ClienteVentaViewCell
        ManagerVentas.nuevaOferta.noField = celda.codCliente;
        ManagerVentas.nuevaOferta.sell_to_Customer_NameField = celda.clienteLabel.text!
        
    }
    

    // MARK: SearchBar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if let textoBusqueda = searchBar.text {
            if textoBusqueda != "" {
                self.cliente = ManagerVentas.clientes.filter({$0.nameField.lowercased().contains(textoBusqueda.lowercased()) &&
                    ($0.salesperson_CodeField == ManagerLogin.salesPerson)})
            }else {
                self.cliente = ManagerVentas.clientes.filter({$0.salesperson_CodeField == ManagerLogin.salesPerson})
            }
                self.clienteTableView.reloadData()
            
            
        }

    }
    
    
}

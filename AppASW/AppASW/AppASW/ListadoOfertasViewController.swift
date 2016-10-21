//
//  ListadoOfertasViewController.swift
//  AppASW
//
//  Created by Administrador on 22/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//
import Foundation
import UIKit

class ListadoOfertasViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var ListadoOfertas: UITableView!

    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                    return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ListadoOfertasTableViewCell = ListadoOfertasTableViewCell()
        
        //cell.clienteLabel.text="Hola"
        return cell
    }
}

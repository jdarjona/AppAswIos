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

    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                    return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:ListadoOfertasTableViewCell = ListadoOfertasTableViewCell()
        
        //cell.clienteLabel.text="Hola"
        return cell
    }
}

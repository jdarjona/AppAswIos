//
//  MenuControllerTableViewController.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 2/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import UIKit

class MenuControllerTableViewController: UITableViewController {

    struct Menu {
    
        let Menu:String
        let Segue:String
    }
    
    var itemMenu:[Menu] = []
    
    
    fileprivate var previousIndex: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemMenu.append(Menu(Menu: "Monitor Carga", Segue: "MonitorizacionCarga"))
        itemMenu.append(Menu(Menu: "Sinóptico", Segue: "SinopticoFabrica"))
        itemMenu.append(Menu(Menu: "AppVentas", Segue: "OfertaVentas"))
        /*asdf*/
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemMenu.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell")!
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        cell.textLabel?.text = itemMenu[(indexPath as NSIndexPath).row].Menu
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let index = previousIndex {
            tableView.deselectRow(at: index, animated: true)
        }
        
        sideMenuViewController?.performSegue(withIdentifier: itemMenu[(indexPath as NSIndexPath).row].Segue, sender: nil)
        previousIndex = indexPath
    }
}

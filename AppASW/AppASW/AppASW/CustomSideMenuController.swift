//
//  CustomSideMenuController.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 1/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import UIKit
import SideMenuController
class CustomSideMenuController: SideMenuController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        performSegueWithIdentifier("MonitorizacionCarga", sender: nil)
        performSegueWithIdentifier("containSideMenu", sender: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

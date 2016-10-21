//
//  CustomSideMenuController.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 1/9/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import UIKit
import AKSideMenu
import Reachability


public class RootViewController: AKSideMenu, AKSideMenuDelegate {
    @IBOutlet weak var networkStatus: UILabel!
    @IBOutlet weak var hostNameLabel: UILabel!
    var reachability: Reachability?
    
    override public func awakeFromNib() {
        
        self.menuPreferredStatusBarStyle = UIStatusBarStyle.lightContent
        self.contentViewShadowColor = UIColor.black
        self.contentViewShadowOffset = CGSize(width: 0, height: 0)
        self.contentViewShadowOpacity = 0.6
        self.contentViewShadowRadius = 12
        self.contentViewShadowEnabled = true
        
        self.contentViewController = self.storyboard!.instantiateViewController(withIdentifier: "contentViewController")
        self.leftMenuViewController = self.storyboard!.instantiateViewController(withIdentifier: "leftMenuViewController")
        self.rightMenuViewController = UIViewController() //self.storyboard!.instantiateViewController(withIdentifier: "rightMenuViewController")
        self.backgroundImage = UIImage.init(named: "Stars")
        self.delegate = self
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - <AKSideMenuDelegate>
    
    public func sideMenu(_ sideMenu: AKSideMenu, willShowMenuViewController menuViewController: UIViewController) {
        print("willShowMenuViewController")
    }
    
    public func sideMenu(_ sideMenu: AKSideMenu, didShowMenuViewController menuViewController: UIViewController) {
        print("didShowMenuViewController")
    }
    
    public func sideMenu(_ sideMenu: AKSideMenu, willHideMenuViewController menuViewController: UIViewController) {
        print("willHideMenuViewController")
    }
    
    public func sideMenu(_ sideMenu: AKSideMenu, didHideMenuViewController menuViewController: UIViewController) {
        print("didHideMenuViewController")
    }
}

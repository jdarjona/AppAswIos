//
//  AppDelegate.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 3/7/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import UIKit
import Firebase
import SideMenuController
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        FIRApp.configure()
        
        // Override point for customization after application launch.
        
        // Handle launching from a notification
        
        if let options = launchOptions {
            // Do your checking on options here
            let locationNotification:UILocalNotification? = options[UIApplicationLaunchOptionsLocalNotificationKey] as? UILocalNotification
        
            if locationNotification != nil {
                // Set icon badge number to zero
                application.applicationIconBadgeNumber = 0;
            }
        }
        application.applicationSupportsShakeToEdit = true
        SideMenuController.preferences.drawing.menuButtonImage = UIImage(named: "menu")
        SideMenuController.preferences.drawing.sidePanelPosition = .OverCenterPanelLeft
        SideMenuController.preferences.drawing.sidePanelWidth = 300
        SideMenuController.preferences.drawing.centerPanelShadow = true
        SideMenuController.preferences.animating.statusBarBehaviour = .ShowUnderlay
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        
       application.applicationIconBadgeNumber = 0
        if  let scheduledNotifications = UIApplication.sharedApplication().scheduledLocalNotifications {
            let notificaciones = scheduledNotifications.count
            application.applicationIconBadgeNumber = notificaciones
        
        }
        
        
        
    }
    
    
    
  }


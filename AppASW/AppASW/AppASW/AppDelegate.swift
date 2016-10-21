//
//  AppDelegate.swift
//  AppASW
//
//  Created by Juan de Dios Arjona on 3/7/16.
//  Copyright © 2016 Juande. All rights reserved.
//

import UIKit
import Firebase
import AKSideMenu
import Reachability
import NetworkExtension
import SystemConfiguration.CaptiveNetwork
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AKSideMenuDelegate  {

    var window: UIWindow?
    private var reachability:Reachability!;

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        FIRApp.configure()
       
        if let options = launchOptions {
            // Do your checking on options here
            let locationNotification:UILocalNotification? = options[UIApplicationLaunchOptionsKey.localNotification] as? UILocalNotification
        
            if locationNotification != nil {
                // Set icon badge number to zero
                application.applicationIconBadgeNumber = 0;
            }
        }
        application.applicationSupportsShakeToEdit = true

//        do {
//            try reachability?.startNotifier()
//        } catch {
//            print("Unable to start notifier")
//        }
//        //NotificationCenter.default.addObserver(self, selector:Selector(("checkForReachability:")), name: ReachabilityChangedNotification, object: nil);
        self.reachability = Reachability.forInternetConnection();//reachabilityForInternetConnection();
        self.reachability.startNotifier()
        
        let conect=checkForReachability()
//        
//        let ssid = fetchSSIDInfo()
//
//        ManagerJson.establecerRuta(conect: conect,ssid: ssid)
//        
//        print(ssid)

        
        
        return true
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    open func sideMenu(_ sideMenu: AKSideMenu, willShowMenuViewController menuViewController: UIViewController) {
        print("willShowMenuViewController")
    }
    
    open func sideMenu(_ sideMenu: AKSideMenu, didShowMenuViewController menuViewController: UIViewController) {
        print("didShowMenuViewController")
    }
    
    open func sideMenu(_ sideMenu: AKSideMenu, willHideMenuViewController menuViewController: UIViewController) {
        print("willHideMenuViewController")
    }
    
    open func sideMenu(_ sideMenu: AKSideMenu, didHideMenuViewController menuViewController: UIViewController) {
        print("didHideMenuViewController")
    }
    
    func checkForReachability() -> String
    {
        // Remove the next two lines of code. You cannot instantiate the object
        // you want to receive notifications from inside of the notification
        // handler that is meant for the notifications it emits.
        var conection="";
        let networkReachability = Reachability.forInternetConnection()
        networkReachability?.startNotifier()
        
        //let networkReachability = notification.object as! Reachability;
        let remoteHostStatus = networkReachability?.currentReachabilityStatus()
        
        
        if (remoteHostStatus?.hashValue == NetworkStatus.NotReachable.hashValue)
        {
            conection = "Sin Conexion"
            print("Not Reachable")
        }
        else if (remoteHostStatus?.hashValue == NetworkStatus.ReachableViaWiFi.hashValue)
        {
            conection = "Conexion Wifi"
            print("Reachable via Wifi")
        }
        else if (remoteHostStatus?.hashValue == NetworkStatus.ReachableViaWWAN.hashValue)
        {
            conection = "Conexion WWAN"
            print("Reachable via WWAN")
        }
        
        return conection
    }
    
    public static func fetchSSIDInfo() -> String {
        var currentSSID = ""
        if let interfaces = CNCopySupportedInterfaces() {
            for i in 0..<CFArrayGetCount(interfaces) {
                let interfaceName: UnsafeRawPointer = CFArrayGetValueAtIndex(interfaces, i)
                let rec = unsafeBitCast(interfaceName, to: AnyObject.self)
                let unsafeInterfaceData = CNCopyCurrentNetworkInfo("\(rec)" as CFString)
                if unsafeInterfaceData != nil {
                    let interfaceData = unsafeInterfaceData! as NSDictionary!
                    currentSSID = interfaceData?["SSID"] as! String
                }
            }
        }
        return currentSSID
    }
  }


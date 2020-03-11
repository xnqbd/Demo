//
//  AppDelegate.swift
//  Demo
//
//  Created by admin2 on 2020/1/20.
//  Copyright © 2020 admin2. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        print("AppDelegate  \(window)")
        
        IQKeyboardManager.shared().isEnabled = true
//        [IQKeyboardManager sharedManager].enable = YES;
    
        
        DMLoginManager.manager.loginStateInit()
        
        window?.makeKeyAndVisible()
        
        
        return true
    }


}


//
//  AppDelegate.swift
//  MVVMCodeUi
//
//  Created by slava zolotov on 22/08/2019.
//  Copyright © 2019 slava zolotov. All rights reserved.
//

import UIKit
import DITranquillity

func dilog(level: DILogLevel, msg: String) {
    switch level {
    case .error:
        print("ERR: " + msg)
    case .warning:
        print("WRN: " + msg)
    case .info:
        print("INF: " + msg)
    case .verbose, .none:
        break
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    static let container = DIContainer()
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        DISetting.Log.fun = dilog
        AppDelegate.container.append(framework: CoreFramework.self)
        AppDelegate.container.append(framework: AppFramework.self)
        
        if !AppDelegate.container.validate() {
            fatalError()
        }
        
        AppDelegate.container.initializeSingletonObjects()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let routingService : RoutingService = AppDelegate.container.resolve()
        let rootController = routingService.getFirstController()
        AppDelegate.container.inject(into: rootController)
        let navigationController = UINavigationController(rootViewController: rootController)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}


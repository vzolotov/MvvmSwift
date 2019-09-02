//
//  RoutingService.swift
//  MVVMCodeUi
//
//  Created by slava zolotov on 24/08/2019.
//  Copyright © 2019 slava zolotov. All rights reserved.
//

import UIKit
import Foundation
//сервис навигации, доступен из 
class RoutingService : RoutingProtocol {
    let settingsService : AppSettingsProtocol
    init(settingsService : AppSettingsProtocol) {
        self.settingsService = settingsService
    }
    func canGoBack() -> Bool {
        if let navigationController = UIApplication.getNavigationController(){
            return navigationController.viewControllers.count > 0
        }
        else{
            return false
        }
    }
    
    func goBack(){
        let navigationController = UIApplication.getNavigationController()
        if canGoBack(){
            navigationController?.popViewController(animated: true)
        }
    }
    
    func navigateTo(viewModelType: String, with: AnyObject?) {
        var name = "MVVMCodeUi." + viewModelType
        name = name.replacingOccurrences(of: "Model", with: "Controller")
        if let classType = NSClassFromString(name) as? UIViewController.Type{
            let controller = classType.init(nibName: nil, bundle: nil)
            let navigationController = UIApplication.getNavigationController()
            if let baseView = controller as? ViewProtocol{
                baseView.setNavigationParam(with: with)
            }
            let container = AppDelegate.container;
            container.inject(into: controller)
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func navigateToLogin(){
        let controller = LoginViewController(nibName: nil, bundle: nil)
        UIApplication.shared.keyWindow?.rootViewController = controller
    }
    
    func getFirstController() -> UIViewController {
        if settingsService.isFirstLaunch{
            return LoginViewController(nibName: nil, bundle: nil)
        }else if settingsService.isAuth {
            return MainViewController(nibName: nil, bundle: nil)
        }else{
            return LoginViewController(nibName: nil, bundle: nil)
        }
    }
}

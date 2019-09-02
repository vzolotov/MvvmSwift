//
//  RoutingProtocol.swift
//  MVVMCodeUi
//
//  Created by slava zolotov on 24/08/2019.
//  Copyright © 2019 slava zolotov. All rights reserved.
//

import Foundation
import UIKit

protocol RoutingProtocol {
    func navigateTo(viewModelType : String, with : AnyObject?)
    func navigateToLogin()
    func canGoBack() -> Bool
    func getFirstController() -> UIViewController
    func goBack()
}

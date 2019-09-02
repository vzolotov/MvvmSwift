//
//  AppFramework.swift
//  MVVMCodeUi
//
//  Created by slava zolotov on 22/08/2019.
//  Copyright © 2019 slava zolotov. All rights reserved.
//

import UIKit
import DITranquillity

class AppFramework: DIFramework {
    static func load(container: DIContainer) {
        container.import(CoreFramework.self)
        //services
        //view models
        container.register(LoginViewModel.init)
        container.register(MainViewModel.init)
        //views
        container.register(LoginViewController.init)
            .injection{$0.viewModel = $1}
        container.register(MainViewController.init)
            .injection{$0.viewModel = $1}
    }
}

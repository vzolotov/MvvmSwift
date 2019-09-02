//
//  CoreFramework.swift
//  MVVMCodeUi
//
//  Created by slava zolotov on 22/08/2019.
//  Copyright © 2019 slava zolotov. All rights reserved.
//

import DITranquillity

class CoreFramework: DIFramework {
    static func load(container: DIContainer) {
        container.import(AppFramework.self)
        container.register(RoutingService.init).as(RoutingProtocol.self)
        container.register(AppSettingsService.init).as(AppSettingsProtocol.self)
    }
}

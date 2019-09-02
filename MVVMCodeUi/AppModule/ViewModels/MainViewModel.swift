//
//  MainViewModel.swift
//  MVVMCodeUi
//
//  Created by slava zolotov on 24/08/2019.
//  Copyright © 2019 slava zolotov. All rights reserved.
//

import UIKit

class MainViewModel: ViewModelBase{
    override init(routingService: RoutingProtocol) {
        super.init(routingService: routingService)
    }
    
    override func onNavigatedTo(with: AnyObject?) {
        
    }
    
    override func onNavigatedFrom() {
        
    }
}

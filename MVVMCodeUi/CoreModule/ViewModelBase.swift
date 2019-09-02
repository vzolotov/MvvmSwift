//
//  ViewModelBase.swift
//  MVVMCodeUi
//
//  Created by slava zolotov on 24/08/2019.
//  Copyright © 2019 slava zolotov. All rights reserved.
//
import Foundation

class ViewModelBase : NSObject {
    let routingService : RoutingProtocol
    
    init(routingService : RoutingProtocol) {
        self.routingService = routingService
    }
    
    func onNavigatedTo(with : AnyObject?){
        
    }
    
    func onNavigatedFrom(){
        
    }
}

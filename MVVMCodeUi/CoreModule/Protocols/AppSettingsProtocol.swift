//
//  SettingsProtocol.swift
//  MVVMCodeUi
//
//  Created by slava zolotov on 01/09/2019.
//  Copyright © 2019 slava zolotov. All rights reserved.
//

import UIKit

protocol AppSettingsProtocol{
    var isFirstLaunch : Bool{get set}
    var isAuth : Bool {get set}
    var Token : String {get set}
}

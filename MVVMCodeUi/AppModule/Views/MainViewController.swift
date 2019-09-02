//
//  MainViewController.swift
//  MVVMCodeUi
//
//  Created by slava zolotov on 24/08/2019.
//  Copyright © 2019 slava zolotov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, ViewProtocol {
    
    var viewModel : MainViewModel!
    var param : AnyObject? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.onNavigatedTo(with: param)
    }
    
    func setNavigationParam(with: AnyObject?) {
        param = with
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewModel.onNavigatedFrom()
    }
}

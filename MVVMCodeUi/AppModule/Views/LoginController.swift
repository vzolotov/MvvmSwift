//
//  ViewController.swift
//  MVVMCodeUi
//
//  Created by slava zolotov on 22/08/2019.
//  Copyright © 2019 slava zolotov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, ViewProtocol{
    var viewModel : LoginViewModel?
    var param : AnyObject? = nil
    var isNavigated : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onNavigatedTo(with: param)
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.red
        let button = UIButton(type: .system) as UIButton
        let xPostion:CGFloat = 50
        let yPostion:CGFloat = 100
        let buttonWidth:CGFloat = 150
        let buttonHeight:CGFloat = 45
        
        button.frame = CGRect(x:xPostion, y:yPostion, width:buttonWidth, height:buttonHeight)
        button.setTitle("Goto next", for: .normal)
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
        self.definesPresentationContext = true
    }
    
    @objc func buttonAction(sender: UIButton!) {
        viewModel?.routingService.navigateTo(viewModelType: "MainViewModel", with: NSObject())
    }
    
    func setNavigationParam(with: AnyObject?) {
        param = with
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        viewModel?.onNavigatedFrom()
        super.viewWillDisappear(animated)
    }
}

